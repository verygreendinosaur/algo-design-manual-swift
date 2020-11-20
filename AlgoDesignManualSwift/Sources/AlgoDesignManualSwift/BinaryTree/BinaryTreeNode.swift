//
//  BinaryTreeNode.swift
//  
//
//  Created by Christopher Poole on 11/19/20.
//

import Foundation

typealias BinaryTree = BinaryTreeNode

class BinaryTreeNode {
  
  var val: Int
  var left: BinaryTreeNode?
  var right: BinaryTreeNode?
  
  init(_ val: Int) {
    self.val = val
  }
  
}

extension BinaryTree {
  
  /// Search for target value in a BST. If value exists, return the node. If value does not exist, return nil. This version of a BST **does not support duplicate items**. Time: O(*h*) where *h* is height of tree. Space: No new space allocated.
  static func search(for target: Int, in tree: BinaryTreeNode?) -> BinaryTreeNode? {
    return searchHelper(for: target, in: tree)
  }
  
  private static func searchHelper(for target: Int, in tree: BinaryTreeNode?) -> BinaryTreeNode? {
    // If node is nil, return nil
    guard let node = tree else { return nil }
    
    // If target value is equal to node, return node
    if node.val == target { return node }
    
    // If target value is less than node, return search on left child
    // Else, return search on right child
    if target < node.val {
      return searchHelper(for: target, in: node.left)
    } else {
      return searchHelper(for: target, in: node.right)
    }
  }
  
  /// Finds the max value in the BST. If the value exists, return the node. If the value does not exist, return nil.
  static func findMax(in root: BinaryTreeNode?) -> BinaryTreeNode? {
    return findMaxHelper(in: root)
  }
  
  private static func findMaxHelper(in root: BinaryTreeNode?) -> BinaryTreeNode? {
    guard let node = root else { return nil }
    
    if let right = node.right {
      return findMax(in: right)
    } else {
      return node
    }
  }
  
  /// Finds the min value in the BST. If the value exists, return the node. If the value does not exist, return nil.
  static func findMin(in root: BinaryTreeNode?) -> BinaryTreeNode? {
    return findMinHelper(in: root)
  }
  
  private static func findMinHelper(in root: BinaryTreeNode?) -> BinaryTreeNode? {
    guard let node = root else { return nil }
    
    if let left = node.left {
      return findMin(in: left)
    } else {
      return node
    }
  }
  
  /// Finds the min value in the BST. If the value exists, return the node. If the value does not exist, return nil.
  static func findMinAndMax(in root: BinaryTreeNode?) -> (min: BinaryTreeNode?, max: BinaryTreeNode?) {
    return (findMinHelper(in: root), findMaxHelper(in: root))
  }
  
  /// Traverses the BST in order. Performs the specified action on each node.
  static func traverse(_ root: BinaryTreeNode?, _ handler: (BinaryTreeNode) -> Void) {
    traverseHelper(root, handler)
  }
  
  private static func traverseHelper(_ root: BinaryTreeNode?, _ handler: (BinaryTreeNode) -> Void) {
    guard let node = root else { return }
    
    traverseHelper(node.left, handler)
    handler(node)
    traverseHelper(node.right, handler)
  }
  
}
