//
//  Backtracking.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-07-14.
//

import Foundation

/// Backtracking Problem
/// Output all combinations of die values that add up to the desired sum.
/// - Parameters:
///   - n: the number of dice
///   - sum: a desired sum
///
var counter = 0

func rollDiceSumNaive(_ n: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumHelperNaive(n, sum, &choices)
}

func rollDiceSumHelperNaive(_ n: Int, _ sum: Int, _ choices: inout [Int]) {
  counter += 1
  if n == 0 {
    if sum == 0 {
      print(choices)
    }
  } else {
    for i in 1...6 {
      // choose one
      choices.append(i)
      // explore
      rollDiceSumHelperNaive(n - 1, sum - i, &choices)
      // unchoose
      choices.removeLast()
    }
  }
}

// Optimized
func rollDiceSum(_ n: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumHelper(n, sum, 0, &choices)
}

func rollDiceSumHelper(_ n: Int, _ desiredSum: Int, _ soFar: Int, _ choices: inout [Int]) {
  counter += 1
  if n == 0 {
    if desiredSum == soFar {
      print(choices)
    }
  } else {
    for i in 1...6 {
      if (soFar + i + (n - 1) * 1 <= desiredSum) && (soFar + i + (n - 1) * 6 >= desiredSum) { // prune the tree
        // choose one
        choices.append(i)
        // explore
        rollDiceSumHelper(n - 1, desiredSum, soFar + i, &choices)
        // unchoose
        choices.removeLast()
      }
    }
  }
}
