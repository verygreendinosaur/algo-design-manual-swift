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
    
    XCTAssertNotNil(BinarySearchTree.search(for: 3, in: root))
    XCTAssertEqual(BinarySearchTree.search(for: 3, in: root)!.val, 3)
    
    XCTAssertNotNil(BinarySearchTree.search(for: 2, in: root))
    XCTAssertEqual(BinarySearchTree.search(for: 2, in: root)!.val, 2)

    XCTAssertNotNil(BinarySearchTree.search(for: 1, in: root))
    XCTAssertEqual(BinarySearchTree.search(for: 1, in: root)!.val, 1)
    
    XCTAssertNil(BinarySearchTree.search(for: 0, in: root))
    XCTAssertNil(BinarySearchTree.search(for: 4, in: root))
    
    XCTAssertNotNil(BinarySearchTree.search(for: 3, in: root.right))
    XCTAssertEqual(BinarySearchTree.search(for: 3, in: root.right)!.val, 3)
  }
  
  func test_findMax() {
    let root = setupTreeHelper()
    
    XCTAssertNotNil(BinarySearchTree.findMax(in: root))
    XCTAssertEqual(BinarySearchTree.findMax(in: root)!.val, 3)
  }
  
  func test_findMin() {
    let root = setupTreeHelper()
    
    XCTAssertNotNil(BinarySearchTree.findMin(in: root))
    XCTAssertEqual(BinarySearchTree.findMin(in: root)!.val, 1)
  }
  
  func test_findMinAndMax() {
    let root = setupTreeHelper()
    let result = BinarySearchTree.findMinAndMax(in: root)
    
    XCTAssertEqual(result.min!.val, 1)
    XCTAssertEqual(result.max!.val, 3)
  }
  
  func test_traverse() {
    let root = setupTreeHelper()
    var results: [Int] = []
    BinarySearchTree.traverse(root) { node in
      results.append(node.val)
    }
    
    XCTAssertEqual(results, [1,2,3])
  }
  
  func test_insert() {
    let root = setupTreeHelper()
    
    BinarySearchTree.insert(4, in: root)
    
    XCTAssertEqual(root.right!.right!.val, 4)
    XCTAssertEqual(valuesInOrder(in: root), [1,2,3,4])
    
    BinarySearchTree.insert(6, in: root)
    
    XCTAssertEqual(root.right!.right!.right!.val, 6)
    XCTAssertEqual(valuesInOrder(in: root), [1,2,3,4,6])
    
    BinarySearchTree.insert(7, in: root)
    
    XCTAssertEqual(root.right!.right!.right!.right!.val, 7)
    XCTAssertEqual(valuesInOrder(in: root), [1,2,3,4,6,7])
    
    BinarySearchTree.insert(5, in: root)
    
    XCTAssertEqual(root.right!.right!.right!.left!.val, 5)
    XCTAssertEqual(valuesInOrder(in: root), [1,2,3,4,5,6,7])
  }
  
  func setupTreeHelper() -> BinaryTreeNode {
    let two = BinaryTreeNode(2)
    let one = BinaryTreeNode(1)
    let three = BinaryTreeNode(3)

    two.left = one
    two.right = three
    return two
  }
  
  func valuesInOrder(in root: BinaryTreeNode) -> [Int] {
    var results: [Int] = []
    BinarySearchTree.traverse(root) { node in
      results.append(node.val)
    }
    
    return results
  }
  
}
