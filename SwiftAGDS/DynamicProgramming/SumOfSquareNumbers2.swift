//
//  SumOfSquareNumbers2.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/12/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// 10. Sum of Square Numbers 2
/// - Parameter n: non-negative integer
/// - Returns: the minimum number of squares needed to sum to N
/// Time Complexity: O(NsqrtN)
func minSquareSum(_ n: Int) -> Int {
  // Recurrence Relation
  // dp[N] = min(dp[N - j * j] + 1) where 1 <= j * j <= N
  var dp = [Int](repeating: 0, count: n + 1)
  for i in 1...n {
    dp[i] = i
    var j = 1
    while j * j <= i {
      if dp[i] > dp[i - j * j] + 1 {
        dp[i] = dp[i - j * j] + 1
      }
      j += 1
    }
  }
  return dp[n]
}

func minSquareSumWrongGreedy(_ n: Int) -> Int {
  var n = n
  var count = 0
  while n > 0 { // O(sqrt n)
    let sqrtn = Int(Double(n).squareRoot())
    n = n - sqrtn * sqrtn
    count += 1
  }
  return count
}
