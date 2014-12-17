// Playground - noun: a place where people can play

import UIKit

// First we show the beginnings of an intuitive but not
// particular "functional programming" way to model 
// Conway's Game of Life.


// Conway's Game of Life takes place over a 2D grid,
// which changes over time as cells live and die.
// So we represent the grid as a board, a 10x10 2D array
// of Boolean values.

class MCell : NSObject {
  var alive:Bool
  override init() { self.alive = false }
}

class MGrid {
  var columns:NSMutableArray
  init() {
    var column = NSMutableArray()
    for rowIndex in 0..<10 {
      column.addObject(MCell())
    }

    var grid = NSMutableArray()
    for columnIndex in 0..<10 {
      grid.addObject(column)
    }

    self.columns = grid
  }

  func isCellAliveAt(columnIndex:Int,_ rowIndex:Int) -> Bool
  {
    return self.columns[columnIndex][rowIndex].alive
  }
  
  func setCell(columnIndex:Int,_ rowIndex:Int,_ alive:Bool) -> Void {
    (self.columns[columnIndex][rowIndex] as MCell).alive = alive
  }
}

var g = MGrid()

// now we have a 1x10 column cells

// verify our getter/setter works
g.isCellAliveAt(0, 0)
g.setCell(0, 0, true)
g.isCellAliveAt(0, 0)

// or does it...?

// STEP 1:

g.isCellAliveAt(1, 0)

// STEP 2:








