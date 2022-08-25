//
//  maximumSubarray.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/13/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

// * d[i] = the largest sum where nums[i] is the last element
// * Recurrence relation
// d[n] = max(d[n-1] + nums[n], nums[n])
// - shoud I restart from n?
// - should I keep adding from n-1th?

/// 13. Maximum Subarray (Leetcode 53)
/// - Parameter nums: an integer array nums
/// - Returns: return the contiguous subarray (containing at least one number) which has the largest sum and return its sum
func maxSubArray(_ nums: [Int]) -> Int {
  let n = nums.count
  var dp = [Int](repeating: 0, count: n)
  dp[0] = nums[0]
  for i in 1..<n {
    dp[i] = nums[i]
    if dp[i] < dp[i-1] + nums[i] {
      dp[i] = dp[i-1] + nums[i]
    }
  }
  
  return dp.max()!
}
