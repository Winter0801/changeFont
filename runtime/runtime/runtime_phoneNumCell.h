//
//  runtime_phoneNumCell.h
//  runtime
//
//  Created by LyforMac on 17/3/1.
//  Copyright © 2017年 playTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ callBtnBlaock) (UIButton *button);

@interface runtime_phoneNumCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (weak, nonatomic) IBOutlet UIButton *callButton;

@property (nonatomic,strong)callBtnBlaock callBtnBlock;
@end
