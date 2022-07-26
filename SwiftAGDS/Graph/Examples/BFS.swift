//
//  BFS.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-07-27.
//

import Foundation

func adjacencyListAndBFS() {
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
  
  // BFS
  var visited = [Bool](repeating: false, count: n + 1)
  let queue = Queue<Int>()
  queue.enqueue(item: 1)
  visited[1] = true
  while !queue.isEmpty() {
    let vertex = queue.dequeue()!
    print(vertex)
    for v in adjList[vertex] {
      if !visited[v] {
        queue.enqueue(item: v)
        visited[v] = true
      }
    }
  }
}
