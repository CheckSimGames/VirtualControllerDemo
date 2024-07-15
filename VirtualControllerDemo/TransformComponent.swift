//
//  TransformComponent.swift
//  VirtualControllerDemo
//
//  Created by mark on 7/15/24.
//

import Foundation
import SpriteKit
import GameplayKit

class TransformComponent: GKComponent {
    private var node = SKNode()
    
    var position: CGPoint {
        get {
            node.position
        }
        set {
            node.position = newValue
        }
    }
    
    var rotation:  CGFloat {
        get {
            node.zRotation
        }
        set {
            node.zRotation = newValue
        }
    }
    
    var scale: CGSize {
        get {
            return .init(width: node.xScale, height: node.yScale)
        }
        set {
            node.xScale = newValue.width
            node.yScale = newValue.height
        }
    }

    func set(node: SKNode) {
        node.position = position
        node.zRotation = rotation
        node.xScale = scale.width
        node.yScale = scale.height
        
        self.node = node
    }
    
    func translate(_ direction: CGVector) {
        node.position.x += direction.dx
        node.position.y += direction.dy
    }
}
