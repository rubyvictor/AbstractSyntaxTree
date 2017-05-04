//: Playground - noun: a place where people can play

import UIKit


// Example:
// 5 + 25 * 6
5 + 25 * 6

// Represent the equation above in a tree
//          '+'
//        /     \
//      '*'      5
//      / \
//     25  6

// Node that represents a value or operator in Abstract Tree Syntax

class Node {
    var operation: String? // "+", "-", "*", "/"
    var value: Float?
    var leftChild: Node?
    var rightChild: Node?
    
    init(operation: String?, value: Float?, leftChild: Node?, rightChild: Node?) {
        self.operation = operation
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

// Implement this algorithm, the above tree evaluates to 155

// Left branch
let twentyfiveNode = Node(operation: nil, value: 25, leftChild: nil, rightChild: nil)
let sixNode = Node(operation: nil, value: 6, leftChild: nil, rightChild: nil)
let multiplyNode = Node(operation: "*", value: nil, leftChild: twentyfiveNode, rightChild: sixNode)


// Right branch
let fiveNode = Node(operation: nil, value: 5, leftChild: nil, rightChild: nil)

// Root of tree
let rootPlusNode = Node(operation: "+", value: nil, leftChild: multiplyNode, rightChild: fiveNode)


func evaluate(node: Node) -> Float {
    if node.value != nil {
        return node.value!
    }
    
    if node.operation == "+" {
        //Apply recursion on both left and right nodes. if use node.leftChild!.value! + node.rightChild!.value! will throw unwrapped optional error as value is nil
        
        return evaluate(node: node.leftChild!) + evaluate(node: node.rightChild!)

    } else if node.operation == "*" {
        return evaluate(node: node.leftChild!) * evaluate(node: node.rightChild!)
    } else if node.operation == "-" {
        return evaluate(node: node.leftChild!) - evaluate(node: node.rightChild!)
    } else if node.operation == "/" {
        //if node rightChild is zero throw error. ie cannot divide by zero
        return evaluate(node: node.leftChild!) / evaluate(node: node.rightChild!)
    }
    return 0
}

evaluate(node: rootPlusNode)
evaluate(node: multiplyNode)
