//
//  Pokemon.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2021-04-20.
//  Copyright © 2021 Derrick Park. All rights reserved.
//

import Foundation

// dp[i][j] = max(dp[i-1][j] + grid[i][j], dp[i][j-1] + grid[i][j]) where grid is the given grid
func pokemon() {
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let n = firstLine[0]
  let m = firstLine[1]
  
  var grid = [[Int]]()
  var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
  
  for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(row)
  }
  
  for i in 0..<n {
    for j in 0..<m {
      dp[i][j] = grid[i][j]
      if i - 1 >= 0 {
        dp[i][j] = max(dp[i][j], dp[i-1][j] + grid[i][j])
      }
      if j - 1 >= 0 {
        dp[i][j] = max(dp[i][j], dp[i][j-1] + grid[i][j])
      }
    }
  }
  print(dp[n-1][m-1])
}
