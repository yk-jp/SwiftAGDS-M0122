//
//  OneTwoThree.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/10/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// 5. One Two Three
func oneTwoThree() {
  var dp = [Int](repeating: 0, count: 12)
  dp[1] = 1
  dp[2] = 2
  dp[3] = 4
  for i in 4...11 {
    dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
  }
  
  var t = Int(readLine()!)!
  while t > 0 {
    let n = Int(readLine()!)!
    print(dp[n])
    t -= 1
  }
}
