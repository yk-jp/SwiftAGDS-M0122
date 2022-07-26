//
//  ConnectedComponents.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-07-27.
//

import Foundation

func connectedComponents() {
  let firstLine = readLine()!.split(separator: " ")
  // # of vertices
  let n = Int(firstLine[0])!
  // # of edges
  let m = Int(firstLine[1])!
  
  // adjacency list
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    adjList[u].append(v)
    adjList[v].append(u) // undirected graph
  }
  
  func dfs(start: Int, adjList: inout [[Int]], visited: inout [Bool]) {
    visited[start] = true
    print(start)
    for v in adjList[start] {
      if !visited[v] {
        dfs(start: v, adjList: &adjList, visited: &visited)
      }
    }
  }
  
  var count = 0
  var visited = [Bool](repeating: false, count: n + 1)
  for v in 1..<adjList.count {
    if !visited[v] {
      dfs(start: v, adjList: &adjList, visited: &visited)
      count += 1
    }
  }
  print(count)
}
