//
//  RepeatingSequence.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/23/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func RepeatingSequence() {
  
  func next(A: Int, P: Int) -> Int {
    return
      String(A)
        .compactMap { power(base: Int(String($0))!, exponent: P) }
        .reduce(0, +)
  }
  
  func length(A: Int, P: Int, seq: Int, check: inout [Int]) -> Int {
    if check[A] != 0 {
      return check[A] - 1
    }
    check[A] = seq
    let nx = next(A: A, P: P)
    return length(A: nx, P: P, seq: seq + 1, check: &check)
  }
  
  var check = [Int](repeating: 0, count: 1_000_000)
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let A = input[0]
  let P = input[1]
  print(length(A: A, P: P, seq: 1, check: &check))
}













