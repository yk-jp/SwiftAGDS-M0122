//
//  NetworkDelayTime743.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2021-09-02.
//

import Foundation
func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
  var adjList = [[(v: Int, w: Int)]](repeating: [(Int, Int)](), count: n + 1)
  for time in times {
    adjList[time[0]].append((v: time[1], w: time[2]))
  }
  var c = [Bool](repeating: false, count: n + 1)
  var d = [Int](repeating: 101, count: n + 1)
  // starting node k
  d[k] = 0
  
  for _ in 0..<n-1 {
    var min = 101
    var minVertex = 1
    for v in 1...n {
      if !c[v] && d[v] < min {
        min = d[v]
        minVertex = v
      }
    }
    c[minVertex] = true
    for edge in adjList[minVertex] {
      if d[edge.v] > d[minVertex] + edge.w {
        d[edge.v] = d[minVertex] + edge.w
      }
    }
  }
  
  var res = 0
  for i in 1...n {
    if res < d[i] {
      res = d[i]
    }
  }
  return res < 101 ? res : -1
}
