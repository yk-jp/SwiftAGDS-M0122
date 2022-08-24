//
//  ClimbingStairs.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-08-24.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
  // 1. d[n] = the number of distinct ways to climb n stairs
  // ...
  // 3. d[n] = d[n - 1] + d[n - 2]
  if n <= 2 { return n }
  var d = [Int](repeating: 0, count: n + 1)
  d[1] = 1
  d[2] = 2
  for i in 3...n {
    d[i] = d[i - 1] + d[i - 2]
  }
  return d[n]
}
