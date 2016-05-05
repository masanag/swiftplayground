//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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
