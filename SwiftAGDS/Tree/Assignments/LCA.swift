//
//  LCA.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 7/21/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func LCAN() {
  let n = Int(readLine()!)!
  var adj = [[Int]](repeating: [], count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  var depth = [Int](repeating: 0, count: n + 1)
  var parent = [Int](repeating: 0, count: n + 1)
  
  for _ in 0..<n-1 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    adj[u].append(v)
    adj[v].append(u)
  }
  
  depth[1] = 0
  check[1] = true
  let q = Queue<Int>()
  q.enqueue(item: 1)
  
  while !q.isEmpty() {
    let u = q.dequeue()!
    for v in adj[u] {
      if !check[v] {
        depth[v] = depth[u] + 1
        check[v] = true
        parent[v] = u
        q.enqueue(item: v)
      }
    }
  }
  
  var m = Int(readLine()!)!
  while m > 0 {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    var u = edge[0]
    var v = edge[1]
    if depth[u] < depth[v] {
      swap(&u, &v)
    }
    while depth[u] != depth[v] {
      u = parent[u]
    }
    while u != v {
      u = parent[u]
      v = parent[v]
    }
    print(u)
    m -= 1
  }
}
