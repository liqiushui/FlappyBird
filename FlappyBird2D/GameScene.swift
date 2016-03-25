//
//  GameScene.swift
//  FlappyBird2D
//
//  Created by qqvipfunction on 16/3/25.
//  Copyright (c) 2016年 SZ. All rights reserved.
//

import SpriteKit

enum Layer: CGFloat
{
    case Background
    case Foreground
    case Player
}



class GameScene: SKScene {
    
    let worldNode = SKNode()
    let kGravity: CGFloat = -1500.0
    var playerStart: CGFloat = 0
    var playerHeight: CGFloat = 0

    let player = SKSpriteNode(imageNamed: "Bird0")
    
    var lastUpdateTime : NSTimeInterval = 0
    var dt : NSTimeInterval = 0
    var playerVelocity = CGPoint.zero
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        addChild(worldNode)
        
        setupBackground()
        
        setupForeground()
        
        setupPlayer()
        
    }
    
    
    func setupBackground()
    {
        let background = SKSpriteNode(imageNamed: "Background")
        background.anchorPoint = CGPointMake(0.5, 1.0)
        background.position = CGPointMake(size.width/2, size.height)
        background.zPosition = Layer.Background.rawValue
        worldNode.addChild(background)
        
        playerStart = size.height - background.size.height
        playerHeight = background.size.height
    }
    
    func setupForeground()
    {
        let foreground = SKSpriteNode(imageNamed: "Ground")
        foreground.anchorPoint = CGPointMake(0, 1.0)
        foreground.position = CGPointMake(0, playerStart)
        foreground.zPosition = Layer.Foreground.rawValue
        worldNode.addChild(foreground)
    }
    
    
    func setupPlayer()
    {
        player.position = CGPointMake(size.width * 0.2, playerHeight*0.4 + playerStart)
        player.zPosition = Layer.Player.rawValue
        worldNode.addChild(player)
    }
    
    
    func updatePlayer()
    {
        let gravity = CGPoint(x:0, y:kGravity)
        let gravityStep = gravity * CGFloat(dt)
        playerVelocity += gravityStep
        
        
        let velocityStep = playerVelocity * CGFloat(dt)
        player.position += velocityStep
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        }
        else{
            dt = 0
        }
        lastUpdateTime = currentTime
        
        updatePlayer()
    }
}
