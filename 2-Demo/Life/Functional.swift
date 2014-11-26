//
//  Functional.swift
//  Life
//
//  Created by Alexis Gallagher on 2014-11-24.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import Foundation

// MARK: mapcat

/**
Returns the results of concatenating the arrays produced by transforming every element in source. (Called concatMap in Haskell, mapcat in Clojure)

:param: source sequence of elements, to be transformed
:param: transform function taking an element of source element to an array of `T`
:returns: Array<T>
*/
func mapcat<S : SequenceType, T>(source:S, transform: (S.Generator.Element) -> [T]) -> [T]
{
  var result = [T]()
  // for every item ...
  for item in source {
    // .. generate a group ..
    let group = transform(item)
    // and for every result in the group ...
    for r in group {
      // ... add it to our final result list
      result.append(r)
    }
  }
  return result
}

// MARK: frequency

/**
Calculates frequencies of of values in `items`. Uses a traditional 
iteration based on iteration, instead of reduction.

:param: items a collection of values

:returns: Dictionary with frequencies of items
*/
func frequencies<T : Hashable>(coll:[T]) -> Dictionary<T,Int>
{
  var d = [T:Int]()
  for obj in coll {
    if let count = d[obj] {
      d[obj] = count + 1
    }
    else {
      d[obj] = 1
    }
  }
  return d
}

