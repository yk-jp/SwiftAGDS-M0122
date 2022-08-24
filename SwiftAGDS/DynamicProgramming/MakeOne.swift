//
//  MakeOne.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-08-24.
//

import Foundation

func makeOne(_ n: Int) -> Int {
  // d[n] = the minimum number of operations used to make 1 for n
  // d[n] = min(d[n/2] + 1, d[n/3] + 1, d[n-1] + 1)
  var d = [Int](repeating: 0, count: n + 1)
  d[1] = 0
  for i in 2...n {
    d[i] = d[i - 1] + 1
    if i % 2 == 0 && d[i] > d[i / 2] + 1 {
      d[i] = d[i / 2] + 1
    }
    if i % 3 == 0 && d[i] > d[i / 3] + 1 {
      d[i] = d[i / 3] + 1
    }
  }
  return d[n]
}
