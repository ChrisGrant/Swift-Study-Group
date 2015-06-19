//: [Previous](@previous)
/*:
# Balanced Brackets
Given a string of opening and closing parentheses, check whether it’s balanced. We have 3 types of parentheses: round brackets: (), square brackets: [], and curly brackets: {}.
*/
import Foundation

func bracketsAreBalanced(bracketString: String) {
    
    var stack = [Character]()
    
    for character in bracketString.characters {
        stack.append(character)
    }
}

bracketsAreBalanced("[][][][][][][][][][][][][][][][][][]")
bracketsAreBalanced("([][][][][][][][][][][][][][][][][][])")//: [Next](@next)
