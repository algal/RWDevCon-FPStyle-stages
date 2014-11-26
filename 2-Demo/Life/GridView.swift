//
//  GridView.swift
//  Life
//
//  Created by Alexis Gallagher on 2014-11-23.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import UIKit

let kGridSquareSize : CGFloat = 25
let kGridSquareCount : Int = 1000
let GridOriginX : CGFloat = 0
let GridOriginY : CGFloat = 0

class GridView: UIView
{
  var activeCoords : [Cell] = Array<Cell>()
  
  override init(frame: CGRect) {
    super.init(frame:frame)
    self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("handleTap:")))
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("handleTap:")))
  }
  
  func flipCellAtCoords(coords:Cell) {
    /*
    (Because Swift arrays are value types, this style of doing the mutation 
    on a copied array and then assigning the copied array back to the 
    member variables is likely to be less efficient than simply mutating the
    member variable directly if you're handling structs and if the collection
    type does not optimize cleverly. But it is clear.)
    */
    var updatedCells = self.activeCoords
    if let index = find(updatedCells, coords)
    {
      updatedCells.removeAtIndex(index)
    }
    else
    {
      updatedCells.append(coords)
    }
    self.activeCoords = updatedCells
    self.setNeedsDisplay()
  }
  
  /// De/selects a grid cell
  func handleTap(gr:UITapGestureRecognizer) {
    let touchLocation : CGPoint = gr.locationInView(self)
    let coords = self.coordsForTouchAt(touchLocation)
    self.flipCellAtCoords(coords)
  }

  // pure
  func coordsForTouchAt(point:CGPoint) -> Cell
  {
    let xCoords = Int(point.x / kGridSquareSize)
    let yCoords = Int(point.y / kGridSquareSize)
    return Cell(x: xCoords, y: yCoords)
  }
  
  func drawShapeAtGridCoords(coords:Cell)
  {
    let diameter = 0.75 * kGridSquareSize
    let (x,y) = (coords.x,coords.y)
    let circleGridOrigin : CGPoint = CGPointMake(CGFloat(x) * kGridSquareSize, CGFloat(y) * kGridSquareSize)
    let circleRectOrigin = CGPointMake(circleGridOrigin.x + (kGridSquareSize - diameter)/2.0 , circleGridOrigin.y + (kGridSquareSize - diameter)/2.0)
    let circleRect = CGRect(origin: circleRectOrigin, size: CGSize(width: diameter, height: diameter))
    let shapePath = UIBezierPath(ovalInRect: circleRect)
    UIColor.redColor().setStroke()
    UIColor.redColor().setFill()
    shapePath.stroke()
    shapePath.fill()
  }
  
  func drawGridLines() {
    let path = UIBezierPath()
    path.lineWidth = 1
    
    for var y = GridOriginY; y < CGFloat(CGFloat(kGridSquareCount) * kGridSquareSize); y = y + kGridSquareSize {
      let minX = GridOriginX
      let maxX = kGridSquareSize * CGFloat(kGridSquareCount)
      path.moveToPoint(CGPoint(x: minX, y: y))
      path.addLineToPoint(CGPoint(x:maxX,y:y))
    }
    
    for var x = GridOriginX; x < (CGFloat(kGridSquareCount) * kGridSquareSize); x = x + kGridSquareSize {
      let minY = GridOriginY
      let maxY = kGridSquareSize * CGFloat(kGridSquareCount)
      path.moveToPoint(CGPoint(x: x, y: minY))
      path.addLineToPoint(CGPoint(x:x,y:maxY))
    }
    
    UIColor.blackColor().setStroke()
    path.stroke()
  }
  
  override func drawRect(rect: CGRect) {
    self.drawGridLines()
    self.activeCoords.map { (coords:Cell) -> Void in
      self.drawShapeAtGridCoords(coords)
    }
  }
}

