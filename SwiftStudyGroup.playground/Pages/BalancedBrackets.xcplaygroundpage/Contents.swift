//: [Previous](@previous)
/*:
# Balanced Brackets
Given a string of opening and closing parentheses, check whether it’s balanced. We have 3 types of parentheses: round brackets: (), square brackets: [], and curly brackets: {}.
*/
import Foundation
/*:
First of all imma make my own stack implementation with a struct because that's how I ball (All Day)
*/
struct CharacterStack {
    
    var items = [Character]()
    
    mutating func push(item: Character) {
        items.append(item)
    }
    
    mutating func pop() -> Character {
        return items.removeLast()
    }
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
    
    func count() -> Int {
        return items.count
    }
    
    func topItem() -> Character? {
        return items.last
    }
}
/*:
This is where the fun begins. This method checks a string to see if it's brackets are balanced.
*/
func bracketsAreBalanced(bracketString: String) -> Bool {
    var stack:CharacterStack = CharacterStack()
    var brackets: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
    
    for character in bracketString.characters {
        if brackets.keys.contains(character) {
            stack.push(character) // There's an opening bracket. Push it on the stack.
        }
        else if brackets.values.contains(character) {
            if stack.count() < 1 {
                return false // There's a closing bracket but there's nothing to match it to.
            }
            else if stack.count() > 0 && brackets[stack.topItem()!] != character {
                return false // There is a closing bracket. Check it matches
            }
            stack.pop() // There's a matching closing bracket, so pop it from the stack.
        }
    }
    return stack.isEmpty()
}
/*:
A copious amount of tests to check that I have done it right.
*/
bracketsAreBalanced("")
bracketsAreBalanced("[]")
bracketsAreBalanced("()")
bracketsAreBalanced("{}")
bracketsAreBalanced("{ROBERT PILLING}")
bracketsAreBalanced("(RYAN GREY)")
bracketsAreBalanced("(SAMUEL BURNSTONE)")
bracketsAreBalanced("([{Chris Grant}])")
bracketsAreBalanced("([{Be (VERY) vigilant}])")
bracketsAreBalanced("[][][][][][][][][][][][][][][][][][]")
bracketsAreBalanced("([][][][][][][][][][][][][][][][][][])")

bracketsAreBalanced("{") == false
bracketsAreBalanced("}") == false
bracketsAreBalanced("(") == false
bracketsAreBalanced(")") == false
bracketsAreBalanced("[") == false
bracketsAreBalanced("]") == false
bracketsAreBalanced("{{{{{{{]]]]]]") == false
bracketsAreBalanced("{ROBERT PILLING IS { UNBALANCED }") == false
bracketsAreBalanced("{((SAM BURNSTONE)) IS [ UNBALANCED ]") == false
bracketsAreBalanced("([][][][][][][][][][][][][][][][][][]){") == false
//: [Next](@next)
