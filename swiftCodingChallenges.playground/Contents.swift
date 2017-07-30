//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// STRING CHAPTER

// Challenge 1: Are the letters unique -> Write a function that takes in a string as its a parameter and returns true if the string has only unique letter case into account 

/* Examples 
 input: "No duplicates"     output: True
 input: "AaBbCc"            output:True
 input: "Hello World"       output: false (more than one l)
 */

func noDuplicateLetters(of str: String) -> Bool {
 return Set(str.characters).count == str.characters.count
}

// noDuplicateLetters(of:"")


// Challenge 2: Is a string a palindrome -> write a function that takes in a string as its only parameter and returns true if the string reads the same when reversed. ignoring case 

/* Examples
 input: "rotator"                       output: True
 input: "Rats live on no evil star"     output:True
 input: "Hello World"                   output: false
 */

func isItaPalindrome(input: String) -> Bool {
    
    //return Array(input.lowercased().characters) == input.lowercased().characters.reversed()
    /*
     ⬇️ below is a better run time solution in book is the one above.
     */
    
    let arrayOfChars = Array(input.lowercased().characters)
    var currentIndex = 0
    while currentIndex < arrayOfChars.count/2 {
        if arrayOfChars[currentIndex] != arrayOfChars[arrayOfChars.count - 1 - currentIndex] {
            return false
        }
        currentIndex += 1
        
    }
    return true
    
}

//isItaPalindrome(input: "racecar")



// Challenge 3: Do two strings contain the same characters -> write a function that takes in two strings as paramaters and returns true if the contain the same characters in the any order taking into account the letter case 

/* Examples
 input: "abca" "abca"                   output: True
 input: "abc" "cba"                     output:True
 input: "abc" "Abc"                     output: false
 input: "a1 b2" "b 1 a 2"               output: true
 input: "abc" "cbAa"                    output: false
 */

func theSameCharacters(inputOne: String, inputTwo: String)-> Bool{
    let nospaceOne = inputOne.replacingOccurrences(of: " ", with: "")
    let nospaceTwo = inputTwo.replacingOccurrences(of: " ", with: "")
    let array1 = Array(nospaceOne.characters)
    let array2 = Array(nospaceTwo.characters)
    
    return array1.sorted() == array2.sorted()

}

//theSameCharacters(inputOne: "a1 b2", inputTwo: "b 1 a 2")


//Challenge 4: Does one string contain the another -> write your own version of the contains() method on string that ignore letter case and without using the existing contains() method 
extension String {
    func funkyContains( inputOne: String, inputTwo: String) -> Bool {
        
        return true
    }
}



















