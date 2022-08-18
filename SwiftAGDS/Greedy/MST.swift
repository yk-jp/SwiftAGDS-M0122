//
//  MST.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2022-08-18.
//

import Foundation

/// Minimum Spanning Tree Algorithms
public final class MST {
  /// Kruskal's MST Algorithm O(ElgE)
  /// Use Union-Find and Adjacency List (You can use Swift's built-in sort method.)
  /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple - graph is 1-indexed
  /// - Returns: the tuple of (minimum cost, edges)
  public static func kruskalMST(_ graph: [[(v: Int, w: Int)]]) -> (Int, [(Int, Int, Int)]) {
    var allEdges = [(u: Int, v: Int, w: Int)]()
    var mstEdges = [(u: Int, v: Int, w: Int)]()
    for (u, edges) in graph.enumerated() {
      for edge in edges {
        allEdges.append((u: u, v: edge.v, w: edge.w))
      }
    }
    
    allEdges.sort { $0.w < $1.w }  // O(ElgE) where E is the number of edges
    
    var uf = UF(graph.count + 1)
    
    for edge in allEdges { // O(E)
      if uf.connected(edge.u, edge.v) { continue }
      mstEdges.append(edge)
      uf.union(edge.u, edge.v)
    }
    
    let cost = mstEdges.map { $0.w }.reduce(0, +)
    return (cost, mstEdges)
  }
  
  /// Prim's MST Algorithm O(ElgV)
  /// Use Priority Queue (Binary Heap) and Adjacency List
  /// - Parameter graph: adjacency list of weighted undirected graph where each edge is stored as Tuple - graph is 1-indexed
  /// - Returns: the tuple of (minimum cost, edges)
  public static func primMST(_ graph: [[(v: Int, w: Int)]]) -> (Int, [(Int, Int, Int)]) {
    var mstEdges = [CompEdge]()
    var pq = IndexPriorityQueue<CompEdge>(<)  // min-heap
    var visited = [Bool](repeating: false, count: graph.count + 1)
    visited[1] = true
    
    for edge in graph[1] {
      pq.enqueue(CompEdge(u: 1, v: edge.v, w: edge.w))
    }
    
    while let edge = pq.dequeue() {
      if !visited[edge.v] {
        visited[edge.v] = true
        mstEdges.append(CompEdge(u: edge.u, v: edge.v, w: edge.w))
        for e in graph[edge.v] {
          pq.enqueue(CompEdge(u: edge.v, v: e.v, w: e.w))
        }
      }
    }
    
    let cost = mstEdges.map { $0.w }.reduce(0, +)
    let edges = mstEdges.map { ($0.u, $0.v, $0.w) }
    return (cost, edges)
  }
}

public struct CompEdge {
  public var u: Int
  public var v: Int
  public var w: Int
}

extension CompEdge: Comparable {
  public static func <(lhs: CompEdge, rhs: CompEdge) -> Bool {
    return lhs.w < rhs.w
  }
}

extension CompEdge: Hashable { }
