//
//  GameScene.m
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright (c) 2015年 周明波. All rights reserved.
//

#import "GameScene.h"
#import "LineGround.h"
#import "Shape.h"
#import "ShapeFactory.h"

Shape * currentShape;
ShapeFactory * shapeFactory;
int width, height, size;
SKView * s_view;
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
    s_view = view;
    CGRect rect = [UIScreen mainScreen].bounds;
    width = rect.size.width;
    height = rect.size.height;
    size = width / 10;
    LineGround * lg = [LineGround initWithSize:size initWithView:view initWithWidth:width initWithHeight:height];
    NSLog(@"lg draw");
    [lg draw];
    [self drawShape];
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:doubleTap];
    
    UISwipeGestureRecognizer * swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp)];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer * swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown)];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipeDown];
    
    UISwipeGestureRecognizer * swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer * swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
//    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:shape1 selector:@selector(moveDown)];
//    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
//    BJRect *bjrect = [BJRect initWithSize:size initWithX:0 initWithY:0 initWithView:self.view];
//    [bjrect draw];
}
-(void)drawShape{
    shapeFactory = [ShapeFactory initWithWidth:width initWithHeight:height initWithSize:size initWithView:s_view];
    long n = random() % 5;
    n += 1;
    NSString * classname = @"Shape";
    classname = [classname stringByAppendingString:[[NSNumber numberWithLong:n] stringValue]];
//    classname = @"Shape5";
    Shape *shape = [shapeFactory getInstance:classname];
    currentShape = shape;
    [shape draw];
}
-(void)doubleTap{
    NSLog(@"doubleTap");
    [currentShape deformation];
}

-(void)swipeUp{
    NSLog(@"swipeUp");
    [currentShape moveUp];
}

-(void)swipeDown{
    NSLog(@"swipeDown");
    while ([currentShape moveDown]);
    [LineGround locateShape:currentShape];
    currentShape = nil;
    [self drawShape];
}

-(void)swipeLeft{
    NSLog(@"swipeLeft");
    [currentShape moveLeft];
}

-(void)swipeRight{
    NSLog(@"swipeRight");
    [currentShape moveRight];
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
