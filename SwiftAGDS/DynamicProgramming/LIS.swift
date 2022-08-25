//
//  LIS.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-08-25.
//

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
  // d[N] = the length of the longest increasing subsequence where the last element is nums[n]
  // d[i] = max(d[j] + 1, 1) where 0 <= j < i && (nums[j] < nums[i])
  // d[i] = 1 if there's no element less than nums[i]
  let n = nums.count
  var d = [Int](repeating: 1, count: n + 1)
  for i in 1...n {
    var length = 1
    for j in 0...i-1 {
      if nums[j] < nums[i] {
        length = max(length, d[j] + 1)
      }
    }
    d[i] = length
  }
  
  return d.max()!
}
