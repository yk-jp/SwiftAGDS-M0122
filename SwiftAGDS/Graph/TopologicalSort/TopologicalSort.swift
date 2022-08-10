//
//  TopologicalSort.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-08-11.
//

import Foundation

func topologicalSort() {
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let N = firstLine[0]
  let M = firstLine[1]
  
  var adj = [[Int]](repeating: [Int](), count: N + 1)
  var indegree = [Int](repeating: 0, count: N + 1)
  for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    indegree[v] += 1
  }
  
  // Topological Sort - Using BFS
  let q = Queue<Int>()
  // checking the initial state
  for v in 1...N {
    if indegree[v] == 0 {
      q.enqueue(item: v)
    }
  }
  
  // BFS O(V+E)
  while !q.isEmpty() {
    let u = q.dequeue()!
    print(u)  // print in topological order
    for v in adj[u] {
      indegree[v] -= 1  // decrement indegree of all connected vertices
      if indegree[v] == 0 {
        q.enqueue(item: v)
      }
    }
  }
}
