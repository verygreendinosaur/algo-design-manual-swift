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
  
}
