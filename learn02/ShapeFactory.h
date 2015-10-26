//
//  ShapeFactory.h
//  learn02
//
//  Created by 周明波 on 15/10/26.
//  Copyright © 2015年 周明波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"

@interface ShapeFactory : NSObject

+(ShapeFactory *)initWithWidth:(int)width initWithHeight:(int)height initWithSize:(int)size initWithView:(UIView *)view;
-(Shape *)getInstance:(NSString *)classname;

@end
