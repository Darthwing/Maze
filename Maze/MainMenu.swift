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
var musicButton = SKSpriteNode()
var title = SKLabelNode(fontNamed: "Oswald-Regular.ttf")
var musicButtonDefault = SKTexture(imageNamed: "No Music.png")
var musicButtonOff = SKTexture(imageNamed: "No Music active1")
var title2 = SKLabelNode(fontNamed: "Oswald-Regular.ttf")
var MusicOn = true
var MusicOff = false
let defaults = NSUserDefaults.standardUserDefaults()


class MainMenu: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView)
    {/* Setup your scene here */
        if defaults.integerForKey("FirstTime") == 0
        {
            defaults.setInteger(1, forKey: "FirstTime")
            
            defaults.setBool(true, forKey: "musicY")
        }
        if defaults.boolForKey("musicY") == true
        {
            setUpAudio()
            musicButton.texture = musicButtonDefault
        }
        self.backgroundColor = NSColor.whiteColor()
        
        playButton = childNodeWithName("playButton") as! SKSpriteNode
        playButton.name = "play"
        playButton.userInteractionEnabled = false
        
        musicButton = childNodeWithName("musicButton") as! SKSpriteNode
        musicButton.name = "noMusic"
        musicButton.userInteractionEnabled = false
        
        levelButton = childNodeWithName("levelButton") as! SKSpriteNode
        levelButton.name = "play"
        levelButton.userInteractionEnabled = false
        
        title = (childNodeWithName("title1") as? SKLabelNode)!
        title.fontName = "Oswald-Regular.ttf"
        title2 = (childNodeWithName("title") as? SKLabelNode)!
        title2.fontName = "Oswald-Regular.ttf"
        
        
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
        if click.name == "noMusic" && musicButton.texture == musicButtonDefault
        {
            defaults.setBool(false, forKey: "musicY")
            bgMusic.stop()
            musicButton.texture = musicButtonOff
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
