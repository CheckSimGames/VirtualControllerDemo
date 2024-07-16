//
//  Player.swift
//  VirtualControllerDemo
//
//  Created by mark on 7/15/24.
//

import Foundation
import GameplayKit
import GameController

class Player: GKEntity {
    let sprite = SpriteComponent()
    let transform = TransformComponent()
    var virtualController: GCVirtualController?
    
    override init() {
        super.init()
        
        connectVirtualController()
        sprite.node = SKSpriteNode(color: .red, size: CGSize(width: 128, height: 128))
        addComponent(sprite)
        
        addComponent(transform)
        transform.set(node: sprite.node)        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func connectVirtualController() {
        let controllerConfig = GCVirtualController.Configuration()
        controllerConfig.elements = [GCInputLeftThumbstick]
        
        let controller = GCVirtualController(configuration: controllerConfig)
        controller.connect()
        virtualController = controller
        
        // TODO: Get an event handler for the dpad working so I don't have to poll on every update.
    }

    func movePlayer() {
        if let xValue = virtualController?.controller?.extendedGamepad?.leftThumbstick.xAxis.value,
          let yValue = virtualController?.controller?.extendedGamepad?.leftThumbstick.yAxis.value {
            
            transform.translate(CGVector(dx: Double(xValue), dy: Double(yValue)))
          }
    }

}
