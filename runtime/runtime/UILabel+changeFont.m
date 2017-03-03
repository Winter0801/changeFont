//
//  UILabel+changeFont.m
//  runtime
//
//  Created by LyforMac on 17/3/3.
//  Copyright © 2017年 playTeam. All rights reserved.
//

#import "UILabel+changeFont.h"
#import <objc/runtime.h>
#define CustomFontName @"FZLBJW--GB1-0"

@implementation UILabel (changeFont)

+ (void)load{
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        SEL systemSel = @selector(willMoveToSuperview:);
        SEL mySwizzSel = @selector(myWillMoveToSuperview:);
        
        Method systemMethod = class_getInstanceMethod([self class], systemSel);
        Method mySwizzMethod = class_getInstanceMethod([self class], mySwizzSel);
        
        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(mySwizzMethod), method_getTypeEncoding(mySwizzMethod));
        
        //如果有这个方法则不替换
        if (isAdd) {
            class_replaceMethod(self, mySwizzSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        }
        //替换方法
        else{
            method_exchangeImplementations(systemMethod, mySwizzMethod);
        }
        
    });
    
}

- (void)myWillMoveToSuperview: (UIView *)newSuperView{
    [self myWillMoveToSuperview:newSuperView];

    if ([UIFont fontNamesForFamilyName:CustomFontName])
        self.font  = [UIFont fontWithName:CustomFontName size:self.font.pointSize];
        self.textColor = [UIColor yellowColor];
}
@end
