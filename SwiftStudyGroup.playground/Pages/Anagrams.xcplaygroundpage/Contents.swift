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

func oldCheckWord(word: String, isAnagramOfWord: String) -> Bool {
    // Strip the whitespace
    let noWhitespaceOriginalString = word.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString
    let noWhitespaceComparisonString = isAnagramOfWord.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString

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

func checkWord(word: String, isAnagramOfWord: String) -> Bool {
    let noWhitespaceOriginalString = word.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString
    let noWhitespaceComparisonString = isAnagramOfWord.stringByReplacingOccurrencesOfString(" ", withString: "").lowercaseString
    
    if noWhitespaceOriginalString.characters.count != noWhitespaceComparisonString.characters.count {
        return false
    }
    
    if noWhitespaceOriginalString.characters.count == 0 {
        return true
    }
    
    var dict = [Character: Int]()
    
    for index in 1...noWhitespaceOriginalString.characters.count {
        let originalWordCharacter = noWhitespaceOriginalString[advance(noWhitespaceOriginalString.startIndex, index - 1)]
        let comparedWordCharacter = noWhitespaceComparisonString[advance(noWhitespaceComparisonString.startIndex, index - 1)]
        
        dict[originalWordCharacter] = (dict[originalWordCharacter] ?? 0) + 1
        dict[comparedWordCharacter] = (dict[comparedWordCharacter] ?? 0) - 1
    }
    
    for key in dict.keys {
        if (dict[key] != 0) {
            return false
        }
    }
    
    return true
}
/*:
## Tests
The following lines test some anagrams and some strings that are not anagrams.
*/
checkWord("", isAnagramOfWord: "")
checkWord("a", isAnagramOfWord: "a")
checkWord("1", isAnagramOfWord: "1")

checkWord("", isAnagramOfWord: "a") == false
checkWord("aa", isAnagramOfWord: "a") == false
checkWord("1", isAnagramOfWord: "22") == false

checkWord("chris grant", isAnagramOfWord: "char string")
checkWord("chris grant", isAnagramOfWord: "real nerd") == false

checkWord("nag a ram", isAnagramOfWord: "anagram")
checkWord("Tom Cruise", isAnagramOfWord: "So Im cuter")
checkWord("Siobhan Donaghy", isAnagramOfWord: "Shanghai Nobody")

checkWord("neatknob", isAnagramOfWord: "banknote")

checkWord("Bemoans Runts", isAnagramOfWord: "Sam Burnstone")
checkWord("A Mobsters Nun", isAnagramOfWord: "Sam Burnstone")
checkWord("Sunbeam Snort", isAnagramOfWord: "Sam Burnstone")
checkWord("A Numbers Snot", isAnagramOfWord: "Sam Burnstone")

checkWord("Billing Report", isAnagramOfWord: "Robert Pilling")
checkWord("Probe Trilling", isAnagramOfWord: "Robert Pilling")
checkWord("Binge Rip Troll", isAnagramOfWord: "Robert Pilling")
checkWord("Giblet Rip Lorn", isAnagramOfWord: "Robert Pilling")
//: [Next](@next)
