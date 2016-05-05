import UIKit

print("Hello, world!")
var myVariable = 42
myVariable = 50
let myConstant = 42
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

explicitDouble
let explicitFloat: Float = 80
let explicitFloat02: Float = 80.0
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captaion",
    "Kaylee": "Mechanic"
]

occupations["Malcolm"]
occupations["Jayne"] = "Public Relations"
let emptyArray = [String]()
let emptyDIctionary = [String: Float]()

shoppingList = []
occupations = [:]

shoppingList.append("aaaa")
shoppingList.append(String(3))
print(shoppingList)

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
    print(score)
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

var price: Double!
price = price ?? 700
print(price)

var party: Array<String>?
party = ["warrier", "magician"]
party!.append("priest")

var items: Dictionary<String, Int>?
items = items ?? ["apple": 100, "orange": 300]
items!["apple"]

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("sandwitch")
case "pepper":
    print("red pepper")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
case let x where x.hasPrefix("red"):
    print ("Is it a red?")
default:
    print("default")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

var l = 2
repeat {
    l += 100
} while l < 0
print(l)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

func greet(name: String, day: String) -> String {
    return "Hello \(name), today id \(day)."
}
greet("Bob", day: "Tuesday")
greet("Taro", day: "Wed")

func sayHi(name: String) -> String {
    return "Hi, \(name)"
}
sayHi("Masa")

func calculateStatistics(scores: [Int]) -> (Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics.0)
print(statistics.sum)

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf()
sumOf(42, 597, 12)

func sumOfArray(numbers: Array<Int>) -> Int {
    var sum = 0
    for number in numbers {
       sum += number
    }
    return sum
}

sumOfArray([42, 597, 12])

func averageOf(numbers: Int...) -> Float {
    // var sum = sumOf(numbers)
    let sum = sumOfArray(numbers)
    return Float(sum) / Float(numbers.count)
}

let tp = (1,2,3,4,5)
averageOf(1,2,3,4,5)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

func makeDecrementer() -> ((Int) -> Int) {
    func substractOne(number: Int) -> Int {
        return number - 1
    }
    return substractOne
}

var decrement = makeDecrementer()

let andd = { (p1: Int, p2: Int) -> Int in
    return p1 + p2
}

let subtraction = { (p1: Int, p2: Int) -> Int in
    return p1 - p2
}

andd(1, 1)
andd(100, 1)
subtraction(100, 99)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, condition: lessThanTen)

func addition(p1: Int, p2: Int, closure: (Int, Int) -> Int) -> Int {
    return closure(p1, p2)
}

addition(10, p2: 1, closure: +)
addition(100, p2: 21, closure: -)
addition(10, p2: 2, closure: /)
addition(12, p2: 20, closure: *)

let mapped = [1, 2, 3].map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

print(mapped)

let evenNums = [1, 2, 3].map({
    (number: Int) -> Bool in
    let result = number % 2 == 0
    return result
})
print(evenNums)

let fizzBuzz = (1...20).map({
    (number: Int) -> String in
    switch number {
    case _ where number % 15 == 0:
        return "FizzBuzz"
    case _ where number % 3 == 0:
        return "Fizz"
    case _ where number % 5 == 0:
        return "Buzz"
    default:
        return String(number)
    }
})
print(fizzBuzz)

let fizzBuzzTuple = (1...20).map({
    (number: Int) -> String in
    switch (number % 5, number % 3) {
    case (0, 0):
        return "FizzBuzz"
    case(0, _):
        return "Buzz"
    case(_, 0):
        return "Fizz"
    default:
        return String(number)
    }
})
print(fizzBuzzTuple)