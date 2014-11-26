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
  let groups:[[T]] = map(source, transform)
  return reduce(groups, [T](), +)
}

// MARK: frequency

/**
Calculates frequencies of of values in `items`

:param: items a collection of values

:returns: Dictionary with frequencies of items
*/
func frequencies<T : Hashable>(coll:[T]) -> Dictionary<T,Int>
{
  return reduce(coll, [T:Int](), { (currentFreqs:[T:Int], item:T) -> [T:Int] in
    var updatedFreqs = currentFreqs
    updatedFreqs[item] = 1 + (updatedFreqs[item] ?? 0)
    return updatedFreqs
  })
}

/**
Calculates frequencies of of values in `items`. Uses a traditional 
iteration based on iteration, instead of reduction.

:param: items a collection of values

:returns: Dictionary with frequencies of items
*/
func frequenciesIterative<T : Hashable>(coll:[T]) -> Dictionary<T,Int>
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


