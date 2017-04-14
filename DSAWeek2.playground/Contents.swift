//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//https://leetcode.com/problems/ransom-note/#/description

//func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
//    var magazineDict = makeDict(of: magazine)
//    for char in ransomNote.characters {
//        if magazineDict[char] == nil {
//            return false
//        }
//        else if magazineDict[char] == 0 {
//            return false
//        }
//        else {
//            magazineDict[char]! -= 1
//        }
//    }
//    
//    return true
//}
//
//func makeDict(of str: String) -> [Character:Int] {
//    var result = [Character:Int]()
//    for char in str.characters {
//        if result[char] == nil {
//            result[char] = 1
//        }
//        else {
//            result[char]! += 1
//        }
//        
//    }
//    return result
//}


//https://leetcode.com/problems/remove-duplicates-from-sorted-list/#/description

//
//
// public class ListNode {
//         var val: Int
//         var next: ListNode?
//          init(_ val: Int) {
//               self.val = val
//                self.next = nil
//           }
//     }
//
//func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//    if head == nil {
//        return nil
//    }
//    var current: ListNode? = head
//    while current?.next != nil {
//        if current?.val == current?.next?.val {
//            current?.next = current?.next?.next
//        } else {
//            current = current?.next
//        }
//    }
//    return head
//}



//https://leetcode.com/problems/search-insert-position/#/description

 func searchInsert(nums: [Int], target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = low + (high - low)/2
        if target < nums[mid] {
            high = mid - 1
        } else if target > nums[mid] {
            low = mid + 1
        } else {
            return mid
        }
    }
    return low
}





