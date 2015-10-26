//
//  GameScene.swift
//  Maze
//
//  Created by Peter Regard on 9/28/15.
//  Copyright (c) 2015 Molecular Industries. All rights reserved.
//

import SpriteKit
import AVFoundation
private var bgMusic: AVAudioPlayer!
var player = SKSpriteNode()
var maze = SKSpriteNode()
let wall = SKSpriteNode()

var error: NSError?

//init (calibrated)

//var playMusic = SKAction.playSoundFileNamed("Helena2.caf", waitForCompletion: false)

var zombie = SKSpriteNode(imageNamed: "zombie2")

var tint = SKSpriteNode()

var playPosition = CGPointMake(player.position.x, player.position.y)

var diviser = 0

var isPaused = false

var done = false

var uncalculatedScore = Int(min.text!+second.text!+tenth.text!)

var mazeTexture = SKTexture(imageNamed: "Moderate Maze")

var timer = NSTimer()


var tenthTime = 0
var secondTime = 0
var minTime = 0


var tenth = SKLabelNode()
var second = SKLabelNode()
var min = SKLabelNode()
var pauseMenu = SKLabelNode()
var instruct = SKLabelNode()

var spriteAni = SKAction.rotateByAngle(2, duration: 0.25)
var movingSprite = SKAction.repeatActionForever(spriteAni)

class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        setUpAudio()
        
        tint = SKSpriteNode(color: NSColor.blackColor(), size: CGSizeMake(self.frame.width, self.frame.height))
        tint.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.backgroundColor = NSColor(white: 1, alpha: 0)
        
        //        MARK: wall
        wall.size = CGSizeMake(1, 1000)
        wall.position = CGPointMake(CGRectGetMaxX(self.frame), CGRectGetMidY(self.frame))
        wall.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(1, 1000))
        wall.physicsBody?.dynamic = false
        wall.physicsBody?.restitution = 0
        wall.physicsBody?.friction = 0
        wall.physicsBody?.collisionBitMask = 5
        wall.physicsBody?.categoryBitMask = 5
        wall.physicsBody?.contactTestBitMask = 5
        self.addChild(wall)
        //        MARK: player
        player = childNodeWithName("Player") as! SKSpriteNode
        player.zPosition = 2
        player.runAction(movingSprite)
        
        player.physicsBody?.contactTestBitMask = 3
        player.physicsBody?.collisionBitMask = 3
        player.physicsBody?.categoryBitMask = 3
        player.physicsBody?.restitution = 0
        
        //        MARK: Maze
        maze = childNodeWithName("Maze") as! SKSpriteNode
        maze.physicsBody = SKPhysicsBody(texture: mazeTexture, alphaThreshold: 0.1, size: CGSizeMake(1025.931, 766.152))
        maze.physicsBody?.dynamic = false
        maze.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        maze.physicsBody?.contactTestBitMask = 3
        maze.physicsBody?.collisionBitMask = 1
        maze.physicsBody?.categoryBitMask = 1
        maze.physicsBody?.restitution = 0
        maze.zPosition = 2
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "result", userInfo: nil, repeats: true)
        
        tenth = childNodeWithName("tenth") as! SKLabelNode
        tenth.zPosition = 5
        second = childNodeWithName("second") as! SKLabelNode
        second.zPosition = 5
        min = childNodeWithName("min") as! SKLabelNode
        min.zPosition = 5
        
    }
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
    }
    func result()
    {
        tenth.text = "\(tenthTime)"
        second.text = "\(secondTime)"
        min.text = "\(minTime)"
        
        
        tenthTime++
        
        if tenthTime == 100{
            secondTime++
            diviser++
            tenthTime = 0
        }
        if secondTime == 60 {
            minTime++
            diviser=diviser+1
            secondTime = 0
            
        }
        
        
    }
    override func keyDown(theEvent: NSEvent) {
        if theEvent.keyCode == 2
        {
            player.physicsBody?.velocity = CGVectorMake(250, 0)
        }
        if theEvent.keyCode == 0
        {
            player.physicsBody?.velocity = CGVectorMake(-250, 0)
        }
        
        if theEvent.keyCode == 13
        {
            player.physicsBody?.velocity = CGVectorMake(0, 250)
        }
        if theEvent.keyCode == 1
        {
            player.physicsBody?.velocity = CGVectorMake(0, -250)
        }
        if theEvent.keyCode == 36
        {
            playPosition = CGPointMake(player.position.x, player.position.y)
        }
        
    }
    
    override func keyUp(theEvent: NSEvent) {
        
        if theEvent.keyCode == 2
        {
            if player.physicsBody?.velocity.dx > 0
            {
                player.physicsBody?.velocity = CGVectorMake(0, 0)
            }
        }
        if theEvent.keyCode == 0 {
            if player.physicsBody?.velocity.dx < 0
            {
                player.physicsBody?.velocity = CGVectorMake(0, 0)
            }
        }
        
        if theEvent.keyCode == 13
        {
            if player.physicsBody?.velocity.dy > 0
            {
                player.physicsBody?.velocity = CGVectorMake(0, 0)
            }
        }
        if theEvent.keyCode == 1
        {
            if player.physicsBody?.velocity.dy < 0
            {
                player.physicsBody?.velocity = CGVectorMake(0, 0)
            }
        }
        if theEvent.keyCode == 36
        {
            if isPaused == true
            {
                play()
            }
            else
            {
                if done == false
                {
                    pauseing()
                }
            }
        }
        
    }
    func didBeginContact(contact: SKPhysicsContact) {
        
        if (contact.bodyA.categoryBitMask == 3) && (contact.bodyB.categoryBitMask == 1)
        {
            print("hey, there is contact between player and wall")
        }
        
        if (contact.bodyA.categoryBitMask == 3) && (contact.bodyB.categoryBitMask == 5)
        {
            print("hey, there is contact between player and finish")
            player.physicsBody?.dynamic = false
            timer.invalidate()
            Score()
            //            zombie.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
            //            zombie.size = CGSizeMake(self.frame.width, self.frame.height)
            //            zombie.zPosition = 15
            //            self.addChild(zombie)
        }
        
        
    }
    
    func Score()
    {
        let score = min.text!+":"+second.text!+":"+tenth.text!
        print(score)
        print(600 / diviser)
        done = true
    }
    
    func play()
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "result", userInfo: nil, repeats: true)
        player.position = playPosition
        player.runAction(movingSprite)
        player.physicsBody?.dynamic = true
        isPaused = false
        tint.removeFromParent()
        pauseMenu.removeFromParent()
        instruct.removeFromParent()
    }
    
    func pauseing()
    {
        timer.invalidate()
        playPosition = CGPoint(x: player.position.x, y: player.position.y)
        print(playPosition)
        player.removeAllActions()
        player.physicsBody?.dynamic = false
        isPaused = true
        self.addChild(tint)
        tint.alpha = 0.5
        tint.zPosition = 10
        pauseMenu.text = "Paused"
        pauseMenu.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame)*1.5)
        pauseMenu.fontColor = NSColor.cyanColor()
        pauseMenu.fontName = "Marker Felt Wide"
        pauseMenu.zPosition = 11
        pauseMenu.fontSize = 51
        self.addChild(pauseMenu)
        instruct.text = "Press Enter to continue"
        instruct.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        instruct.fontColor = NSColor.cyanColor()
        instruct.fontName = "Marker Felt Wide"
        instruct.zPosition = 11
        instruct.fontSize = 51
        self.addChild(instruct)
        self.removeAllActions()
    }
    
    func setUpAudio()
    {
        if bgMusic == nil
        {
            let bgMusicURL = NSBundle.mainBundle().URLForResource("sea2", withExtension: ".caf")
            try! bgMusic = AVAudioPlayer(contentsOfURL: bgMusicURL!, fileTypeHint:nil)
            bgMusic.numberOfLoops = 1
            bgMusic.prepareToPlay()
            bgMusic.play()
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
        
        
    }
}
