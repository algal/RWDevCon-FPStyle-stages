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
  /*
  Every cell in `neighborings` represents an instance of that cell
  being neighbored by one of the active cells. Since a cell can be neighbored
  on many sides, we expect duplicates
  */
  let neighborings : [Cell] = mapcat(activeCells, neighbors)
  
  /*
  This dictionary counts how many times each cell is neighbored
  by an active cell
  */
  let neighboringsPerCell = frequencies(neighborings)
  
  // loop, condition, build array
  var neighboringsActiveNextStep = [Cell]()
  for (theNeighbor,neighborCount) in neighboringsPerCell {
    if       (neighborCount == 3) ||
    (neighborCount == 2 && find(activeCells,theNeighbor) != nil)
    {
      neighboringsActiveNextStep.append(theNeighbor)
    }
  }

  return neighboringsActiveNextStep
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

