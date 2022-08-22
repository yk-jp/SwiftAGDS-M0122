//
//  DijkstraArray.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/4/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// "Edge Relaxation"
/// dist[]: an array of elements representing distance(cost, weight)
/// For each edge (u, v)
///   if dist[v] > dist[u] + w(u, v)
///     dist[v] = dist[u] + w(u, v)

/// Dijkstra's Algorithm (Shortest Path)
/// - Greedy algorithm
func DijkstraArray() {

  /// All vertices starting from 1 to n
  func dijkstra(_ adj: [(u: Int, v: Int, w: Int)], _ src: Int) -> [Int] {
    let n = adj.count
    var adjList = [[(v: Int, w: Int)]](repeating: [(Int, Int)](), count: n + 1)
    for edge in adj {
      adjList[edge.u].append((v: edge.v, w: edge.w))
    }
    var c = [Bool](repeating: false, count: n + 1)
    var d = [Int](repeating: Int.max, count: n + 1)

    // starting node src
    d[src] = 0
    
    for _ in 0..<n-1 {
      var minWeight = Int.max
      var minVertex = 1
      for v in 1...n {
        if !c[v] && d[v] < minWeight {
          minWeight = d[v]
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
    
    return d
  }
    
  /// * query shortest path
  ///
  /// let shortestPath = dijkstra(...)
  /// print(shortestPath[2]) // shortest path from src to vertex 2
}
