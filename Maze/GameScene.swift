//
//  GameScene.swift
//  Maze
//
//  Created by Peter Regard on 9/28/15.
//  Copyright (c) 2015 Molecular Industries. All rights reserved.
//

import SpriteKit
var player = SKSpriteNode()
var maze = SKSpriteNode()
let wall = SKSpriteNode()

var uncalculatedScore = Int(min.text!+second.text!+tenth.text!)

var mazeTexture = SKTexture(imageNamed: "Moderate Maze")

var timer = NSTimer()

var tenthTime = 0
var secondTime = 0
var minTime = 0


var tenth = SKLabelNode()
var second = SKLabelNode()
var min = SKLabelNode()

class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.backgroundColor = NSColor(white: 1, alpha: 0)
        /* Setup your scene here */
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
//        second.position = CGPointMake(tenth.position.x-30, tenth.position.y)
        min = childNodeWithName("min") as! SKLabelNode
        min.zPosition = 5
//        min.position = CGPointMake(second.position.x-35, tenth.position.y)

        
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
                tenthTime = 0
            }
            if secondTime == 60 {
                minTime++
                secondTime = 0
                
            }

    
        }
    override func keyDown(theEvent: NSEvent) {
        if theEvent.keyCode == 2 {
            player.physicsBody?.velocity = CGVectorMake(250, 0)
        }
        if theEvent.keyCode == 0 {
            player.physicsBody?.velocity = CGVectorMake(-250, 0)
        }
        
        if theEvent.keyCode == 13 {
            player.physicsBody?.velocity = CGVectorMake(0, 250)
        }
        if theEvent.keyCode == 1 {
            player.physicsBody?.velocity = CGVectorMake(0, -250)
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
            
        }

        
        
    
    }
    
    func Score()
    {
        let score = min.text!+":"+second.text!+":"+tenth.text!
        print(score)
        print(uncalculatedScore! / 13)
        print("3")
//        print()
//        var uncalculatedScoreSec = Int(second.text!)
//        var uncalculatedScoreHun = Int(tenth.text!)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
//        second.position.x = tenth.position.x-(tenth.frame.width)
        
    }
}
