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
        
        // Set up the controller to move the player when they move the virtual joystick.
        let movementHandler: GCControllerDirectionPadValueChangedHandler = { dPad, xValue, yValue in
            self.movePlayer(x: xValue, y: yValue)
        }
        
        if let gamePad = virtualController?.controller?.extendedGamepad {
            gamePad.leftThumbstick.valueChangedHandler = movementHandler
        }
    }

    func movePlayer(x: Float, y: Float) {
        transform.translate(CGVector(dx: Double(x), dy: Double(y)))
        if let xValue = virtualController?.controller?.extendedGamepad?.leftThumbstick.xAxis.value,
          let yValue = virtualController?.controller?.extendedGamepad?.leftThumbstick.yAxis.value {
            
            transform.translate(CGVector(dx: Double(xValue), dy: Double(yValue)))
          }
    }

}
