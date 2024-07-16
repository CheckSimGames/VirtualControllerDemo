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
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    
    var virtualController: GCVirtualController?
    
    override func sceneDidLoad() {
        placePlayer()
        connectVirtualController()
        self.lastUpdateTime = 0
    }
    
    func placePlayer() {
        let startX = 0
        let startY = 0
        
        player.sprite.node.position = CGPoint(x: startX, y: startY)
        player.sprite.node.entity = player
        addChild(player.sprite.node)
    }
    
    func connectVirtualController() {
        let controllerConfig = GCVirtualController.Configuration()
        controllerConfig.elements = [GCInputLeftThumbstick]
        
        let controller = GCVirtualController(configuration: controllerConfig)
        controller.connect()
        virtualController = controller
        
        // TODO: Get an event handler for the dpad working so I don't have to poll on every update.
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
            self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        movePlayer()
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
    
    func movePlayer() {
        if let xValue = virtualController?.controller?.extendedGamepad?.leftThumbstick.xAxis.value,
          let yValue = virtualController?.controller?.extendedGamepad?.leftThumbstick.yAxis.value {
            
            player.transform.translate(CGVector(dx: Double(xValue), dy: Double(yValue)))
          }
    }
}
