/*:

# Palindromes
A palindrome is a word, phrase, number, or other sequence of characters which reads the same backward or forward.
> [Source: Wikipedia](http://en.wikipedia.org/wiki/Palindrome)
*/
import UIKit

// Build a set of characters we care about when scanning a string to see if it is a palindrome.
let validCharacterSet = NSMutableCharacterSet()
validCharacterSet.formUnionWithCharacterSet(NSCharacterSet.letterCharacterSet()) // Letters
validCharacterSet.formUnionWithCharacterSet(NSCharacterSet.decimalDigitCharacterSet()) // Numbers

func isPalindrome(candidate: String) -> Bool {
    
    // Create a set of components which excludes the characters *not* in the valid character set.
    let validComponents = candidate.componentsSeparatedByCharactersInSet(validCharacterSet.invertedSet)
    
    // Join the components together again, once they have had the invalid characters removed.
    let valid = "".join(validComponents)
    
    // Lowercase everything. Palindromes don't care about casing.
    let lowercaseAlphabetOnlyString = valid.lowercaseString
    
    // If there are no characters or 1 character, it's a valid palindrome. Exit early.
    let stringLength = lowercaseAlphabetOnlyString.characters.count
    if stringLength < 2 {
        return true
    }
    
    // Go through the first half of the string, and compare each character with it's corresponding character in the last
    for index in 0...stringLength / 2 {
        let firstHalfCharacter = lowercaseAlphabetOnlyString[advance(lowercaseAlphabetOnlyString.startIndex, index)]
        
        let lastHalfIndex = stringLength - index - 1
        let lastHalfCharacter = lowercaseAlphabetOnlyString[advance(lowercaseAlphabetOnlyString.startIndex, lastHalfIndex)]
        
        if (firstHalfCharacter != lastHalfCharacter) {
            return false
        }
    }
    return true
}
/*:
## Tests
### Single Words
The most basic form of palindrome is a single word. The following lines test some simple, single word cases.
*/
isPalindrome("")
isPalindrome("a")
isPalindrome("ababa")
isPalindrome("noon")
isPalindrome("civic")
isPalindrome("radar")
isPalindrome("level")
isPalindrome("rotor")
isPalindrome("kayak")
isPalindrome("reviver")
isPalindrome("racecar")
isPalindrome("redder")
isPalindrome("madam")
isPalindrome("refer")
isPalindrome("ab") == false
isPalindrome("zzaz") == false
/*:
### Sentences
Allowances may be made for adjustments to capital letters, punctuation, and word dividers. Famous examples include "A man, a plan, a canal, Panama!", "Amor, Roma", "race car", "taco cat", "Was it a car or a cat I saw?" and "No 'x' in Nixon". The following lines test some simple, single word cases.
*/
isPalindrome("A man, a plan, a canal, Panama!")
isPalindrome("Amor, Roma")
isPalindrome("race car")
isPalindrome("taco cat")
isPalindrome("Was it a car or a cat I saw?")
isPalindrome("No 'x' in Nixon")
isPalindrome("A Toyota's a Toyota")
isPalindrome("Hello, olleh")
isPalindrome("Doc, note: I dissent. A fast never prevents a fatness. I diet on cod")
isPalindrome("Eva, can I stab bats in a cave?")
isPalindrome("Mr. Owl ate my metal worm")
isPalindrome("Was it a car or a cat I saw?")
isPalindrome("A nut for a jar of tuna")
isPalindrome("Do geese see God?")
isPalindrome("Ma is as selfless as I am")
isPalindrome("On a clover, if alive erupts a vast pure evil, a fire volcano")
isPalindrome("Dammit, I'm mad!")
isPalindrome("Dog, as a devil deified, lived as a god.")
isPalindrome("Not so, Boston.")
isPalindrome("Go hang a salami, I'm a lasagna hog")
isPalindrome("A Santa lived as a devil at NASA")
isPalindrome("My name is chris") == false
isPalindrome("This is siht") == false
/*:
### Number sequences
Palindromes can also be number sequences, or sentences that include numbers in them.
*/
isPalindrome("121")
isPalindrome("a11a")
isPalindrome("b22b")
isPalindrome("1,a1")
isPalindrome("11a11")
isPalindrome("aab 111 baa ")
isPalindrome("99. aabb 1 bbaa 99")
isPalindrome("1a") == false
isPalindrome("12") == false
//: [Next](@next)
