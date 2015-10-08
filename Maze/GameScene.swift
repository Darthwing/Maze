//
//  GameScene.swift
//  Maze
//
//  Created by Peter Regard on 9/28/15.
//  Copyright (c) 2015 Molecular Industries. All rights reserved.
//

import SpriteKit
var player = SKSpriteNode()
var player2 = SKSpriteNode()
var maze = SKSpriteNode()
var mazeTexture = SKTexture(imageNamed: "Simple Maze")
class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        /* Setup your scene here */
        
//        player2 = childNodeWithName("Player2") as! SKSpriteNode
//        player2.zPosition = 2
//        player2.physicsBody?.contactTestBitMask = 3
//        

        player = childNodeWithName("Player") as! SKSpriteNode
        player.zPosition = 2
        player.physicsBody?.contactTestBitMask = 3
        player.physicsBody?.collisionBitMask = 3
        player.physicsBody?.categoryBitMask = 3

        
        maze = childNodeWithName("Maze") as! SKSpriteNode
        maze.physicsBody?.dynamic = false
        maze.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        maze.physicsBody?.contactTestBitMask = 3
        maze.physicsBody?.collisionBitMask = 1
        maze.physicsBody?.categoryBitMask = 1
//        maze.physicsBody = SKPhysicsBody(texture: mazeTexture, alphaThreshold: 0.01, size: CGSizeMake(1025.285, 764.958))
        
        
        
        maze.zPosition = 2
    }
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
        
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
    
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
        
    }
}
