//
//  PrettyNumber.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-08-25.
//

import Foundation

func prettyNumber(_ n: Int) -> Int {
  // d[N][L] = the number of pretty numbers with N digits (ends with L)
  // Recurrence Relation
  // d[N][L] = d[N-1][L-1] + d[N-1][L+1] where 1 <= L <= 8
  // d[N][L] = d[N-1][L-1] where L = 9
  // d[N][L] = d[N-1][L+1] where L = 0
  var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 101)
  for i in 1...9 {
    d[1][i] = 1
  }
  for i in 2...n {
    for j in 0...9 {
      d[i][j] = 0
      if j >= 1 {
        d[i][j] += d[i-1][j-1]
      }
      if j <= 8 {
        d[i][j] += d[i-1][j+1]
      }
    }
  }
  
  var ans = 0
  for i in 0...9 {
    ans += d[n][i]
  }
  return ans
}
