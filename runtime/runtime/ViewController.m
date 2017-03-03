//
//  ViewController.m
//  runtime
//
//  Created by LyforMac on 17/3/1.
//  Copyright © 2017年 playTeam. All rights reserved.
//

#import "ViewController.h"
#import "runtime_phoneNumCell.h"
#import <objc/runtime.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tableview;
    NSMutableArray *datasource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    datasource = [[NSMutableArray alloc]initWithObjects:@"这是runtime嘛",@"15911063694",@"15412912191", nil];
    [self initTableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initTableView{
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [tableview registerNib:[UINib nibWithNibName:@"runtime_phoneNumCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:tableview];
    tableview.tableFooterView = [UIView new];
    
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return datasource.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    
    runtime_phoneNumCell *cell = [tableview dequeueReusableCellWithIdentifier:cellId];;
    cell.phoneNumLabel.text = datasource[indexPath.row];
    cell.callBtnBlock = ^(UIButton *sender){
       
    };
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableview deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
