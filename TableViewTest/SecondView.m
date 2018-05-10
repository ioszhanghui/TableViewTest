//
//  SecondView.m
//  TableViewTest
//
//  Created by zhph on 2018/5/10.
//  Copyright © 2018年 正和普惠. All rights reserved.
//

#import "SecondView.h"

@implementation SecondView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor greenColor];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTap)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    if (self.hidden||self.alpha<=0.01||!self.userInteractionEnabled) {
        return nil;
    }
    
    for(UIView * subView in self.subviews){
        CGPoint subPoint = [subView convertPoint:point fromView:self];

        if ([subView pointInside:subPoint withEvent:event]) {
            UIView * hitView = [subView hitTest:subPoint withEvent:event];
            if (hitView) {
                return hitView;
            }
        }
    }
    
    return self;
}

-(void)viewTap{
    
    NSLog(@"%s",__func__);
}

@end
