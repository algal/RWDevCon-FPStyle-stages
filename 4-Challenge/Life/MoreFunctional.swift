//
//  MoreFunctional.swift
//  Life
//
//  Created by Alexis Gallagher on 2014-11-25.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import Foundation


// unused



/**

Returns an array stripped of duplicates, without preserving order.

(As Swift standard library does not yet incldue a Set data type, we
will just use Array and uniq it when needed.)

:param: items an array
:returns: an array, stripped of duplicates, with order possibly changed
*/
func uniq<T:Hashable>(items:[T]) -> [T]
{
  var dict = Dictionary<T,Bool>()
  items.map({ dict.updateValue(true, forKey: $0) })
  return Array(dict.keys)
}

// MARK: merge

/// Returns a Dictionary formed by updating `d` with
/// all elements in d2
private func mergeDictionairyPair<T,U>(var d:[T:U],d2:[T:U]) ->[T:U]
{
  for (k,v) in d2 {   d.updateValue(v, forKey: k)   }
  return d
}

private func mergeDictionaryArray<T,U>(dictionaries:[[T:U]]) -> [T:U]
{
  return reduce(dictionaries,[T:U](),mergeDictionairyPair)
}

func merge<T,U>(dictionaries:[T:U]...) -> [T:U] {
  return mergeDictionaryArray(dictionaries)
}

//
// for the curious
//

/**
In Haskell, for instance, `reduce` is called foldr, for "fold right", and it is defined as a curried function.

:param: combine reducing function
:param: initial initial value of the result type
:param: items array of items to reduce

*/
func foldr<A,B>(#combine:(B,A)->B)(initial:B)(items:[A]) -> B
{
  return reduce(items,initial,combine)
}

/*
Because it is defined in curried form,
you can use partial application to define
functions based on foldr.

This sort of idiom is more natural in Haskell,
where is is supported by variouslanguage
features -- i.e., all functions are curried by default,
compiler tail-call elimination which provides better
memory usage, and a syntax which privileges function application
*/
let mySum = foldr(combine:+)(initial: 0)
let calculatedTotal = mySum(items: [5,6,7]) // => 18

let myProduct = foldr(combine:*)(initial:1)
let calculatedProduct = myProduct(items: [5,6,7]) // => 210


