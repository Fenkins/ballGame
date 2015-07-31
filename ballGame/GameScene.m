//
//  GameScene.m
//  ballGame
//
//  Created by Fenkins on 31/07/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    SKSpriteNode *universalBall;
    BOOL restartGameButtonAdded;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    restartGameButtonAdded = NO;
    
    self.backgroundColor = [SKColor whiteColor];
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];

    
    
}

-(void)addBall{
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        // Creating a ball
        NSArray *balls = @[@"8Ball",@"BeachBall",@"SoccerBall"];
        NSInteger randBall = (NSInteger)(arc4random_uniform(3));
        universalBall = [[SKSpriteNode alloc] initWithImageNamed:balls[randBall]];
        universalBall.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:universalBall.frame.size.width/2];
        switch (randBall) {
            case 0:
                universalBall.physicsBody.restitution = 0;
                universalBall.physicsBody.linearDamping = 0.2;
                universalBall.physicsBody.friction = 1.0;
                break;
            case 1:
                universalBall.physicsBody.restitution = 0.7;
                universalBall.physicsBody.linearDamping = 0.1;
                universalBall.physicsBody.friction = 0.5;
                break;
            case 2:
                universalBall.physicsBody.restitution = 0.9;
                universalBall.physicsBody.linearDamping = 0.1;
                universalBall.physicsBody.friction = 0.5;
                break;
            default:
                break;
        }
        // Setting position
        universalBall.position = location;
        // Adding to view
        [self addChild:universalBall];
        
        if (universalBall.position.y >= self.frame.size.height-universalBall.size.height && restartGameButtonAdded == NO) {
            SKLabelNode *restartGame = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
            restartGame.text = @"Restart Game";
            restartGame.fontSize = 30.0;
            restartGame.color = [SKColor greenColor];
            NSLog(@"Color %@ ", restartGame.color);
            restartGame.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame)-restartGame.frame.size.height*2);
            [self addChild:restartGame];
            restartGameButtonAdded = YES;
        }
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
