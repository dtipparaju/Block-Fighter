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
        makeStartMenu()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            for button in nodes (at: location) {
                if button.name == "startLabel" {
                    startGame()
                }
                if button.name == "instructionLabel" {
                    viewInstructions()
                }
                if button.name == "backButton" {
                    removeAllChildren()
                    makeStartMenu()
                }
                if button.name == "pauseButton" {
                    pauseMenu()
                }
                if button.name == "continueButton" {
                    startGame()
                }
                if button.name == "homeText" {
                    removeAllChildren()
                    makeStartMenu()
                }
            }
        }
    }
    
    func startGame() {
            removeAllChildren()
            createBackground()
            createFighters()
            createPauseButton()
    }
    
    func viewInstructions() {
            removeAllChildren()
            let instructionsDisplay = SKSpriteNode()
            instructionsDisplay.zPosition = 1
            instructionsDisplay.name = "instructionsDisplay"
            instructionsDisplay.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            self.addChild(instructionsDisplay)
            
            let instructionsRectangle = SKShapeNode(rectOf: CGSize(width: 500, height: 150), cornerRadius: 10)
            instructionsRectangle.zPosition = 0
            instructionsRectangle.position = CGPoint(x: frame.midX, y: frame.midY)
            instructionsRectangle.strokeColor = .white
            instructionsRectangle.fillColor = .red
            instructionsDisplay.addChild(instructionsRectangle)
            
            let instructionJump = SKLabelNode(text: "Press the JUMP button to jump. ")
            instructionJump.color = UIColor.white
            instructionJump.position = CGPoint(x:frame.midX, y:frame.midY+50)
            instructionJump.fontSize =  20
            instructionJump.fontName = "Copperplate"
            instructionJump.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
            instructionJump.zPosition =  2
            instructionsDisplay.addChild(instructionJump)
            
            let instructionPunch = SKLabelNode(text: "Press the PUNCH Button to punch")
            instructionPunch.color = UIColor.white
            instructionPunch.position = CGPoint(x:frame.midX, y:frame.midY+25)
            instructionPunch.fontSize =  20
            instructionPunch.fontName = "Copperplate"
            instructionPunch.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
            instructionPunch.zPosition =  2
            instructionsDisplay.addChild(instructionPunch)
            
            let instructionDuck = SKLabelNode(text: "Press the DUCK button to duck")
            instructionDuck.color = UIColor.white
            instructionDuck.position = CGPoint(x:frame.midX, y:frame.midY)
            instructionDuck.fontSize =  20
            instructionDuck.fontName = "Copperplate"
            instructionDuck.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
            instructionDuck.zPosition =  2
            instructionsDisplay.addChild(instructionDuck)
            
            let instructionHit = SKLabelNode(text: "Hit the other player to deal damage")
            instructionHit.color = UIColor.white
            instructionHit.position = CGPoint(x:frame.midX, y:frame.midY-25)
            instructionHit.fontSize =  20
            instructionHit.fontName = "Copperplate"
            instructionHit.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
            instructionHit.zPosition =  2
            instructionsDisplay.addChild(instructionHit)
            
            let instructionWin = SKLabelNode(text: "First to lose their health losses")
            instructionWin.color = UIColor.white
            instructionWin.position = CGPoint(x:frame.midX, y:frame.midY-50)
            instructionWin.fontSize =  20
            instructionWin.fontName = "Copperplate"
            instructionWin.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
            instructionWin.zPosition =  2
            instructionsDisplay.addChild(instructionWin)
            
            let backArrow = SKTexture(imageNamed: "backArrow")
            let backButton = SKSpriteNode(texture: backArrow)
            backButton.name = "backButton"
            backButton.position = CGPoint(x: self.frame.midX-350, y: self.frame.midY+150)
            backButton.zPosition = 3
            backButton.xScale = CGFloat(0.05)
            backButton.yScale = CGFloat(0.05)
            self.addChild(backButton)
    }
    
    func pauseMenu() {
        let pauseScreen =  SKShapeNode(rectOf: CGSize(width: 1000, height: 1000))
        pauseScreen.zPosition = 4
        pauseScreen.position = CGPoint(x: frame.midX, y: frame.midY)
        pauseScreen.fillColor = .black
        pauseScreen.strokeColor = .black
        pauseScreen.name = "pauseScreen"
     self.addChild(pauseScreen)
        
        let continueButton = SKSpriteNode()
        continueButton.zPosition = 6
        continueButton.name = "continueButton"
        continueButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY+50)
  self.addChild(continueButton)
        
        
        let continueRectangle = SKShapeNode(rectOf: CGSize(width: 275, height: 50), cornerRadius: 10)
        continueRectangle.zPosition = 5
        continueRectangle.name = "continueRectangle"
        continueRectangle.position = CGPoint(x: frame.midX, y: frame.midY+50)
        continueRectangle.strokeColor = .white
        continueRectangle.fillColor = .red
        continueButton.addChild(continueRectangle)
        
        let continueText = SKLabelNode(text: "Continue")
        continueText.color = UIColor.white
        continueText.position = CGPoint(x:frame.midX, y:frame.midY+50)
        continueText.fontSize =  45
        continueText.fontName = "Copperplate"
        continueText.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
        continueText.name = "continueText"
        continueText.zPosition =  7
        continueButton.addChild(continueText)
        
        let homeButton = SKSpriteNode()
        homeButton.zPosition = 6
        homeButton.name = "homeButton"
        homeButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-50)
      self.addChild(homeButton)
  
        
        let homeRectangle = SKShapeNode(rectOf: CGSize(width: 300, height: 50), cornerRadius: 10)
        homeRectangle.zPosition = 5
        homeRectangle.name = "homeRectangle"
        homeRectangle.position = CGPoint(x: frame.midX, y: frame.midY-50)
        homeRectangle.strokeColor = .white
        homeRectangle.fillColor = .red
        homeButton.addChild(homeRectangle)
        
        let homeText = SKLabelNode(text: "Return Home")
        homeText.color = UIColor.white
        homeText.position = CGPoint(x:frame.midX, y:frame.midY-50)
        homeText.fontSize =  45
        homeText.fontName = "Copperplate"
        homeText.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
        homeText.name = "homeText"
        homeText.zPosition =  7
        homeButton.addChild(homeText)
        
    }
    
    func createPauseButton() {
        let pause = SKTexture(imageNamed: "pauseButton1")
        let pauseButton = SKSpriteNode(texture: pause)
        pauseButton.name = "pauseButton"
        pauseButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY+150)
        pauseButton.zPosition = 3
        pauseButton.xScale = CGFloat(0.05)
        pauseButton.yScale = CGFloat(0.05)
        self.addChild(pauseButton)
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
        startText.name = "startLabel"
        startText.zPosition =  2
        startButton.addChild(startText)
        
        let instructionButton = SKSpriteNode()
        instructionButton.zPosition = 1
        instructionButton.name = "instructionButton"
        instructionButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-50)
        self.addChild(instructionButton)
        
        let instructionsRectangle = SKShapeNode(rectOf: CGSize(width: 300, height: 50), cornerRadius: 10)
        instructionsRectangle.zPosition = 0
        instructionsRectangle.name = "instructionRectangle"
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
        instructionText.name = "instructionLabel"
        instructionText.zPosition =  2
        instructionButton.addChild(instructionText)
        
        createBackground()
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
        rFighter = SKSpriteNode(imageNamed: "RFighter_0.png")
        
        lFighter.removeFromParent()
        lFighter = SKSpriteNode(imageNamed: "LFighter_0.png")
        
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
