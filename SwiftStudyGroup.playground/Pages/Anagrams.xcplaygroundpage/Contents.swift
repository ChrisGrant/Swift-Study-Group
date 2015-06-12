//: [Previous](@previous)

import Foundation


func areWordsAnagrams(str: String, str2: String) -> Bool {
    // strip the whitespace
    let noWhitespaceString1 = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    let noWhitespaceString2 = str2.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())

    if str.characters.count != str2.characters.count {
        return false
    }

    var someInts = [Int](count: 99999, repeatedValue: 0)
    
    for index in 0...noWhitespaceString1.characters.count - 1 {
        let firstHalfCharacter = noWhitespaceString1[advance(noWhitespaceString1.startIndex, index)]

    }
    return true
}

var str = "Hello, playground"
var str2 = "Hello, playgroudn"

areWordsAnagrams(str, str2: str2)//: [Next](@next)
