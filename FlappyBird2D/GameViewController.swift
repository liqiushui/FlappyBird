//
//  GameViewController.swift
//  FlappyBird2D
//
//  Created by qqvipfunction on 16/3/25.
//  Copyright (c) 2016年 SZ. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let skView = self.view as? SKView{
            
            if skView.scene == nil {
                
                let bounds = skView.bounds;
                let aspectRatio = CGRectGetHeight(bounds)/CGRectGetWidth(bounds)
                let scene = GameScene(size:CGSize(width: 320, height: 320 * aspectRatio))
                
                skView.showsFPS = true
                skView.showsNodeCount = true
                skView.showsPhysics = true
                skView.ignoresSiblingOrder = true
                
                scene.scaleMode = .AspectFill
                
                skView.presentScene(scene)
            }
            
            
        }

        
        
    }

}
