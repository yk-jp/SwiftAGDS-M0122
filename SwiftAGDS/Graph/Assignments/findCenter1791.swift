//
//  findCenter1791.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2021-08-13.
//

import Foundation

func findCenter(_ edges: [[Int]]) -> Int {
  if edges[0][0] == edges[1][1] || edges[0][0] == edges[1][0] {
    return edges[0][0]
  } else {
    return edges[0][1]
  }
}
