//
//  FindTheCity1334.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2021-09-07.
//

import Foundation

func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
  var d = [[Int]](repeating: [Int](repeating: 10001, count: n), count: n)
  
  for edge in edges {
    let u = edge[0]
    let v = edge[1]
    let w = edge[2]
    d[u][v] = w
    d[v][u] = w
  }
  for i in 0..<n {
    d[i][i] = 0
  }
  
  // floyd-warshall
  for k in 0..<n {
    for i in 0..<n {
      for j in 0..<n {
        if d[i][j] > d[i][k] + d[k][j] {
          d[i][j] = d[i][k] + d[k][j]
        }
      }
    }
  }
  
  var smallest = n
  var city = 0
  for i in 0..<n {
    var count = 0
    for j in 0..<n {
      if d[i][j] <= distanceThreshold {
        count += 1
      }
    }
    if count <= smallest {
      smallest = count
      city = i
    }
  }
  
  return city
}
