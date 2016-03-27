//
//  GameMenuNode.swift
//  FlappyBird2D
//
//  Created by qqvipfunction on 16/3/27.
//  Copyright © 2016年 SZ. All rights reserved.
//

import SpriteKit

class GameMenuNode: SKSpriteNode {
    
    internal func loadMenu()
    {
        let logo = SKSpriteNode(imageNamed: "Logo")
        logo.position = CGPoint(x: frame.size.width/2, y: frame.size.height * 0.8)
        logo.zPosition = Layer.MenuUI.rawValue
        self .addChild(logo)
        
        
        //play button
        
        let playButton = SKSpriteNode(imageNamed: "Button")
        playButton.position = CGPoint(x: size.width * 0.25, y: size.height * 0.25)
        playButton.zPosition = Layer.MenuUI.rawValue
        self .addChild(playButton)
        
        let playbg = SKSpriteNode(imageNamed: "Play")
        playbg.position = CGPointZero
        playButton.addChild(playbg)
        playButton.name = kButtonName_Play
        
        //Rate button
        
        let rateButton = SKSpriteNode(imageNamed: "Button")
        rateButton.position = CGPoint(x: size.width * 0.75, y: size.height * 0.25)
        rateButton.zPosition = Layer.MenuUI.rawValue
        
        let ratebg = SKSpriteNode(imageNamed: "Rate")
        ratebg.position = CGPointZero
        rateButton.addChild(ratebg)
        self .addChild(rateButton)
        rateButton.name = kButtonName_Rate

        
        
        //learn button
        
        let learnButton = SKSpriteNode(imageNamed: "button_learn")
        learnButton.position = CGPoint(x: size.width/2, y: learnButton.size.height/2 + 42)
        learnButton.zPosition = Layer.MenuUI.rawValue
        self.addChild(learnButton)
        
        let scaleup = SKAction.scaleTo(1.02, duration: 0.75)
        scaleup.timingMode = SKActionTimingMode.EaseInEaseOut
        let scaledown = SKAction.scaleTo(0.98, duration: 0.75)
        scaledown.timingMode = SKActionTimingMode.EaseInEaseOut
        
        learnButton.runAction(SKAction.repeatActionForever(SKAction.sequence([scaleup,scaledown])))
        learnButton.name = kButtonName_Learn

        self.userInteractionEnabled = true
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch?.locationInNode(self)
        
        for child in self.children{
            
            if let spriteNode = child as? SKSpriteNode{
                
                if spriteNode.containsPoint(touchLocation!)
                {
                    NSNotificationCenter.defaultCenter().postNotificationName(kNoti_TutorialTouch, object: nil, userInfo:["sender":spriteNode])
                }
            }
        }
    }
    
    
}
