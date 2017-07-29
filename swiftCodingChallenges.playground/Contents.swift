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

















