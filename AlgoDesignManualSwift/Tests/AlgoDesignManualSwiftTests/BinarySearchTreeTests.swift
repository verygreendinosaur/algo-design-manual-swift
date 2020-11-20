//
//  BinarySearchTreeTests.swift
//  AlgoDesignManualSwiftTests
//
//  Created by Christopher Poole on 11/19/20.
//

import XCTest
@testable import AlgoDesignManualSwift

final class BinarySearchTreeTests: XCTestCase {
  
  func test_constructor() {
    let root = setupTreeHelper()
    
    XCTAssertEqual(root.val, 2)
    XCTAssertEqual(root.left!.val, 1)
    XCTAssertEqual(root.right!.val, 3)
  }
  
  func test_search() {
    let root = setupTreeHelper()
    
    XCTAssertNotNil(BinaryTree.search(for: 3, in: root))
    XCTAssertEqual(BinaryTree.search(for: 3, in: root)!.val, 3)
    
    XCTAssertNotNil(BinaryTree.search(for: 2, in: root))
    XCTAssertEqual(BinaryTree.search(for: 2, in: root)!.val, 2)

    XCTAssertNotNil(BinaryTree.search(for: 1, in: root))
    XCTAssertEqual(BinaryTree.search(for: 1, in: root)!.val, 1)
    
    XCTAssertNil(BinaryTree.search(for: 0, in: root))
    XCTAssertNil(BinaryTree.search(for: 4, in: root))
    
    XCTAssertNotNil(BinaryTree.search(for: 3, in: root.right))
    XCTAssertEqual(BinaryTree.search(for: 3, in: root.right)!.val, 3)
  }
  
  func test_findMax() {
    let root = setupTreeHelper()
    
    XCTAssertNotNil(BinaryTree.findMax(in: root))
    XCTAssertEqual(BinaryTree.findMax(in: root)!.val, 3)
  }
  
  func test_findMin() {
    let root = setupTreeHelper()
    
    XCTAssertNotNil(BinaryTree.findMin(in: root))
    XCTAssertEqual(BinaryTree.findMin(in: root)!.val, 1)
  }
  
  func test_findMinAndMax() {
    let root = setupTreeHelper()
    let result = BinaryTree.findMinAndMax(in: root)
    
    XCTAssertEqual(result.min!.val, 1)
    XCTAssertEqual(result.max!.val, 3)
  }
  
  func test_traverse() {
    let root = setupTreeHelper()
    var results: [Int] = []
    BinaryTree.traverse(root) { node in
      results.append(node.val)
    }
    
    XCTAssertEqual(results, [1,2,3])
  }
  
  func setupTreeHelper() -> BinaryTreeNode {
    let two = BinaryTreeNode(2)
    let one = BinaryTreeNode(1)
    let three = BinaryTreeNode(3)

    two.left = one
    two.right = three
    return two
  }
  
}
