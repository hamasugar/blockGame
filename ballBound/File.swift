//
//  File.swift
//  ballBound
//
//  Created by user on 2018/08/02.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene2: SKScene,SKPhysicsContactDelegate {
    
    var longbar:SKSpriteNode!
    var ball:SKSpriteNode!
    var block1:SKShapeNode!
    var block2:SKShapeNode!
    
    
    override func didMove(to view: SKView){
        
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.backgroundColor = UIColor.blue
        self.longbar = SKSpriteNode(color: UIColor.red, size: CGSize(width: 120, height: 20))
        self.longbar.position = CGPoint(x: self.frame.maxX-100, y: self.frame.maxY-100)
        self.longbar.physicsBody? = SKPhysicsBody(rectangleOf:self.longbar.size)
        self.longbar.physicsBody?.isDynamic = false
        self.addChild(longbar)
        
        self.physicsWorld.contactDelegate = self
        
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        print ("aaaaaaaaaa")
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact){
        
        
        
    }
    
    
    
    
    
}
