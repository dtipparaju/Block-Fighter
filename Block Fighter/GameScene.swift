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
        createButtons()
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
    
    func createButtons()
    {
        createDuck1()
        createDuck2()
        createJump1()
        createJump2()
        createPunch1()
        createPunch2()
    }
    
    func createFighters() {
        rFighter.removeFromParent()
        rFighter = SKSpriteNode(imageNamed: "RFighter_0.png")
        rFighter.position = CGPoint(x: frame.midX - 100, y: frame.midY - 64)
        var rFighterTextures: [SKTexture] = []
        for i in 1...2 {
            let texture = SKTexture(imageNamed: "RFighter_\(i-1)")
            rFighterTextures.append(texture)
        }
        let rFighterAnimationAction = SKAction.animate(with: rFighterTextures, timePerFrame: 0.2)
        
        lFighter.removeFromParent()
        lFighter = SKSpriteNode(imageNamed: "LFighter_0.png")
        lFighter.position = CGPoint(x: frame.midX + 100, y: frame.midY - 64)
        var lFighterTextures: [SKTexture] = []
        for i in 1...2 {
            let texture = SKTexture(imageNamed: "LFighter_\(i-1)")
            lFighterTextures.append(texture)
        }
        let lFighterAnimationAction = SKAction.animate(with: lFighterTextures, timePerFrame: 0.2)
            
        addChild(rFighter)
        rFighter.run(SKAction.repeatForever(rFighterAnimationAction))
        
        addChild(lFighter)
        lFighter.run(SKAction.repeatForever(lFighterAnimationAction))

    }
    
    func createDuck1() {
        duck1.removeFromParent()
        duck1 = SKSpriteNode(imageNamed: "DuckButton_0")
        duck1.xScale = 0.5
        duck1.yScale = 0.5
        duck1.position = CGPoint(x: frame.midX - 262, y: frame.midY + 64)
        addChild(duck1)
    }
    
    func createDuck2() {
        duck2.removeFromParent()
        duck2 = SKSpriteNode(imageNamed: "DuckButton_0")
        duck2.xScale = 0.5
        duck2.yScale = 0.5
        duck2.position = CGPoint(x: frame.midX + 262, y: frame.midY + 64)
        addChild(duck2)
    }
    
    func createPunch1() {
        punch1.removeFromParent()
        punch1 = SKSpriteNode(imageNamed: "punch_0")
        punch1.xScale = 0.5
        punch1.yScale = 0.5
        punch1.position = CGPoint(x: frame.midX - 262, y: frame.midY - 64)
        addChild(punch1)
    }
    
    func createPunch2() {
        punch2.removeFromParent()
        punch2 = SKSpriteNode(imageNamed: "punch_0")
        punch2.xScale = 0.5
        punch2.yScale = 0.5
        punch2.position = CGPoint(x: frame.midX + 262, y: frame.midY - 64)
        addChild(punch2)
    }
    
    func createJump1() {
        jump1.removeFromParent()
        jump1 = SKSpriteNode(imageNamed: "JumpButton_0")
        jump1.xScale = 0.5
        jump1.yScale = 0.5
        jump1.position = CGPoint(x: frame.midX - 262, y: frame.midY )
        addChild(jump1)
    }
    
    func createJump2() {
        jump2.removeFromParent()
        jump2 = SKSpriteNode(imageNamed: "JumpButton_0")
        jump2.xScale = 0.5
        jump2.yScale = 0.5
        jump2.position = CGPoint(x: frame.midX + 262, y: frame.midY)
        addChild(jump2)
    }
}

