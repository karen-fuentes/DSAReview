//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// create a function that returns the amount of times a palindrome appears in a scentence ex "bob" : 2 , Mom: 3, "racecar": 1

func howManyPalindrome(with sentence: String) -> [String:Int] {
    var palindromeDict = [String:Int]()
    let words = sentence.components(separatedBy: " ")
    words.forEach { (word) in
        if isPalindrome(word: word) {
           let counter = palindromeDict[word] ?? 0
           palindromeDict[word] = counter + 1
        }
    }
    return palindromeDict
}

// Below is the helper function that checks whether the word is an actual palindrome. While the current inex which starts off at 0 is less than half of the length of charactes in the word we will check if the character at the current index is equal to the last character and keep moving on both ends of the word itself until we reach the midpoint

func isPalindrome(word: String) -> Bool {
   var currentIndex = 0
   let characters = Array(word.lowercased().characters)

    while currentIndex < characters.count/2 {
        if characters[currentIndex] != characters[characters.count - currentIndex - 1 ] {
            return false
        }
        currentIndex += 1
    }
   return true
}

//howManyPalindrome(with: "racecar racecar bob bob bob anna sushi")


/*
 Clarifying Questions: Reverse A String
 
 1) Can we use a higher ordered function?
 2) Can I use .reverse()?
 3) How do I handle whitespace and punctuation?
 */

/*
 Identifying inputs and ouputs
 1) input: String
 output: String
 2) input: String
 output: Void (Print the Reversed String)
 3) input: Void (By extending Swift String Struct)
 output: Void
 
 */


func reverseAString(str: String) -> String {
    var myStack: [Character] = [] // no  class array is the Data Structure used for myStack
    for character in str.characters {
        myStack.append(character)
    }
    var reversedStr = ""
    
    while !myStack.isEmpty {
        reversedStr += String(myStack.popLast()!)
        //reversedStr.append(myStack.popLast()!)
    }
    
    return reversedStr
    
}



func reverseAString2(str: String) -> String {
    var myReversedStr: String = ""
    
    for character in str.characters {
        var temp = String(character) + myReversedStr
        withUnsafePointer(to: &temp, { (addr)  in
            print(addr)
        })
        print(temp)
        myReversedStr = temp
    }
    
    var temp = String(Character("F")) + myReversedStr
    withUnsafePointer(to: &temp, { (addr)  in
        print(addr)
    })
    print(temp)
    
    return myReversedStr
}

reverseAString2(str: "hello")
reverseAString(str: "hello")


/*
 https://oj.leetcode.com/problems/two-sum/
 #1 Two Sum
 Level: medium
 Given an array of integers, find two numbers such that they add up to a specific target number.
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution.
 Input: numbers={2, 7, 11, 15}, target=9
 Output: index1=1, index2=2
 */

func twoSum(of arr: [Int], target: Int) -> [Int] {
    var hashMap = [Int: Int]()
    var result = [Int]()
    
    for index in 0..<arr.count{
        let numberToFind = target - arr[index]
        if let numberToFindIndex = hashMap[numberToFind] {
            result.append(numberToFindIndex + 1)
            result.append(index + 1)
            return result
        } else {
            hashMap[arr[index]] = index
        }
        print(hashMap)
    }
    
    return result
}

//twoSum(of: [2,7,11,15], target: 26)



/*
 https://oj.leetcode.com/problems/add-two-numbers/
 #2 Add Two Numbers
 Level: medium
 You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 */


class ListNode {
    var value: Int
    var next: ListNode?
    init () {
        value = 0
        next = nil
    }
    init (nodeValue: Int, nodeNext: ListNode?) {
        value = nodeValue
        next = nodeNext
    }
}

func addList(listOne: ListNode?, listTwo: ListNode?) -> ListNode? {
    var temp1 = listOne
    var temp2 = listTwo
    
    let dummy = ListNode()
    
    var current = dummy
    var sum = 0
    while temp1 != nil || temp2 != nil {
        sum /= 10
        if let n = temp1 {
            sum += n.value
            temp1 = n.next
        }
        if let n = temp2 {
            sum += n.value
            temp2 = n.next
        }
        current.next = ListNode(nodeValue: sum%10, nodeNext: nil)
        if let n = current.next{
            current = n
        }
    }
    if sum / 10 == 1 {
        current.next = ListNode(nodeValue: 1, nodeNext: nil)
    }
    
    return dummy
    
}

/* https://leetcode.com/problems/intersection-of-two-arrays/#/description
 1. ask clarifying questions
 how do we handle negaitve numbers
 how should we order the return array
 do we need to handle array of types other than Int
 
 2. Identify inputs and outputs
 input: [Int], [Int]
 output; [Int]
 
 3. Talk through the solution
 a. SET turn both arrays into sets, then retirned the intersection of both sets
 b. NO SET - iterate through an input array and for each value check to see if the seocond array contians that value. If it does and the final array doesnt yet contain that value, appened it to the final array
 
 4. code and explain your solution
 */

// func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//    let testSetOne = Set(nums1)
//    let testSetTwo = Set(nums2)
// return Array(testSetOne.intersection(testSetTwo))
// }

// Long way
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var nums = [Int]()
    for num in nums1 {
        if nums2.contains(num) {
            nums.append(num)
        }
    }
    return Array(Set((nums)))
}

/* https://leetcode.com/problems/keyboard-row/#/description
 
 1. ask clarifying questions
 
 
 2. Identify inputs and outputs
 input: [String]
 output: [Sting]
 
 3. Talk through the solution
 
 
 4. code and explain your solution
 */

func findWords(_ words: [String]) -> [String] {
    let firstRow:Set<Character> = ["q","w", "e", "r","t","y","u","i","o","p"]
    let secondRow:Set<Character> = ["a","s","d", "f","g","h","j","k","l"]
    let thirdRow:Set<Character> = ["z","x","c","v","b","n","m"]
    
    var resultArr = [String]()
    
    for word in words {
        for char in word.lowercased().characters {
            switch char {
                //case _ where firstRow.contains(char):
                
                
                
            default:
                break
                
            }
        }
    }
    
    
    return [""]
    
}


func findWords2(_ words: [String]) -> [String] {
    let row1: Set<Character> = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
    let row2: Set<Character> = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
    let row3: Set<Character> = ["z", "x", "c", "v", "b", "n", "m"]
    var finalArr = [String]()
    
    func allCharsIn(row: Set<Character>, with str: String) -> Bool {
        for c in str.lowercased().characters {
            if !row.contains(c) {
                return false
            }
        }
        return true
    }
    
    for word in words {
        let firstLetter = word.lowercased()[word.startIndex]
        var shouldAppend = true
        switch firstLetter {
        case _ where row1.contains(firstLetter):
            shouldAppend = allCharsIn(row: row1, with: word)
        case _ where row2.contains(firstLetter):
            shouldAppend = allCharsIn(row: row2, with: word)
        case _ where row3.contains(firstLetter):
            shouldAppend = allCharsIn(row: row3, with: word)
        default:
            shouldAppend = false
        }
        if shouldAppend{
            finalArr.append(word)
        }
    }
    return finalArr
}


//https://leetcode.com/problems/move-zeroes/#/description

func removeZeros(arr: [Int]) -> [Int] {
    var zeroArr = [Int]()
    var nonZeroArr = [Int]()
    for value in arr {
        if value == 0 {
            zeroArr.append(value)
        } else {
            nonZeroArr.append(value)
        }
    }
    return nonZeroArr + zeroArr
}

func removeZerosHigherOrder(arr: [Int]) -> [Int] {
    var zeroCount = 0
    for num in arr {
        if num == 0 {
            zeroCount += 1
        }
    }
    return arr.filter{$0 != 0} + Array(repeating: 0, count: zeroCount)
}

func removeZerosTwo(arr: inout [Int]) {
    var zeroFinderIndex = 0
    var numberFinderIndex = 0
    while zeroFinderIndex < arr.count && numberFinderIndex < arr.count - 1 {
        if arr[zeroFinderIndex] == 0 {
            numberFinderIndex += 1
            if arr[numberFinderIndex] != 0 {
                swap(&arr[zeroFinderIndex], &arr[numberFinderIndex])
            }
        } else {
            zeroFinderIndex += 1
        }
    }
}

var testArr = [1,0,0,0,0,1]

//removeZerosTwo(arr: &testArr)
//
//    return nums.filter { $0 != 0 } + [Int](repeating: 0, count: nums.filter { $0 == 0 }.count)


//https://leetcode.com/problems/majority-element/#/description

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var myDict = [Int:Int]()
        var majority = nums.count/2
        
        for number in nums {
            if myDict[number] != nil {
                myDict[number]! += 1
            } else {
                myDict[number] = 1
            }
        }
        for (keys,value) in myDict {
            if value > majority {
                return keys
            }
        }
        return 0
        
    }
}



