//
//  MaxProbability1514.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2021-09-07.
//

import Foundation

func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
  var dist = [Double](repeating: 0.0, count: n)
  var check = [Bool](repeating: false, count: n)
  dist[start] = 1.0
  var adj = [[(v: Int, w: Double)]](repeating: [], count: n)
  for (i, edge) in edges.enumerated() {
    let u = edge[0]
    let v = edge[1]
    let w = succProb[i]
    adj[u].append((v, w))
    adj[v].append((u, w))
  }
  
  let q = Queue<Int>()
  q.enqueue(item: start)
  check[start] = true
  while !q.isEmpty() {
    let from = q.dequeue()!
    check[from] = false
    for edge in adj[from] {
      let to = edge.v
      let cost = edge.w
      if dist[to] < dist[from] * cost {
        dist[to] = dist[from] * cost
        if !check[to] {
          q.enqueue(item: to)
          check[to] = true
        }
      }
    }
  }
  
  return dist[end]
}
