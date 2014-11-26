// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*

STARTER:
- provides functioning VC and GridView
- underlying model class "Cell" is not implemented
- game logic activeCellForCells is not implemented

DEMO:
- discuss choice for data structure representing a board
- implement Cell and discuss requirements and nature of value semantics
- implement activeCellsForCells

Lab tasks:

1. simplify activeCellsFromCells by factoring out `frequencies`
2. simplify by facotring out `mapcat`

Challenge: 

3. implement both mapcat and frequencies using reduce
4. simplify activeCellsFromCells so that:
- it uses no loops or var declarations
- it uses stdlib.map, StdLib.filter,
- it uses your implementation of mapcat and frequencies
- these implemenations use only reduce, and a minimum of var

*/


/*

Let us say there are three kinds of FP style:

(1) Typed FP.

A rich static type system, facilitating abstractions like Applicative and Monad. Typical of languages like Haskell, SML, etc..

(2) Typefree FP.

Dynamic type system, and with functions like apply, and easy use of plain data as a lowest common denominator. Typical of languages like Clojure, Scheme, Erlang.

(3) small-f fp. 

Merely the deliberate use of pure functions, immutable values, and higher order functions whenever possible. This style is idiomatic in all functional languages.

You can do all of these in Swift.

But this tutorial will really just illustrate idioms that to support (3).

*/


// MARK: - functions and values

// MARK: functions

//
// discussion: what are functions?
//

// slide: domain to codomain


// example: predicates
func isBig(x:Int) -> Bool { return x > 42 }

// example: integer
func increment(x:Int) -> Int { return x + 1 }

// example: transformation
func stringToObj(s:String) -> AnyObject?
{
  if let data = s.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
  {
    var error:NSError?
    if let obj = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error) as? NSDictionary
    {
      return obj
    }
  }
  return nil
}

// MARK: - values

// discussion: what are values?

// slide: a name for a number, vs a name for a box.

// value: a constant name for an an immutable object, whose identity is irrelevant

let meaningOfLife = 42
let capitalOfTheNorth = "Winterfell"
let houses = [
  "North": [1100,["family":"Stark", "seat":"Winterfell"]],
  "NorthWest": [200,["family":"Greyjoy", "seat":"Iron Island's"]],
  "West": [900,["family":"Martell", "seat":"Sunspear"]],
]

// not values: any reference that can change or points to a thing that can change
var youth = NSMutableArray(objects: NSNumber(integer: 10), NSNumber(integer: 30))
let middleAge = NSMutableArray(objects: NSNumber(integer: 50), NSNumber(integer: 70))

//
// MARK: - higher-order functions
//

let names = ["Wintefell", "King's Landing", "Casterly Rock", "Eyrie"]

// MARK: map

// cocoa map
func cocoa_map(f:(AnyObject) -> AnyObject, items:NSArray) -> NSArray
{
  var result = NSMutableArray(capacity: items.count)
  for item in items {
    result.addObject(f(item))
  }
  return NSArray(array: result)
}

// Swift map
// map

// MARK: filter

// cocoa filter
func cocoa_filter(pred:(AnyObject) -> Bool, items:NSArray) -> NSArray
{
  let predicate = NSPredicate { (obj:AnyObject!, opts:[NSObject : AnyObject]!) -> Bool in
    return pred(obj)
  }
  return items.filteredArrayUsingPredicate(predicate)
}

// Swift filter
// filter

// cocoa reduce


// Swift reduce
//reduce


//
// MARK: - style
//

// MARK: prefer constants to variables

// bad
var xA:Int?
xA = 42

// good
let xB = 42

// MARK: declare new constants

// bad
var arrayA = ["b","c","a"]
arrayA.sort({ $0 < $1 })

// good
let arrayB = ["b","c","a"]
let arrayB2 = arrayB.sorted({ $0 < $1 })

// why? every state is descriptively named
// exception: accumulating variable like "result"

// MARK

