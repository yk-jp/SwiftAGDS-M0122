//
//  NonDecreasingDigits.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/11/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// 7. Non-decreasing digits
/// - Parameter n: the number of digits
/// - Returns: the total number of non-decreasing digits with n digits
/// Time Complexity: O(N)
func nonDecreasingDigits(_ n: Int) -> Int {
  // Recurrence Relation
  // dp[N][L] = sum(dp[N-1][k]) where 0 <= k <= L
  var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
  for i in 0...9 { // starting from 0 because we can start from 0
    // base case where N = 1
    dp[1][i] = 1
  }
  for i in 2...n {
    for j in 0...9 {
      for k in 0...j {
        dp[i][j] += dp[i-1][k]
      }
    }
  }
  var ans = 0
  for i in 0...9 {
    ans += dp[n][i]
  }
  return ans
}

func nonDecreasingDigitsV2(_ n: Int) -> Int {
  var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
  for i in 0...9 {
    dp[1][i] = 1
  }
  for i in 2...n {
    for j in 0...9 {
      for k in 0...j {
        dp[i][j] += dp[i-1][k]
      }
    }
  }
  return dp[n].reduce(0) { $0 + $1 } // sum of dp[n]
}
