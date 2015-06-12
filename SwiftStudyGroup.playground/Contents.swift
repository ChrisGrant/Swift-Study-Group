import UIKit

//: This is a line of text that will appear as a rich comment in a playground.

/*: This is a comment

# The First Heading Shown
The first content line displayed in this block of rich text.

*/

func isPalindrome(candidate: String) -> Bool {
    let alphabetOnlyComponents = candidate.componentsSeparatedByCharactersInSet(NSCharacterSet.letterCharacterSet().invertedSet)
    
    let alphabetOnlyString = "".join(alphabetOnlyComponents)
    
    let lowercaseAlphabetOnlyString = alphabetOnlyString.lowercaseString
    
    let stringLength = lowercaseAlphabetOnlyString.characters.count;
    
    for index in 0...stringLength / 2 {
        let x = lowercaseAlphabetOnlyString[advance(alphabetOnlyString.startIndex, index)]
        
        let index = stringLength - index - 1
        
        let y = lowercaseAlphabetOnlyString[advance(alphabetOnlyString.startIndex, index)]
        
        if (x != y) {
            return false
        }
    }
    
    return true;
}

isPalindrome("Hello, olleh")
