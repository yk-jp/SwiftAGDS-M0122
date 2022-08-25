//
//  FindCheapestPrice.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2021-09-07.
//

import Foundation

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
  var dist = [Int](repeating: Int.max, count: n + 1)
  dist[src] = 0
  
  // K + 1 times (K stops)
  for _ in 0...k {
    var tmp = dist
    for flight in flights {
      let u = flight[0]
      let v = flight[1]
      let w = flight[2]
      if dist[u] == Int.max {
        continue
      }
      tmp[v] = min(tmp[v], dist[u] + w)
    }
    dist = tmp
  }
  return dist[dst] == Int.max ? -1 : dist[dst]
}
