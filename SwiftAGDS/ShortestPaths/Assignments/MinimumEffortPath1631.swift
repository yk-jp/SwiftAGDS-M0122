//
//  MinimumEffortPath1631.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2021-09-07.
//  Copyright © 2021 Derrick Park. All rights reserved.
//

import Foundation

func minimumEffortPath(_ heights: [[Int]]) -> Int {
  let n = heights.count
  let m = heights[0].count
  
  var dist = [[Int]](repeating: [Int](repeating: 1000001, count: m), count: n)
  dist[0][0] = 0
  
  let dx = [0, 1, 0, -1]
  let dy = [1, 0, -1, 0]
  let q = Queue<(Int, Int)>()
  q.enqueue(item: (0, 0))
  while !q.isEmpty() {
    let (x, y) = q.dequeue()!
    for i in 0..<4 {
      let nx = x + dx[i]
      let ny = y + dy[i]
      
      if nx >= 0 && nx < n && ny >= 0 && ny < m {
        if max(dist[x][y], abs(heights[nx][ny] - heights[x][y])) < dist[nx][ny] {
          dist[nx][ny] = max(dist[x][y], abs(heights[nx][ny] - heights[x][y]))
          q.enqueue(item: (nx, ny))
        }
      }
    }
  }
  
  return dist[n - 1][m - 1]
}
