//
//  2xNTiles2.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/10/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// 4. 2 x N Tiles
/// - Parameter n: the width
/// - Returns: the number of ways to fill 2 x N tiles with 1 x 2, 2 x 1, 2 x 2
/// Time Complexity: O(N)
/// Space Complexity: O(N) -> O(1) two variables (Ref. Climbing Stairs)
func twoByNTiles2(_ n: Int) -> Int {
  if n <= 1 { return n }
  
  var dp = [Int](repeating: 0, count: n + 1)
  dp[1] = 1
  dp[2] = 3
  for i in 3...n {
    dp[i] = dp[i - 1] + dp[i - 2] * 2
  }
  return dp[n]
}
