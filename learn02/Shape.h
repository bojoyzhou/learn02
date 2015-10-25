//
//  Shape.h
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject

@property NSArray * rects;

-(void)draw;
-(void)moveUp;
-(void)moveDown;
-(void)moveLeft;
-(void)moveRight;

@end
