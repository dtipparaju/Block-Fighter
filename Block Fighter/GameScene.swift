//
//  GameScene.swift
//  Block Fighter
//
//  Created by Dhanush Tipparaju, Chris Markiewicz on 3/16/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var duck1 = SKSpriteNode()
    var duck2 = SKSpriteNode()
    var jump1 = SKSpriteNode()
    var jump2 = SKSpriteNode()
    var punch1 = SKSpriteNode()
    var punch2 = SKSpriteNode()
    var playingGame = false
    var lookingAtInstructions = false
    
    override func didMove(to view: SKView) {
        //this stuff happens once (when the app open)
        openGame()
        createBackground()
    }
    
    func openGame() {
        makeStartMenu()
        if playingGame == true {
            startGame()
        }
        else if lookingAtInstructions == true {
            
        }
    }
    
    func startGame() {
        createBackground()
    }
    
    func makeStartMenu() {
        let startButton = SKSpriteNode()
        startButton.zPosition = 1
        startButton.name = "startButton"
        startButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY+50)
        self.addChild(startButton)
        
        let startRectangle = SKShapeNode(rectOf: CGSize(width: 275, height: 50), cornerRadius: 10)
        startRectangle.zPosition = 0
        startRectangle.name = "startRectangle"
        startRectangle.position = CGPoint(x: frame.midX, y: frame.midY+50)
        startRectangle.strokeColor = .white
        startRectangle.fillColor = .red
        startButton.addChild(startRectangle)
        
        let startText = SKLabelNode(text: "Start Game")
        startText.color = UIColor.white
        startText.position = CGPoint(x:frame.midX, y:frame.midY+50)
        startText.fontSize =  45
        startText.fontName = "Copperplate"
        startText.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
        startText.name = "startText"
        startText.zPosition =  2
        startButton.addChild(startText)
        
        let instructionButton = SKSpriteNode()
        instructionButton.zPosition = 1
        instructionButton.name = "instructionButton"
        instructionButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-50)
        self.addChild(instructionButton)
        
        let instructionsRectangle = SKShapeNode(rectOf: CGSize(width: 300, height: 50), cornerRadius: 10)
        instructionsRectangle.zPosition = 0
        instructionsRectangle.name = "startRectangle"
        instructionsRectangle.position = CGPoint(x: frame.midX, y: frame.midY-50)
        instructionsRectangle.strokeColor = .white
        instructionsRectangle.fillColor = .red
        instructionButton.addChild(instructionsRectangle)
        
        let instructionText = SKLabelNode(text: "Instructions")
        instructionText.color = UIColor.white
        instructionText.position = CGPoint(x:frame.midX, y:frame.midY-50)
        instructionText.fontSize =  45
        instructionText.fontName = "Copperplate"
        instructionText.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
        instructionText.name = "startText"
        instructionText.zPosition =  2
        instructionButton.addChild(instructionText)
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

