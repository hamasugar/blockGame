//
//  GameScene.swift
//  ballBound
//
//  Created by user on 2018/07/30.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class GameScene: SKScene,SKPhysicsContactDelegate{
    
    var longbar:SKSpriteNode!
    var ball:SKShapeNode!
    var block1:SKShapeNode!
    var block2:SKShapeNode!
    var block3:SKShapeNode = SKShapeNode()
    var block4:SKShapeNode = SKShapeNode()
    var block5:SKShapeNode = SKShapeNode()
    var block6:SKShapeNode = SKShapeNode()
    var block7:SKShapeNode = SKShapeNode()
    
    
    
    
    
    override func didMove(to view: SKView){
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.backgroundColor = UIColor.blue
        self.longbar = SKSpriteNode(color: UIColor.red, size: CGSize(width: 400, height: 20))
        self.longbar.position = CGPoint(x: self.frame.maxX-400, y: self.frame.maxY-100)
        self.longbar.physicsBody = SKPhysicsBody(rectangleOf:self.longbar.size)
        self.longbar.physicsBody!.isDynamic = false
        self.longbar.physicsBody!.contactTestBitMask = 100
        self.addChild(longbar)
        
        self.physicsWorld.contactDelegate = self
        
        
        self.ball = SKShapeNode(circleOfRadius: 20)
        self.ball.fillColor = UIColor.yellow
        self.ball.strokeColor = UIColor.yellow
        self.ball.position = CGPoint(x: 0, y: 0)
        self.ball.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        self.ball.physicsBody!.velocity = CGVector(dx:CGFloat(500), dy: CGFloat(-600))
        
        self.ball.physicsBody!.affectedByGravity = false
        self.ball.physicsBody!.restitution = 1.0
        self.ball.physicsBody!.linearDamping = 0
        self.ball.physicsBody!.friction = 0
        self.ball.physicsBody!.allowsRotation = false
        self.ball.physicsBody!.usesPreciseCollisionDetection = true
        self.ball.physicsBody?.contactTestBitMask = 2
        
        self.addChild(ball)
        
        
        self.block1 = SKShapeNode(rect: CGRect(x: -self.frame.maxX, y: 0, width: 200, height: 200))
        self.block1.fillColor = UIColor.red
        self.block1.strokeColor = UIColor.red
        self.block1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 200), center: CGPoint(x: 100-self.frame.maxX, y: 100))
        self.block1.physicsBody!.contactTestBitMask = 3
        self.block1.physicsBody!.affectedByGravity = false
        self.block1.physicsBody!.isDynamic = false
        self.addChild(block1)
        
        self.block2 = SKShapeNode(rect: CGRect(x: self.frame.maxX-200, y: 0, width: 200, height: 200))
        self.block2.fillColor = UIColor.red
        self.block2.strokeColor = UIColor.red
        self.block2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 200), center: CGPoint(x: self.frame.maxX-100, y: 100))
        self.block2.physicsBody!.contactTestBitMask = 4
        self.block2.physicsBody!.affectedByGravity = false
        self.block2.physicsBody!.isDynamic = false
        self.addChild(block2)
        
        
        makeBlock(i: 0, k: self.block3)
        makeBlock(i: 1, k: self.block4)
        makeBlock(i: 2, k: self.block5)
        makeBlock(i: 3, k: self.block6)
        makeBlock(i: 4, k: self.block7)
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        print ("aaaaaaaaaa")
}
    
    var i = 0
    
    
    func didBegin(_ contact: SKPhysicsContact){
        
        if contact.bodyA.contactTestBitMask == 3  || contact.bodyA.contactTestBitMask == 4{
            
            i+=1
            
            if i==1{
                
                self.block1.fillColor = UIColor.yellow
                self.block2.fillColor = UIColor.yellow
            }
            if i==2{
                
                self.block1.fillColor = UIColor.cyan
                self.block2.fillColor = UIColor.cyan
                }
            
            if i>=3{
                
                contact.bodyA.node?.removeFromParent()
            }
            
            if i==5{
                
                let alertCont = UIAlertController(title: "aaa", message: "bbb", preferredStyle: .alert)
                let action = UIAlertAction(title: "syuuryoudesu", style: .default, handler: nil)
                alertCont.addAction(action)
                let currentViewController : UIViewController? =
                    UIApplication.shared.keyWindow?.rootViewController!
                currentViewController?.present(alertCont, animated: true)
                
            }
            
    
            
        }
        
        else if contact.bodyB.contactTestBitMask == 3  || contact.bodyB.contactTestBitMask == 4{
            i+=1
            
            if i==1{
                
                self.block1.fillColor = UIColor.yellow
                self.block2.fillColor = UIColor.yellow
            }
            if i==2{
                
                self.block1.fillColor = UIColor.cyan
                self.block2.fillColor = UIColor.cyan
            }
            
            if i>=3{
                
                contact.bodyB.node?.removeFromParent()
            }
            
            if i==5{
                
                let alertCont = UIAlertController(title: "aaa", message: "bbb", preferredStyle: .alert)
                let action = UIAlertAction(title: "syuuryoudesu", style: .default, handler: nil)
                alertCont.addAction(action)
                let currentViewController : UIViewController? =
                    UIApplication.shared.keyWindow?.rootViewController!
                currentViewController?.present(alertCont, animated: true)
                
            }
            
          
            
            
            
        }
    }
    

    
    func makeBlock(i:CGFloat, k:SKShapeNode){
        
        print ("aa")
        var s = k
        print ("bbb")
        s = SKShapeNode(rect: CGRect(x: -self.frame.maxX+(i*110), y: -self.frame.maxY, width: 100, height: 100))
        s.fillColor = UIColor.red
        s.strokeColor = UIColor.red
        s.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100), center: CGPoint(x:-self.frame.maxX+(i*110)+50 , y: -self.frame.maxY+50))
        s.physicsBody!.contactTestBitMask = 3
        s.physicsBody!.affectedByGravity = false
        s.physicsBody!.isDynamic = false
        self.addChild(s)
        
        print ("kkk")
        
       }
    
    
    
    
}
