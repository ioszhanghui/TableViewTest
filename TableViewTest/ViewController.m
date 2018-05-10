//
//  ViewController.m
//  TableViewTest
//
//  Created by zhph on 2018/5/10.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewHeaderView.h"
#import "FirstView.h"
#import "SecondView.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FirstView * first = [[FirstView alloc]initWithFrame:CGRectMake(100, 100, 300, 300)];
    [self.view addSubview:first];
    
    SecondView * second = [[SecondView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    [first addSubview:second];

}

-(void)testTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = 50;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.sectionFooterHeight = 0.00;
    [self.tableView registerClass:[UITableViewHeaderView class] forHeaderFooterViewReuseIdentifier:@"UITableViewHeaderView"];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld",indexPath.row];
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UITableViewHeaderView * header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderView"];
    header.textLabel.text= [@(section) stringValue];
    header.backgroundColor = [UIColor greenColor];
    
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    UITableViewHeaderView * header =  (UITableViewHeaderView *)[self.tableView headerViewForSection:1];
//    header.contentView.backgroundColor = [UIColor yellowColor];

    NSLog(@"rectForSection***%@",NSStringFromCGRect([self.tableView rectForSection:1]));
    NSLog(@"rectForHeaderInSection***%@",NSStringFromCGRect([self.tableView rectForHeaderInSection:1]));
  
}

@end
