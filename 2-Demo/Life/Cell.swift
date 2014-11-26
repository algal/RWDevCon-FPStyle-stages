//
//  Cell.swift
//  Life
//
//  Created by Alexis Gallagher on 2014-11-24.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import Foundation

/// Immutable class representing a location on a grid
///
/// Note: This represents only a grid location, not the _state_ of that location
/// (i.e., active or inactive). To represent the overall state of
/// of a board, we use a collection containing only the active locations
class Cell : NSObject
{
  let x:Int
  let y:Int
  
  init(x:Int,y:Int) {
    self.x = x
    self.y = y
  }
}

// MARK: Equatable

/// Two cells are equal iff all their members are equal
func ==(lhs: Cell, rhs: Cell) -> Bool
{
  return
    lhs.x == rhs.x && lhs.y == rhs.y
}

// MARK: Hashable

/// A cell's hash is simply based on its contents, since it is immutable
extension Cell : Hashable {
  override var hashValue : Int {
    return self.x.hashValue ^ self.y.hashValue
  }
}

