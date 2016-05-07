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
