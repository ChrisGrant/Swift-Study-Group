//: [Previous](@previous)
/*:
# Fizz Buzz
The "Fizz-Buzz test" is an interview question designed to help filter out the 99.5% of programming job candidates who can't seem to program their way out of a wet paper bag. The text of the programming assignment is as follows:
"Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”."

*/
import Foundation
/*:

This function takes an Int called limit. The function will call the functions passed to it with an Int, starting from 0, up to the specified limit. For each index (x) it will build a string of the format:

    x. <function 1 return value><function 2 return value>...
*/
func buildStringForIndicesUpTo(limit: Int, withFunctions: [(Int) -> String]) -> String {

    var output = ""
    
    for index in 1...limit {
        output += "\(index). "
        for function in withFunctions {
            output += function(index)
        }
        output += "\n"
    }
    
    return output
}
/*:
This is a basic implementation which is quite easy to read and understand. It defines two functions called `fizz` and `buzz`, then calls `buildStringForIndicesUpTo:limit:withFunctions`, using an array containing `fizz` and `buzz` as the functions parameter.
*/
func fizzBuzz() -> String {
    
    func fizz(index: Int) -> String {
        if index % 3 == 0 {
            return "Fizz"
        }
        return ""
    }
    
    func buzz(index: Int) -> String {
        if index % 5 == 0 {
            return "Buzz"
        }
        return ""
    }
    
    let functions: [(Int) -> String] = [fizz, buzz]
    
    return buildStringForIndicesUpTo(100, withFunctions: functions)
}
fizzBuzz()
/*:
The line below shows a much more concise way to do the same as the fizzBuzz method, using the following features of swift:
- Closure Expressions
- Inferring Type From Context
- Implicit Returns from Single-Expression Closures
- Shorthand Argument Names
*/
buildStringForIndicesUpTo(100, withFunctions: [{ $0 % 3 == 0 ? "Fizz" : ""}, { $0 % 5 == 0 ? "Buzz" : ""}])
/*:
And here is a daft illustration of how the `buildStringForIndicesUpTo:limit:withFunctions` can be used in a different way, by examining a few scenarios if some members of the shinobi team were to get married. Interesting.
*/
buildStringForIndicesUpTo(6, withFunctions: [
    { $0 % 3 == 0 ? "Robert " : ""},
    { $0 % 3 == 1 ? "Sam " : ""},
    { $0 % 3 == 2 ? "Ryan " : ""},
    { $0 % 3 == 1 ? "Pilling" : ""},
    { $0 % 3 == 2 ? "Pilling-" : ""},
    { $0 % 3 == 2 ? "Burnstone" : ""},
    { $0 % 3 == 0 ? "Grey" : ""}])
//: [Next](@next)
