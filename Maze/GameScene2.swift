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
class GameScene2: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        setUpAudio()
        
        self.backgroundColor = NSColor.blackColor()
    }
    
    override func mouseDown(theEvent: NSEvent){
        /* Called when a mouse click occurs */
    }
    
    override func keyDown(theEvent: NSEvent) {
        
    }
    
    override func keyUp(theEvent: NSEvent) {
        
        
    }
    func didBeginContact(contact: SKPhysicsContact) {
        
        
        
    }
    func setUpAudio()
    {
        if bgMusic == nil
        {
            let bgMusicURL = NSBundle.mainBundle().URLForResource("sea2", withExtension: ".caf")
            try! bgMusic = AVAudioPlayer(contentsOfURL: bgMusicURL!, fileTypeHint:nil)
            bgMusic.numberOfLoops = -1
            bgMusic.prepareToPlay()
            bgMusic.play()
        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        
        
        
    }
}
