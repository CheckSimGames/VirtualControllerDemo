//
//  GameScene.swift
//  VirtualControllerDemo
//
//  Created by mark on 7/15/24.
//

import SpriteKit
import GameplayKit
import GameController

class GameScene: SKScene {
    var player = Player()
    
    override func sceneDidLoad() {
        placePlayer()
    }
    
    func placePlayer() {
        let startX = 0
        let startY = 0
        
        player.sprite.node.position = CGPoint(x: startX, y: startY)
        player.sprite.node.entity = player
        addChild(player.sprite.node)
    }
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchMoved(toPoint: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
