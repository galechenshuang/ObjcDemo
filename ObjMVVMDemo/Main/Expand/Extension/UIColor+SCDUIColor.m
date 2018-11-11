//
//  UIColor+SCDUIColor.m
//  ObjMVVMDemo
//
//  Created by Simpletour on 2018/3/27.
//  Copyright © 2018年 Simpletour. All rights reserved.
//

#import "UIColor+SCDUIColor.h"
#import <objc/runtime.h>

@implementation UIColor (SCDUIColor)


+ (void)load{
    
    Method whiteValueColor = class_getClassMethod(self, @selector(whiteColor));
    
    Method changeWhiteToGrayColor = class_getClassMethod(self, @selector(grayColor));
    
    method_exchangeImplementations(whiteValueColor, changeWhiteToGrayColor);
}


+ (UIColor *)grayColor {
    
    return [UIColor colorWithRed:110/255.0 green:110/255.0 blue:10/255.0 alpha:1.0];
}
+ (UIColor *)whiteColor{
    return [UIColor colorWithRed:10/255.0 green:10/255.0 blue:110/255.0 alpha:1.0];
}
@end
