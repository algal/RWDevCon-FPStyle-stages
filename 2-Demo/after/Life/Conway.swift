//
//  Conway.swift
//  Life
//
//  Created by Alexis Gallagher on 2014-11-23.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import UIKit


/**

Returns the cells active in the next time step. (pure)

:param: activeCells cells active currently
:returns: array of cells active in the next moment

style: uses HOFs
*/
func activeCellsOneStepAfter(activeCells:[Cell]) -> [Cell]
{
  // loop and build array of cells neighboring active cells
  var neighborings = [Cell]()
  for cell in activeCells {
    for neighborOfCell in neighbors(OfCell: cell) {
    neighborings.append(neighborOfCell)
    }
  }

  // loop and count duplicate neighborings
  var neighboringsPerCell = Dictionary<Cell,Int>()
  for neighboringCell in neighborings {
    if let value = neighboringsPerCell[neighboringCell] {
      neighboringsPerCell[neighboringCell] = value + 1
    }
    else {
      neighboringsPerCell[neighboringCell] = 1
    }
  }

  func isActiveNextStep(cell:Cell, neighboringCount:Int) -> Bool
  {
    return
      (neighboringCount == 3) ||
        (neighboringCount == 2 && find(activeCells,cell) != nil)
  }
  
  let neighboringsActiveNextStep:[(Cell,Int)] = filter(neighboringsPerCell, isActiveNextStep )
  let cellsActiveNextStep = map(neighboringsActiveNextStep, { ($0).0 } )

  return cellsActiveNextStep
}

/**
Returns all cells neighboring a cell. (Pure)

:param: cell a cell
:returns: array of neighboring cells
*/
private func neighbors(OfCell cell:Cell) -> [Cell]
{
  let deltas = [(-1,-1),(0,-1),(1,-1),
                (-1, 0),       (1,0 ),
                (-1, 1),(0, 1),(1, 1)]

  return map(deltas, { Cell(x: cell.x + $0.0, y: cell.y + $0.1) } )
}


