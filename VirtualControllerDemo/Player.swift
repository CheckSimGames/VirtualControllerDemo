//
//  Player.swift
//  VirtualControllerDemo
//
//  Created by mark on 7/15/24.
//

import Foundation
import GameplayKit

class Player: GKEntity {
    let sprite = SpriteComponent()
    let transform = TransformComponent()
    
    override init() {
        super.init()
        
        sprite.node = SKSpriteNode(color: .red, size: CGSize(width: 128, height: 128))
        addComponent(sprite)
        
        addComponent(transform)
        transform.set(node: sprite.node)        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
