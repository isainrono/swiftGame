//
//  GameScene.swift
//  isainGame
//
//  Created by isain on 18/03/2019.
//  Copyright © 2019 326Spain. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    //private var spinnyNode : SKShapeNode?
    private var mosca : SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        physicsWorld.gravity = CGVector(dx: 0, dy:-1)
        
        // asi se añade un label al node
        label = SKLabelNode()
        label?.text = "Hello Isain"
        label?.position = CGPoint(x: 0, y: 0)
        self.addChild(label!)
        
        let texturaMosquita = SKTexture(imageNamed: "Logo")
        let textura2 = SKTexture(imageNamed: "Spring")
        mosca = SKSpriteNode(texture: texturaMosquita)
        
        
        let animation = SKAction.animate(with: [texturaMosquita, textura2], timePerFrame: 0.1)
        mosca?.position = CGPoint(x: 0, y:0)
        
        let cambio = SKAction.repeatForever(animation)
        
        
        
        mosca?.physicsBody = SKPhysicsBody(circleOfRadius: texturaMosquita.size().height / 2)
        
        
        mosca?.run(cambio)
        mosca?.position = CGPoint(x: 0, y: 0)
        self.addChild(mosca!)
        
        // Get label node from scene and store it for use later
        /*self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }*/
        
        // Create shape node to use during mouse interaction
        /*let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }*/
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let toque = t.location(in: self)
            let nodosDondeTocas = self.nodes(at: toque)
            if(nodosDondeTocas.count > 0) {
                let nodoActual = nodosDondeTocas[0]
                if(nodoActual.name == "azul") {
                    let mover = SKAction.moveTo(x: self.frame.minX, duration: 0.5)
                    mosca?.run(mover)
                } else {
                    let mover = SKAction.moveTo(y: self.frame.maxX, duration: 0.5)
                    mosca?.run(mover)
                }
                
                if(nodoActual.name == "amarillo") {
                    // cambiar gravedad
                }
            }
        }
    }
    

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        // se ejecuta cada vez que va a pintar un nuevo frame
    }
}
