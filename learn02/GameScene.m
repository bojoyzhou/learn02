//
//  GameScene.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright (c) 2015年 周明波. All rights reserved.
//

#import "GameScene.h"
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
    int det = width / 10;
    int i = 0;
    int y = 0;
    for (i = 0; i <= 10; i++) {
        CGPoint startPoint = CGPointMake(i * det, 0);
        CGPoint endPoint = CGPointMake(i * det, height);
        [self makeLine:startPoint endWith:endPoint];
    }
    for (y = height; y >= 0; y -= det) {
        CGPoint startPoint = CGPointMake(0, y);
        CGPoint endPoint = CGPointMake(width, y);
        [self makeLine:startPoint endWith:endPoint];
    }
    
    Shape1 *shape1 = [Shape1 new];
    [shape1 initWithX:0 initWithY:0 initWithSize:det initWithView:self.view];
    
    [shape1 draw];
    
    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:shape1 selector:@selector(moveDown)];
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
//    BJRect *bjrect = [BJRect initWithSize:det initWithX:0 initWithY:0 initWithView:self.view];
//    [bjrect draw];
}

-(void)makeLine:(CGPoint) startPoint endWith:(CGPoint) endPoint {
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor;
    layer.strokeColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5].CGColor;
    layer.frame = self.view.frame;
    layer.lineWidth = 1;
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    
    layer.path = path.CGPath;
    
    [self.view.layer addSublayer:layer];
    NSLog(@"add sub layer startPoint [%f, %f] endPoint [%f, %f]", startPoint.x, startPoint.y, endPoint.x, endPoint.y);
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
