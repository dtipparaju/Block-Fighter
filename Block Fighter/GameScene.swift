//
//  GameScene.swift
//  Block Fighter
//
//  Created by Dhanush Tipparaju, Chris Markiewicz on 3/16/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var rFighter = SKSpriteNode()
    var lFighter = SKSpriteNode()
    var duck1 = SKSpriteNode()
    var duck2 = SKSpriteNode()
    var jump1 = SKSpriteNode()
    var jump2 = SKSpriteNode()
    var punch1 = SKSpriteNode()
    var punch2 = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        //this stuff happens once (when the app open)
        createBackground()
        createFighters()
    }
    
    func createBackground() {
        let space = SKTexture(imageNamed: "space2")
        for i in 0...1 {
            let spaceBackground = SKSpriteNode(texture: space)
            spaceBackground.zPosition = -1
            spaceBackground.position = CGPoint(x: spaceBackground.size.width * CGFloat(i), y: -20)
            addChild(spaceBackground)
            let moveRight = SKAction.moveBy(x: spaceBackground.size.width, y: 0, duration: 100)
            let moveReset = SKAction.moveBy(x: -spaceBackground.size.width, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveReset, moveRight])
            let moveForever = SKAction.repeatForever(moveLoop)
            spaceBackground.run(moveForever)
        }
    }
    
    func createFighters() {
        rFighter.removeFromParent()
        rFighter = SKSpriteNode(imageNamed: "RFighter.png")
        
        lFighter.removeFromParent()
        lFighter = SKSpriteNode(imageNamed: "LFighter.png")
        
        rFighter.position = CGPoint(x: frame.midX - 196, y: frame.midY - 64)
        lFighter.position = CGPoint(x: frame.midX + 196, y: frame.midY - 64)
        
        addChild(rFighter)
        addChild(lFighter)
    }
    
    func createDuck1() {
        
    }
    
    func createDuck2() {
        
    }
    
    func createPunch1() {
        
    }
    
    func createPunch2() {
        
    }
    
    func createJump1() {
        
    }
    
    func createJump2() {
        
    }
}

