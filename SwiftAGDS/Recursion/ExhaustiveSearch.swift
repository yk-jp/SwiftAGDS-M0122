//
//  ExhaustiveSearch.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-07-14.
//

import Foundation

/// Print all binary number representation with n digits
/// - Parameter n: the number of digits
func printBinaryExhaustive(_ n: Int) {
  printBinaryExhaustiveHelper(n, soFar: "", padding: "")
}

func printBinaryExhaustiveHelper(_ n: Int, soFar: String, padding: String) {
  print("\(padding)printBinaryExhaustiveHelper(\(n), \(soFar))")
  if n == 0 {
    // we have no more digits left to choose
    print(soFar)
  } else {
    // we have more decisions to make
    // for each available choices (0 or 1)
    // choose one & search
    printBinaryExhaustiveHelper(n - 1, soFar: soFar + "0", padding: padding + "  ")
    printBinaryExhaustiveHelper(n - 1, soFar: soFar + "1", padding: padding + "  ")
  }
}

/// Print all decimal number representation with n digits
/// - Parameter n: the number digits
func printDecimal(_ n: Int, _ soFar: String = "") {
  if n == 0 {
    print(soFar)
  } else {
    for i in 0...9 {
      printDecimal(n - 1, soFar + "\(i)")
    }
  }
}

/// Write a recursive function permutation that accepts a string as a parameter
/// and outputs all possible rearrangements of the letters in the string.
/// - Parameter word: the string
func permutation(_ word: String) {
  permutationHelper(word)
}

func permutationHelper(_ word: String, _ soFar: String = "") {
  if word.count == 0 {
    print(soFar)
  } else {
    for i in 0..<word.count {
      let c = word[i]  // chosen letter
      permutationHelper(word[0, i] + word[i + 1, word.count], soFar + c)
    }
  }
}

func permutationUnique(_ word: String, _ soFar: String = "", _ set: inout Set<String>) {
  if word.count == 0 {
    set.insert(soFar)
  } else {
    for i in 0..<word.count {
      let c = word[i]
      permutationUnique(word[0, i] + word[i + 1, word.count], soFar + c, &set)
    }
  }
}

// Exhaustive Search
func rollDice(_ n: Int) {
  var choices = [Int]()
  rollDiceHelper(n, choices: &choices)
}

func rollDiceHelper(_ n: Int, choices: inout [Int]) {
  if n == 0 {
    print(choices)
  } else {
    for i in 1...6 {
      // choose one
      choices.append(i)
      // explore
      rollDiceHelper(n - 1, choices: &choices)
      // unchoose
      choices.removeLast()
    }
  }
}
