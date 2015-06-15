//: [Previous](@previous)
/*:

# Anagrams
An anagram is a type of word play, the result of rearranging the letters of a word or phrase to produce a new word or phrase, using all the original letters exactly once; for example, the word anagram can be rearranged into nag-a-ram.
> [Source: Wikipedia](https://en.wikipedia.org/wiki/Anagram)
*/
import Foundation

func unicodeIndexFromCharacter(character: Character) -> Int {
    let originalWordCharacterScalar = String(character).unicodeScalars
    let originalWordCharacterUnicodeIndex = originalWordCharacterScalar[originalWordCharacterScalar.startIndex].value
    
    return Int(originalWordCharacterUnicodeIndex)
}

func checkWord(word: String, isAnagramofWord: String) -> Bool {
    // Strip the whitespace
    let noWhitespaceOriginalString = word.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString
    let noWhitespaceComparisonString = isAnagramofWord.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString

    if noWhitespaceOriginalString.characters.count != noWhitespaceComparisonString.characters.count {
        return false
    }
    
    if noWhitespaceOriginalString.characters.count == 0 {
        return true
    }

    var someInts = [Int]()
    
    for index in 0...noWhitespaceOriginalString.characters.count - 1 {
        let originalWordCharacter = noWhitespaceOriginalString[advance(noWhitespaceOriginalString.startIndex, index)]
        let comparedWordCharacter = noWhitespaceComparisonString[advance(noWhitespaceComparisonString.startIndex, index)]

        let originalWordCharacterUnicodeIndex = unicodeIndexFromCharacter(originalWordCharacter)
        let comparedWordCharacterUnicodeIndex = unicodeIndexFromCharacter(comparedWordCharacter)
        
        // This is so that we don't have to create an unneccesarily large array, then loop through it all to do the 
        // check at the end. It's only ever the size that we need.
        let maxIndex = max(originalWordCharacterUnicodeIndex, comparedWordCharacterUnicodeIndex)
        if  maxIndex > someInts.count - 1 {
            for _ in someInts.count...maxIndex {
                someInts.append(0)
            }
        }
        
        someInts[originalWordCharacterUnicodeIndex]++
        someInts[comparedWordCharacterUnicodeIndex]--
    }
    
    for index in someInts {
        if (index != 0) {
            return false
        }
    }
    return true
}
/*:
## Tests
The following lines test some anagrams and some strings that are not anagrams.
*/
checkWord("", isAnagramofWord: "")
checkWord("a", isAnagramofWord: "a")
checkWord("1", isAnagramofWord: "1")

checkWord("", isAnagramofWord: "a") == false
checkWord("aa", isAnagramofWord: "a") == false
checkWord("1", isAnagramofWord: "22") == false

checkWord("chris grant", isAnagramofWord: "char string")
checkWord("chris grant", isAnagramofWord: "real nerd") == false

checkWord("nag a ram", isAnagramofWord: "anagram")
checkWord("Tom Cruise", isAnagramofWord: "So Im cuter")
checkWord("Siobhan Donaghy", isAnagramofWord: "Shanghai Nobody")

checkWord("22", isAnagramofWord: "1") == false
checkWord("neatknob", isAnagramofWord: "banknote")

checkWord("Bemoans Runts", isAnagramofWord: "Sam Burnstone")
checkWord("A Mobsters Nun", isAnagramofWord: "Sam Burnstone")
checkWord("Sunbeam Snort", isAnagramofWord: "Sam Burnstone")
checkWord("A Numbers Snot", isAnagramofWord: "Sam Burnstone")
//: [Next](@next)
