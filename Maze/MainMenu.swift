//
//  MainMenu.swift
//  Maze
//
//  Created by Peter Regard on 11/4/15.
//  Copyright © 2015 Molecular Industries. All rights reserved.
//


import SpriteKit
import AVFoundation


 var bgMusic: AVAudioPlayer!

var playButton = SKSpriteNode()
var levelButton = SKSpriteNode()
var title = SKLabelNode(fontNamed: "Oswald-Regular.ttf")


class MainMenu: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView)
    {/* Setup your scene here */
        
        setUpAudio()
        self.backgroundColor = NSColor.whiteColor()
        
        playButton = childNodeWithName("playButton") as! SKSpriteNode
        playButton.name = "play"
        playButton.userInteractionEnabled = false
        
        levelButton = childNodeWithName("levelButton") as! SKSpriteNode
        levelButton.name = "play"
        levelButton.userInteractionEnabled = false
        
        title = (childNodeWithName("title1") as? SKLabelNode)!
        title.fontName = "Oswald-Regular.ttf"
        }
    
    override func mouseDown(theEvent: NSEvent){
        /* Called when a mouse click occurs */
        let location = theEvent.locationInNode(self)
        let click = self.nodeAtPoint(location)
        if click.name == "play"
        {
         if let level1 = GameScene(fileNamed: "GameScene")
         {
            level1.scaleMode = SKSceneScaleMode.AspectFit
            self.view?.presentScene(level1, transition: transition)
            }
        }
        
        
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
            let bgMusicURL = NSBundle.mainBundle().URLForResource("backMusic", withExtension: ".caf")
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
