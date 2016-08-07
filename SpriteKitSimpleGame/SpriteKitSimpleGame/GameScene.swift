//
//  GameScene.swift
//  SpriteKitSimpleGame
//
//  Created by lily on 8/5/16.
//  Copyright (c) 2016 Seab Jackson. All rights reserved.
//

import SpriteKit

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
func sqrt(a: CGFloat) -> CGFloat {
    return CGFloat(sqrtf(Float(a)))
}
#endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x * x + y * y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
    
}

class GameScene: SKScene {
    // 1
    let player = SKSpriteNode(imageNamed: "player")
    
    override func didMoveToView(view: SKView) {
        // 2
        backgroundColor = SKColor.whiteColor()
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        //
        addChild(player)
        
        runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(addMonster), SKAction.waitForDuration(1.0)])))
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addMonster() {
        // create sprite
        let monster = SKSpriteNode(imageNamed: "monster")
        let actualY = random(min: monster.size.height / 2, max: size.height - monster.size.height / 2)
        
        monster.position = CGPoint(x: size.width + monster.size.width / 2, y: actualY)
        
        // add the monster to the scene
        addChild(monster)
        
        // determine the speed of the monster
        let actualDuration = random(min: 2.0, max: 4.0)
        
        //  create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width / 2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
