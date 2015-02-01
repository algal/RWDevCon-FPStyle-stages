// Playground - noun: a place where people can play

struct Cell
{
  let x:Int
  let y:Int
}

// MARK: Equatable

/// Two cells are equal iff all their members are equal
func ==(lhs: Cell, rhs: Cell) -> Bool {
  return lhs.x == rhs.x && lhs.y == rhs.y
}

// MARK: Hashable

extension Cell : Hashable {
  var hashValue : Int { return self.x.hashValue ^ self.y.hashValue  }
}

let initialBoard = [Cell(x:0,y:0)]
