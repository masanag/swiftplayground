//: Playground - noun: a place where people can play

import UIKit
for i in 1...9 {
    var line = ""
    for j in 1...9 {
        let n = i * j
        if n < 10 { line += " " }
        line += " \(n)"
    }
    print(line)
}

for n in 1...13 {
    var line = ""
    for s in ["♠︎", "♡", "♣︎", "♦︎"] {
        var num: String
        if n == 1 {
            num = "A"
        } else if n == 11 {
            num = "J"
        } else if n == 12 {
            num = "Q"
        } else if n == 13 {
            num = "K"
        } else {
            num = String(n)
        }
        line += "\(s)\(num)"
    }
    print(line)
}


//: repeat
var i:Int = 0
repeat {
    print("i: \(i)")
    i += 1
} while (i < 10)

//: guard
func show(message: String?) {
    guard message != nil else {
        print("else statement")
        return
    }
    print(message!)
}

show("aaaaa")
show(nil)

func method() {
    var a = Dictionary<String,Int>()
    a["key"] = 999
    guard let value = a["key"] else {
        print("nil")
        return
    }
    let value2 = a["key"]
    // value2はOptional型
    print(value2!.toIntMax())
    // valueはOptional型ではなくなっている!!
    print(value.toIntMax())
    return 
}
method()
