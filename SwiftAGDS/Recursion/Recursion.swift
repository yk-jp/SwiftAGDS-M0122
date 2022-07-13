//
//  Recursion.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-07-12.
//

import Foundation

// 1. power(base, exponent): base^exponent
// assume exponent >= 0
func power(base: Int, exponent: Int) -> Int {
  assert(exponent >= 0)
  // base case
  if exponent == 0 { return 1 }
  // recursive case
  return base * power(base: base, exponent: exponent - 1)
}

// 2. isPalindrome(word): checks if a word is palindrome
func isPalindrome(_ word: String) -> Bool {
  // base case
  if word.count <= 1 { return true }
  // recursive case
  if word[0] == word[word.count - 1] {
    return isPalindrome(word[1, word.count - 1])
  }
  return false
}

// 3. printBinary(n): prints binary form of given int
func printBinary(_ n: Int, padding: String) {
  print(padding, #function, n)
  if n < 0 {
    print("-", terminator: "")
    printBinary(-n, padding: padding + "  ")
    return
  }
  // base case
  if n < 2 {
    print(n, terminator: "")
    return
  }
  // recursive case
  printBinary(n / 2, padding: padding + "  ")
  print(n % 2, terminator: "")
}

// 4. reverseLines
// - Print all lines in reverse order (recursively) from a text file
// - You can change the function header if you want
func reverseLines(_ line: Int) {
  let contents = try! String(contentsOfFile: "/Users/park/Desktop/SwiftAGDS/SwiftAGDS/Recursion/story.txt")
  let sentences = contents.split(separator: "\n")
  if line < sentences.count {
    reverseLines(line + 1)
    print(sentences[line])
  }
}

/// 5. evaluate
/// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
/// - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
/// - You can use a helper function. (Do not change the original function header)
/// - Use Recursion
/// evaluate("7")                 -> 7
/// evaluate("(2+2)")             -> 4
/// evaluate("(1+(2*4))")         -> 9
/// evaluate("((1+3)+((1+2)*5))") -> 19
func evaluate(_ expr: String) -> Int {
  return 0
}
