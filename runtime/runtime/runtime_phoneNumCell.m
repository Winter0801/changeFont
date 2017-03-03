//
//  runtime_phoneNumCell.m
//  runtime
//
//  Created by LyforMac on 17/3/1.
//  Copyright © 2017年 playTeam. All rights reserved.
//

#import "runtime_phoneNumCell.h"

@implementation runtime_phoneNumCell

- (void)awakeFromNib {

    [self.callButton addTarget:self action:@selector(callButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)callButtonClick :(UIButton*)sender{
    
    if (self.callBtnBlock) {
        self.callBtnBlock(sender);
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
