//
//  AdjacencyList.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-07-27.
//

import Foundation

func adjacencyListRepresentation() {
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
  
  for (u, row) in adjList.enumerated() {
    print("\(u) : \(row)")
  }
}

func adjacencyListWeightedRepresentation() {
  let firstLine = readLine()!.split(separator: " ")
  // # of vertices
  let n = Int(firstLine[0])!
  // # of edges
  let m = Int(firstLine[1])!
  
  // adjacency list
  var adjList = [[(Int, Int)]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    let w = Int(edge[2])!
    
    adjList[u].append((v, w))
    adjList[v].append((u, w)) // undirected graph
  }
  
  for (u, row) in adjList.enumerated() {
    print("\(u) : \(row)")
  }
}
