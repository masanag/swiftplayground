import UIKit

protocol ExampleProtocol {
    var simpleDescription: String { get set }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var autherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

var a = SimpleClass()
a.simpleDescription
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.simpleDescription
b.adjust()
b.simpleDescription
extension Int: ExampleProtocol {
    var simpleDescription: String {
        get {
            return "The number \(self)"
        }
        set {
            
        }
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
100.simpleDescription
var anum: Int = 100
anum.adjust()

extension String: ExampleProtocol {
    var simpleDescription: String {
        get {
            return self
        }
        set {
            
        }
    }
    func say() {
        print("I'm a \(self)!!")
    }
    mutating func adjust() {
        self += " adjusted"
    }
}

"aaa".say()
"aaaaabbb".simpleDescription
var sampleString: String? = "sampleString...."
sampleString?.simpleDescription
sampleString?.adjust()
if var str = sampleString {
    str.adjust()
    print(str.simpleDescription)
    str.adjust()
}
a
a.simpleDescription
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

enum PrinterError: ErrorType {
    case OutOfPaper
    case NoToner
    case OnFire
}

func sendToPrinter(printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    else if printerName == "Never Has Paper" {
        throw PrinterError.OutOfPaper
    }
    else if printerName == "Now Firing" {
        throw PrinterError.OnFire
    }
    return "Job sent"
}

do {
    let printerResponse = try sendToPrinter("Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try sendToPrinter("Never Has Paper")
} catch {
    print(error)
}


do {
    let printerResponse = try sendToPrinter("Never Has Paper")
    print(printerResponse)
} catch PrinterError.OnFire {
    print("aaaa")
} catch let printerError as PrinterError {
    print(PrinterError)
} catch {
    print("bbbb")
}

let printerSuccess = try? sendToPrinter("Mergenthaler")
let printerFailure = try? sendToPrinter("Never Has Toner")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(itemName: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
        print(itemName)
    }
    
    let result = fridgeContent.contains(itemName)
    return result
}

fridgeContent.contains("milk")
fridgeContent.contains("salmon")
fridgeIsOpen
fridgeContains("milk")
fridgeIsOpen
fridgeContains("banana")
fridgeIsOpen

for i in 0..<3 {
    defer {
        print("i: \(i)")
    }
    print("Hello, \(i)")
}

func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

repeatItem("knock", numberOfTimes: 4)
repeatItem(SimpleClass.init(), numberOfTimes: 2)
repeatItem(0.11, numberOfTimes: 2)
repeatItem([1, 2], numberOfTimes: 2)
repeatItem((1, 2), numberOfTimes: 2)
repeatItem(["a": 122, "b": 123], numberOfTimes: 2)


func generateDic<T>(item: T, numberOfTimes: Int) -> [Int: T] {
    var result = [Int: T]()
    for i in 0..<numberOfTimes {
        result[i] = item
    }
    return result
}

print(generateDic(100, numberOfTimes: 3))

enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
anyCommonElements(["a", "b"], ["b"])
