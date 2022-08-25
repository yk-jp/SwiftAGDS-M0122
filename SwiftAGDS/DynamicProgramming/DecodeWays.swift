//
//  DecodeWays.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/13/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// 12. Decode Ways (Leetcode 91)
/// - Parameter s: non-empty string containing only digits
/// - Returns: the total number of ways to decode it
/// BOTTOM-UP approach
/// dp[n] = the number of ways to decode n digits
func numDecodings(_ s: String) -> Int {
  let arr = Array(s)
  var dp = [Int](repeating: 0, count: s.count + 1)
  dp[0] = 1
  dp[1] = s.first! == "0" ? 0 : 1
  if s.count >= 2 {
    for i in 2...s.count {
      let firstDigit = Int(String(arr[i - 1]))!
      if firstDigit >= 1 {
        dp[i] += dp[i - 1]
      }
      let twoDigits = firstDigit + Int(String(arr[i - 2]))! * 10
      if twoDigits >= 10 && twoDigits <= 26 {
        dp[i] += dp[i - 2]
      }
    }
  }
  return dp[s.count]
}

/// TOP-DOWN approach
func numDecodingsTD(_ s: String) -> Int {
  var dp = [Int](repeating: 0, count: s.count + 1)
  let arr = Array(s)
  return numDecodingsHelperTD(arr, s.count, &dp)
}

func numDecodingsHelperTD(_ s: [Character], _ i: Int, _ dp: inout [Int]) -> Int {
  if i == 0 { return 1 }
  let startIndex = s.count - i
  if s[startIndex].asciiValue! - 48 == 0 {
    return 0
  }
  if dp[i] != 0 {
    return dp[i]
  }
  var result = numDecodingsHelperTD(s, i - 1, &dp)
  if i >= 2 && (s[startIndex].asciiValue! - 48) * 10 + (s[startIndex + 1].asciiValue! - 48) <= 26 {
    result += numDecodingsHelperTD(s, i - 2, &dp)
  }
  dp[i] = result
  return result
}

