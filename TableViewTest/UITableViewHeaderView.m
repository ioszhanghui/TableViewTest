//
//  UITableViewHeaderView.m
//  TableViewTest
//
//  Created by zhph on 2018/5/10.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "UITableViewHeaderView.h"

@implementation UITableViewHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithReuseIdentifier:reuseIdentifier]) {
        
//        self.contentView.backgroundColor = [UIColor redColor];
        
        UIView * contentView = [[UIView alloc]initWithFrame:self.bounds];
        contentView.backgroundColor = [UIColor brownColor];
        self.backgroundView = contentView;
        self.backgroundView.backgroundColor =[UIColor purpleColor];
        
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
        
    }
    
    return self;
}

@end
