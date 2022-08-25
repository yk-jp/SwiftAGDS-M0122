//
//  MCF.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 8/7/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

// 1. Kruskal's algorithm -> MST -> the cost
public struct MCF {
  public struct UF {
    /// parent[i] = parent of i
    private var parent: [Int]
    /// size[i] = number of nodes in tree rooted at i
    private var size: [Int]
    /// number of components
    private(set) var count: Int
    
    /// Initializes an empty union-find data structure with **n** elements
    /// **0** through **n-1**.
    /// Initially, each elements is in its own set.
    /// - Parameter n: the number of elements
    public init(_ n: Int) {
      self.count = n
      self.size = [Int](repeating: 1, count: n)
      self.parent = [Int](repeating: 0, count: n)
      for i in 0..<n {
        self.parent[i] = i
      }
    }
    
    /// Returns the canonical element(root) of the set containing element `p`.
    /// - Parameter p: an element
    /// - Returns: the canonical element of the set containing `p`
    public mutating func find(_ p: Int) -> Int {
      var root = p
      while root != parent[root] { // find the root
        root = parent[root]
      }
      var p = p
      while p != root {
        let newp = parent[p]
        parent[p] = root  // path compression
        p = newp
      }
      return root
    }
    
    /// Returns `true` if the two elements are in the same set.
    /// - Parameters:
    ///   - p: one elememt
    ///   - q: the other element
    /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
      return find(p) == find(q)
    }
    
    /// Merges the set containing element `p` with the set containing
    /// element `q`
    /// - Parameters:
    ///   - p: one element
    ///   - q: the other element
    @discardableResult
    public mutating func union(_ p: Int, _ q: Int) -> Bool {
      let rootP = find(p)
      let rootQ = find(q)
      guard rootP != rootQ else { return false } // already connected
      
      // make smaller root point to larger one
      if size[rootP] < size[rootQ] {
        parent[rootP] = rootQ
        size[rootQ] += size[rootP]
      } else {
        parent[rootQ] = rootP
        size[rootP] += size[rootQ]
      }
      count -= 1
      return true
    }
  }

  public struct Edge: Comparable {
    private(set) var u: Int
    private(set) var v: Int
    private(set) var weight: Int
    private(set) var active: Int
    
    init(_ u: Int, _ v: Int, _ weight: Int, _ active: Int) {
      self.u = u
      self.v = v
      self.weight = weight
      self.active = active
    }
    
    public static func < (lhs: MCF.Edge, rhs: MCF.Edge) -> Bool {
      if lhs.weight != rhs.weight { return lhs.weight < rhs.weight }
      return  lhs.active > rhs.active
    }
  }
  
  func solve() {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (N, M, D) = (line[0], line[1], line[2])
    var edges = [Edge](unsafeUninitializedCapacity: M) { (buffer, count) in
      for i in 0..<M {
        let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
        if i < N - 1 {
          buffer[i] = Edge(edge[0], edge[1], edge[2], 1)
        } else {
          buffer[i] = Edge(edge[0], edge[1], edge[2], 0)
        }
      }
      count = M
    }
    
    // sort edges (M log M)
    edges.sort()
    
    var uf = UF(N + 1)
    var (days, count, max, i) = (0, 0, 0, 0)
    
    // get MST -> optimized plan
    while i < M {
      if count == N - 1 { break }
      let e = edges[i]
      if uf.union(e.u, e.v) {
        count += 1
        max = e.weight // the max cost pipe in the optimized plan
        if e.active == 0 { days += 1 }
      }
      i += 1
    }
    
    // either days or days - 1 is the answer.
    // check if we can use enhancer to reduce one day.
    // want to replace the inactive pipe (heaviest) with an active pipe with same or less MST cost.
    if edges[i - 1].active == 0 {
      var uf2 = UF(N + 1) // another Kruskal's algorithm since the replaced active pipe should form a MST.
      for e in edges {
        if !uf2.connected(e.u, e.v) {
          if e.weight < max || (e.weight == max && e.active == 1) {
            // all pipes that were part of the optimized plan should be included.
            uf2.union(e.u, e.v)
          } else if e.active == 1 && e.weight <= D {
            // active pipe that has the cost less than or equal to the enhancer.
            // because the MST cost has to be less than or equal to the previous optimized plan.
            // (otherwise, there's no reason to replace.)
            days -= 1
            break
          }
        }
      }
    }
    print(days)
  }
}
