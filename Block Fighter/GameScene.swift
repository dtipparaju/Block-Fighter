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
    var punchR = SKSpriteNode()
    var punchL = SKSpriteNode()
    var blockR = SKSpriteNode()
    var blockL = SKSpriteNode()
    var rFighterHealth = 100
    var lFighterHealth = 100
    let winnerText = SKLabelNode(text: "")
    var rHealthBar = SKShapeNode()
    var lHealthBar = SKShapeNode()
    var rBlocking =  false
    var lBlocking = false
    var rPunchAction = SKAction()
    var lPunchAction = SKAction()
    var rBlockAction = SKAction()
    var lBlockAction = SKAction()
    
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
                    rFighterHealth = 100
                    lFighterHealth =  100
                }
                if button.name == "rBlock" {
                    rBlocking = true
                }
                if button.name == "lBlock" {
                    lBlocking = true
                }
                if button.name == "rPunch" {
                    if rBlocking == false {
                        rFighter.run(rPunchAction)
                        if lBlocking == false {
                            rFighterHealth -= 5
                        }
                        updateHealthBars()
                        checkWinner()
                    }
                }
                if button.name == "lPunch" {
                    if lBlocking == false {
                        lFighter.run(lPunchAction)
                        if rBlocking == false {
                            lFighterHealth -= 5
                        }
                        updateHealthBars()
                        checkWinner()
                    }
                }
                if button.name == "playAgainButton" {
                    rFighterHealth = 100
                    lFighterHealth = 100
                    startGame()
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        rBlocking = false
        lBlocking = false
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        rBlocking = false
        lBlocking = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        if rBlocking {
            rFighter.run(rBlockAction)
        }
        if lBlocking {
            lFighter.run(lBlockAction)
        }
    }
    
    func checkWinner () { //make sure to run this whenever the sprites punch each other, also try and get the health bar to update whenever the the sprites contact each other
        if rFighterHealth == 0 {
            gameOver(rWinner: false, lWinner: true)
        }
        if lFighterHealth == 0 {
            gameOver(rWinner: true, lWinner: false)
        }
    }
    
    func gameOver(rWinner:Bool, lWinner:Bool) {
        if rWinner == true {
            winnerText.text = "Right Player Wins"
            winnerText.fontSize = 50
            winnerText.fontName = "Copperplate"
            winnerText.position = CGPoint(x: frame.midY, y: frame.midY + 100)
            winnerText.zPosition = 8
            self.addChild(winnerText)
            
        }
        if lWinner  == true {
            winnerText.text = "Left Player Wins"
            winnerText.fontSize = 50
            winnerText.fontName = "Copperplate"
            winnerText.position = CGPoint(x: frame.midY, y: frame.midY + 100)
            winnerText.zPosition = 8
            self.addChild(winnerText)
        }
        
        let homeButton = SKSpriteNode()
        homeButton.zPosition = 6
        homeButton.name = "homeButton"
        homeButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
      self.addChild(homeButton)
        
        let homeRectangle = SKShapeNode(rectOf: CGSize(width: 300, height: 50), cornerRadius: 10)
        homeRectangle.zPosition = 5
        homeRectangle.name = "homeRectangle"
        homeRectangle.position = CGPoint(x: frame.midX, y: frame.midY)
        homeRectangle.strokeColor = .white
        homeRectangle.fillColor = .red
        homeButton.addChild(homeRectangle)
        
        let homeText = SKLabelNode(text: "Return Home")
        homeText.color = UIColor.white
        homeText.position = CGPoint(x:frame.midX, y:frame.midY)
        homeText.fontSize =  45
        homeText.fontName = "Copperplate"
        homeText.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
        homeText.name = "homeText"
        homeText.zPosition =  7
        homeButton.addChild(homeText)
    
        let blackOut = SKShapeNode(rectOf: CGSize(width: 1000, height: 1000))
        blackOut.fillColor = UIColor.black
        blackOut.strokeColor = UIColor.black
        blackOut.zPosition = -1
        homeButton.addChild(blackOut)
        
        
        let playAgainButton = SKSpriteNode()
        playAgainButton.zPosition = 6
        playAgainButton.name = "playAgainButton"
        playAgainButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 50)
      self.addChild(playAgainButton)
        
        let playAgainRectangle = SKShapeNode(rectOf: CGSize(width: 300, height: 50), cornerRadius: 10)
        playAgainRectangle.zPosition = 5
        playAgainRectangle.name = "playAgainRectangle"
        playAgainRectangle.position = CGPoint(x: frame.midX, y: frame.midY-50)
        playAgainRectangle.strokeColor = .white
        playAgainRectangle.fillColor = .red
        playAgainButton.addChild(playAgainRectangle)
        
        let playAgainText = SKLabelNode(text: "Play Again")
        playAgainText.color = UIColor.white
        playAgainText.position = CGPoint(x:frame.midX, y:frame.midY-50)
        playAgainText.fontSize =  45
        playAgainText.fontName = "Copperplate"
        playAgainText.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
        playAgainText.name = "playAgainText"
        playAgainText.zPosition =  7
        playAgainButton.addChild(playAgainText)
    }
    
    func startGame() {
        removeAllChildren()
        createBackground()
        createPauseButton()
        createFighters()
        updateHealthBars()
        createButtons()
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
            
            let instructionJump = SKLabelNode(text: "Hold the BLOCK button to block. ")
            instructionJump.color = UIColor.white
            instructionJump.position = CGPoint(x:frame.midX, y:frame.midY + 50)
            instructionJump.fontSize =  20
            instructionJump.fontName = "Copperplate"
            instructionJump.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
            instructionJump.zPosition =  2
            instructionsDisplay.addChild(instructionJump)
            
            let instructionPunch = SKLabelNode(text: "Press the PUNCH Button to punch")
            instructionPunch.color = UIColor.white
            instructionPunch.position = CGPoint(x:frame.midX, y:frame.midY + 25)
            instructionPunch.fontSize =  20
            instructionPunch.fontName = "Copperplate"
            instructionPunch.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
            instructionPunch.zPosition =  2
            instructionsDisplay.addChild(instructionPunch)
            
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
    
    func updateHealthBars() {
        rHealthBar.removeFromParent()
        lHealthBar.removeFromParent()
        
        rHealthBar = SKShapeNode(rectOf: CGSize(width: 2 * rFighterHealth, height: 15), cornerRadius: 2)
        rHealthBar.zPosition = 4
        rHealthBar.position = CGPoint(x: frame.midX + 200, y:frame.midY + 150)
        rHealthBar.fillColor = .green
        rHealthBar.strokeColor = .green
        self.addChild(rHealthBar)
        
        lHealthBar =  SKShapeNode(rectOf: CGSize(width: 2 * lFighterHealth, height: 15), cornerRadius: 2)
        lHealthBar.zPosition = 4
        lHealthBar.position = CGPoint(x: frame.midX - 200, y:frame.midY + 150)
        lHealthBar.fillColor = .green
        lHealthBar.strokeColor = .green
        self.addChild(lHealthBar)
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
    
    func createButtons()
    {
        createBlockR()
        createBlockL()
        createPunchR()
        createPunchL()
    }
    
    // This function creates and animates two fighter characters (left and right).
    func createFighters() {
        // Remove the right fighter from the parent node and create a new right fighter sprite.
        rFighter.removeFromParent()
        rFighter = SKSpriteNode(imageNamed: "RFighter_0.png")
        rFighter.position = CGPoint(x: frame.midX - 100, y: frame.midY - 64)

        // Load textures for the right fighter's animation.
        var rFighterTextures: [SKTexture] = []
        for i in 1...2 {
            let texture = SKTexture(imageNamed: "RFighter_\(i-1)")
            rFighterTextures.append(texture)
        }
        // Create the right fighter's animation action.
        let rFighterAnimationAction = SKAction.animate(with: rFighterTextures, timePerFrame: 0.2)

        // Remove the left fighter from the parent node and create a new left fighter sprite.
        lFighter.removeFromParent()
        lFighter = SKSpriteNode(imageNamed: "LFighter_0.png")
        lFighter.position = CGPoint(x: frame.midX + 100, y: frame.midY - 64)

        // Load textures for the left fighter's animation.
        var lFighterTextures: [SKTexture] = []
        for i in 1...2 {
            let texture = SKTexture(imageNamed: "LFighter_\(i-1)")
            lFighterTextures.append(texture)
        }
        // Create the left fighter's animation action.
        let lFighterAnimationAction = SKAction.animate(with: lFighterTextures, timePerFrame: 0.2)

        // Run the animations for both fighters in a loop.
        rFighter.run(SKAction.repeatForever(rFighterAnimationAction))
        lFighter.run(SKAction.repeatForever(lFighterAnimationAction))

        // Add the fighters to the scene.
        addChild(lFighter)
        addChild(rFighter)
    }

    // This function creates the right punch button and its animation.
    func createPunchR() {
        // Remove the punchR button from the parent node and create a new punchR button sprite.
        punchR.removeFromParent()
        punchR = SKSpriteNode(imageNamed: "punch_0")
        punchR.xScale = 0.5
        punchR.yScale = 0.5
        punchR.position = CGPoint(x: frame.midX - 275, y: frame.midY + 32)
        punchR.name = "rPunch"
        addChild(punchR)

        // Load textures for the right punch button's animation.
        var rPunchTextures: [SKTexture] = []
        for i in 1...2 {
            let texture = SKTexture(imageNamed: "RFighterPunch_\(i-1)")
            rPunchTextures.append(texture)
        }

        // Create the right punch button's animation action and wait action.
        let rPunchAnimationAction = SKAction.animate(with: rPunchTextures, timePerFrame: 0.2)
        let rPunchWaitAction = SKAction.wait(forDuration: 1)
        rPunchAction = SKAction.sequence([rPunchAnimationAction, rPunchWaitAction])
    }

    // This function creates the left punch button and its animation.
    func createPunchL() {
        // Remove the punchL button from the parent node and create a new punchL button sprite.
        punchL.removeFromParent()
        punchL = SKSpriteNode(imageNamed: "punch_0")
        punchL.xScale = 0.5
        punchL.yScale = 0.5
        punchL.position = CGPoint(x: frame.midX + 275, y: frame.midY + 32)
        punchL.name =  "lPunch"
        addChild(punchL)

        // Load textures for the left punch button's animation.
        var lPunchTextures: [SKTexture] = []
        for i in 1...2 {
            let texture = SKTexture(imageNamed: "LFighterPunch_\(i-1)")
            lPunchTextures.append(texture)
        }

        // Create the left punch button's animation action and wait action.
        let lPunchAnimationAction = SKAction.animate(with: lPunchTextures, timePerFrame: 0.2)
        let lPunchWaitAction = SKAction.wait(forDuration: 1)
        lPunchAction = SKAction.sequence([lPunchAnimationAction, lPunchWaitAction])
    }

    // This function creates the right block button and its animation.
    func createBlockR() {
        // Remove the blockR button from the parent node and create a new blockR button sprite.
        blockR.removeFromParent()
        blockR = SKSpriteNode(imageNamed: "BlockButton_0")
        blockR.xScale = 0.5
        blockR.yScale = 0.5
        blockR.position = CGPoint(x: frame.midX - 330, y: frame.midY - 125)
        blockR.name =  "rBlock"
        addChild(blockR)

        // Load textures for the right block button's animation.
        var rBlockTextures: [SKTexture] = []
        for i in 1...2 {
            let texture = SKTexture(imageNamed: "RBubble_\(i-1)")
            rBlockTextures.append(texture)
        }

        // Create the right block button's animation action.
        rBlockAction = SKAction.animate(with: rBlockTextures, timePerFrame: 0.2)
    }

    // This function creates the left block button and its animation.
    func createBlockL() {
        // Remove the blockL button from the parent node, if it exists.
        blockL.removeFromParent()

        // Create a new blockL button sprite with the initial image.
        blockL = SKSpriteNode(imageNamed: "BlockButton_0")
        
        // Set the scale of the blockL button sprite.
        blockL.xScale = 0.5
        blockL.yScale = 0.5

        // Set the position of the blockL button sprite.
        blockL.position = CGPoint(x: frame.midX + 330, y: frame.midY - 125)

        // Assign a name to the blockL button sprite for easier identification.
        blockL.name =  "lBlock"
        
        // Add the blockL button sprite as a child of the current node.
        addChild(blockL)

        // Initialize an array to store the textures for the left block button's animation.
        var lBlockTextures: [SKTexture] = []

        // Load the textures for the left block button's animation.
        for i in 1...2 {
            let texture = SKTexture(imageNamed: "LBubble_\(i-1)")
            lBlockTextures.append(texture)
        }

        // Create the left block button's animation action.
        lBlockAction = SKAction.animate(with: lBlockTextures, timePerFrame: 0.2)
    }
}
