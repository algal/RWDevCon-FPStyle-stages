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
  var result:[T] = []
  for g in groups {
    result = result + g
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

//
// notes on reduce
//

/**
In Haskell, for instance, `reduce` is called foldl, for "fold left", and it is defined as a curried function.

:param: combine reducing function
:param: initial initial value of the result type
:param: items array of items to reduce

*/
func foldl<A,B>(#combine:(B,A)->B)(initial:B)(items:[A]) -> B
{
  return reduce(items,initial,combine)
}

/*
Because it is defined in curried form,
you can use partial application to define
functions based on foldl.

This sort of idiom is more natural in Haskell,
where is is supported by various language
features -- i.e., all functions are curried by default,
compiler tail-call elimination which allows recursion with
only constant storage, and a syntax which privileges 
function application
*/
let mySum = foldl(combine:+)(initial: 0)
let calculatedTotal = mySum(items: [5,6,7]) // => 18

let myProduct = foldl(combine:*)(initial:1)
let calculatedProduct = myProduct(items: [5,6,7]) // => 210





