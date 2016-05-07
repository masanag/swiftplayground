import UIKit

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
print(shape.numberOfSides)
shape.numberOfSides = 7
shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("deinitted")
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

if true {
    var namedShape = NamedShape(name: "Mark")
    namedShape.simpleDescription()
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
    var radius: Double
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return radius * radius * M_PI
    }
    
    override func simpleDescription() -> String {
        return "A circle with a radius."
    }
}

var circle = Circle.init(radius: 10.0, name: "Circle")
circle.simpleDescription()
circle.area()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var permineter: Double {
        get {
            return 3.0 * sideLength
        }

        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.permineter)
triangle.permineter = 9.3
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            print(newValue.name)
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            print(newValue.name)
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 100, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 40, name: "smaller square")
print(triangleAndSquare.triangle.sideLength)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


// Enumerattions and Structures
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(rawValue)
        }
    }
    
    func compact() -> String {
        switch self {
        case .Ace:
            return "A"
        case .Jack:
            return "J"
        case .Queen:
            return "Q"
        case .King:
            return "K"
        default:
            return String(rawValue)
        }
    }
    
    func compare(p: Rank) -> Int {
        switch self.rawValue - p.rawValue {
        case Int.min ..< 0:
            return -1
        case 0:
            return 0
        case 1 ..< Int.max, Int.max:
            return 1
        default:
            fatalError("Error")
        }
    }
}

let ace = Rank.Ace
ace.simpleDescription()
let two = Rank.Two
Rank.Ace.rawValue

Rank.Jack.compare(Rank.Three)
Rank.Jack.compare(Rank.Jack)
Rank.Jack.compare(Rank.Queen)


let value = -10
switch value {
case _ where value > 0:
    print("positive")
case _ where value < 0:
    print("negative")
case _ where value == 0:
    print("zero")
default:
    print("default")
}

let a = 1
switch a {
case Int.min ..< 0:
    print("負数")
    
case 0:
    print("零")
    
case 1 ..< Int.max, Int.max:
    print("正数")
    
default:
    fatalError("俺はプログラマをやめるぞ！")
}

Rank(rawValue: 1)
Rank(rawValue: 0)
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

Rank.Ace.simpleDescription()

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "♠︎"
        case .Hearts:
            return "♡"
        case .Diamonds:
            return "♢"
        case .Clubs:
            return "♣︎"
        }
    }
    
    func color() -> Color {
        switch self {
        case .Spades, .Clubs:
            return Color.Black
        case .Hearts, .Diamonds:
            return Color.Red
        }
    }
}

enum Color {
    case Black, Red
    func simpleDescription() -> String {
        switch self {
        case .Black:
            return "black"
        case .Red:
            return "red"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
hearts.color()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    static func sayHello() -> String {
        return "hello"
    }
    
    static func fullDeck() {
        for rankNumber in 1...14 {
            for suit in [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs] {
                if let rank = Rank(rawValue: rankNumber) {
                    print("\(suit.simpleDescription())\(rank.compact())")
                }
            }
        }
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
Card.sayHello()
Card.fullDeck()

enum ServerResponse {
    case Result(String, String)
    case Status(Int)
    case Failure(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Failure("Out of cheese.")
let status = ServerResponse.Status(404)

func outputResponse(response: ServerResponse) -> String {
    switch response {
    case let .Result(sunrise, sunset):
        return "Sunrise is at \(sunrise) and sunset is at \(sunset)."
    case let .Status(status):
        return String(status)
    case let .Failure(message):
        return "Failure... \(message)"
    }
}

switch success {
case let .Result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .Status(status):
    print("Got status: \(status)")
case let .Failure(message):
    print("Failure... \(message)")
}

outputResponse(success)
outputResponse(failure)
outputResponse(status)

