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


/*

## Observation


Cocoa/Swift are poorly suited for functional, value-oriented programming in some ways,
for instance, in the hassle of creating value objects.

A value object is an object like NSNumber -- immutable and equal to its peers based on its contents 
(its value), with no meaningful notion of equality based on object identity. A value object lets you 
write functions as if they are consuming and returning values, not memory locations.

But consider all the requirements to implement a class for representing value objects, which
can be smoothly used with the frameworks:

- boilerplate to initialize all members
- boilerplate to define equality based on the members
- possibly tricky boilerplate to define a hashing function
- a fairly subtle understanding of the interaction between immutable value semantics and storage management, in order to implement NSCopying

It is regrettable that it takes 50+ LOC to produce a class which only contains two integers,
which can be used conveniently with the framework's collection types.

There are many functional styles. But from the Clojure point of view, this is one reason to
dispense with custom data types in most cases and just use dictionaries. You have the hassle
of boxing and unboxing, but out of the box they give you equality, hashing, a literal 
representation, and a variety of general purpose accessors.

The folder group "unused_CocoaStyle" shows an alternative implementation in this style,
using Cocoa collections and NSDictionary.

*/


