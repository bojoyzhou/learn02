//
//  LineGround.h
//  learn02
//
//  Created by 周明波 on 15/10/25.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Shape.h"

@interface LineGround : NSObject

@property UIView * m_view;

+(LineGround *) initWithSize:(int)size initWithView:(UIView *)view initWithWidth:(int)width initWithHeight:(int)height;
+(BOOL) canLocate:(Shape *)shape;
+(BOOL) locateShape:(Shape *)shape;
-(void)draw;

@end
