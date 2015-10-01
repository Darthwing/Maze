//
//  GameScene.swift
//  Maze
//
//  Created by Peter Regard on 9/28/15.
//  Copyright (c) 2015 Molecular Industries. All rights reserved.
//

import SpriteKit
var player = SKSpriteNode()

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
       
        player = childNodeWithName("Player") as! SKSpriteNode
    
    
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
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
