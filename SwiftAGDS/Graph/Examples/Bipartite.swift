//
//  Bipartite.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-07-29.
//

import Foundation

func bipartite() {
  
  // check[v] = 0 (not visited yet)
  //            1 (green)
  //            2 (blue)
  func dfs(start: Int, color: Int, adjList: inout [[Int]], check: inout [Int]) {
    check[start] = color
    for v in adjList[start] {
      if check[v] == 0 {
        dfs(start: v, color: 3 - color, adjList: &adjList, check: &check)
      }
    }
  }
  
  let tests = Int(readLine()!)!
  for _ in 0..<tests {
    let firstList = readLine()!.split(separator: " ")
    let n = Int(firstList[0])!
    let m = Int(firstList[1])!
    
    var adjList = [[Int]](repeating: [], count: n + 1)
    for _ in 0..<m {
      let edge = readLine()!.split(separator: " ")
      let u = Int(edge[0])!
      let v = Int(edge[1])!
      adjList[u].append(v)
      adjList[v].append(u)
    }
    
    // coloring vertices using dfs
    var check = [Int](repeating: 0, count: n + 1)
    for v in 1...n {
      dfs(start: v, color: 1, adjList: &adjList, check: &check)
    }
    
    // verify
    for u in 0..<adjList.count {
      for v in 0..<adjList[u].count {
        let next = adjList[u][v]
        if check[u] == check[next] {
          print("NO")
          return
        }
      }
    }
    
    print("YES")
  }
}

