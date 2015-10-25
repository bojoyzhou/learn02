//
//  GameScene.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright (c) 2015年 周明波. All rights reserved.
//

#import "GameScene.h"
#import "LineGround.h"
#import "BJRect.h"
#import "Shape1.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster1"];
//    NSLog(@"did move to view");
//    myLabel.text = @"Hello, World!";
//    myLabel.fontSize = 45;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
//    
//    [self addChild:myLabel];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    int width = rect.size.width;
    int height = rect.size.height;
    int size = width / 10;
    LineGround * lg = [LineGround initWithSize:size initWithView:view initWithWidth:width initWithHeight:height];
    [lg draw];
    Shape1 *shape1 = [Shape1 new];
    [shape1 initWithX:0 initWithY:0 initWithSize:size initWithView:self.view];
    
    [shape1 draw];
    
    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:shape1 selector:@selector(moveDown)];
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
//    BJRect *bjrect = [BJRect initWithSize:size initWithX:0 initWithY:0 initWithView:self.view];
//    [bjrect draw];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
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
//    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
