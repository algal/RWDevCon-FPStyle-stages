//
//  Cell+CocoaValue.swift
//  Life
//
//  Created by Alexis Gallagher on 2014-11-25.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import Foundation

/*

These extensions are required in order for Cell to behave as a value object
for use with Cocoa collections classes like NSSet, NSArray.

*/

// MARK: NSObjectProtocol

extension Cell {
  // Cocoa equality delegates to Swift equality
  override func isEqual(object: AnyObject?) -> Bool
  {
    if let otherCell = object as? Cell {
      return self == otherCell
    }
    else { return false }
  }
  
  // Cocoa hash delegates to Swift hashing
  override var hash : Int { return self.hashValue }
}


// MARK: NSCopying

extension Cell : NSCopying {
  /// Since this class is an immutable value object, object
  /// identity (===) is irrelevant and only value equality (==) has meaning.
  /// In this case, there is no need for physically separate copies
  func copyWithZone(zone: NSZone) -> AnyObject {
    // As this class is immutable, object identity is moot.
    return self
  }
}


