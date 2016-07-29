//
//  MenuScene.swift
//  space-shooter
//
//  Created by Abdul Abdulghafar on 2016-06-13.
//  Copyright © 2016 Abdulrahman Abdulghafar. All rights reserved.
//

import Foundation
import SpriteKit

public var playButton = SKSpriteNode()
public let playButtonTexture = SKTexture(imageNamed: "play")
public var creditsButton = SKSpriteNode()
public let creditsButtonTexture = SKTexture(imageNamed: "credits")
public var exitButton = SKSpriteNode()
public let exitButtonTexture = SKTexture(imageNamed: "exit")
public let highScoreLabel = SKLabelNode(fontNamed: "TimeBurner")


class MenuScene: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        highscore = userDefaults.valueForKey("highscore") != nil ? userDefaults.valueForKey("highscore") as? Int : 0
        orbCount = userDefaults.valueForKey("orbs") != nil ? userDefaults.valueForKey("orbs") as? Int : 0
        spawnBackgroundStars()
        playButton = SKSpriteNode(texture: playButtonTexture)
        playButton.position = CGPointMake(self.frame.midX, self.frame.midY)
        self.addChild(playButton)
        
        creditsButton = SKSpriteNode(texture: creditsButtonTexture)
        creditsButton.position = CGPointMake(self.frame.midX, playButton.position.y - 100)
        self.addChild(creditsButton)
        
        exitButton = SKSpriteNode(texture: exitButtonTexture)
        exitButton.position = CGPointMake(self.frame.midX, creditsButton.position.y - 100)
        self.addChild(exitButton)
        
        highScoreLabel.text = "HIGH SCORE: \(highscore!)"
        highScoreLabel.fontColor = UIColor.redColor()
        highScoreLabel.position = CGPointMake(self.frame.midX, playButton.position.y + 140)
        self.addChild(highScoreLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in (touches ) {
            let pos = touch.locationInNode(self)
            let node = self.nodeAtPoint(pos)
            
            if node == playButton {
                //Configure the view
                let skView:SKView = self.view!
                let scene = GameScene(size: skView.bounds.size)
                    scene.scaleMode = SKSceneScaleMode.AspectFill
                    skView.presentScene(scene)
            }
        }
        

    }
    
    func spawnBackgroundStars() {
        self.backgroundColor = UIColor.blackColor()
        var starsNode = SKEmitterNode(fileNamed: "background.sks")
        starsNode?.position = CGPointMake(self.frame.size.width/2, self.frame.size.height)
        self.addChild(starsNode!)
    }
    
    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")

    }
    
}