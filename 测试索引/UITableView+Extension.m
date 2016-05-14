//
//  UITableView+Extension.m
//  测试索引
//
//  Created by iOS吴 加锋 on 16/5/14.
//  Copyright © 2016年 iOS吴 加锋. All rights reserved.
//

#import "UITableView+Extension.h"

static  float number;

@implementation UITableView (Extension)



-(UIView *)setIndexViewWithSArr:(NSMutableArray *)titleArr{
    
    float tableViewH = self.bounds.size.height;
    float insetTop   = self.contentInset.top;
    float insetBottom = self.contentInset.bottom;
    float screenW     = [[UIScreen mainScreen] bounds].size.width;
    float indexViewH = (tableViewH - insetTop - insetBottom)*0.91;
    float indexViewY = (tableViewH - insetTop - insetBottom)*0.09 *0.5+self.frame.origin.y +insetTop;
    
   YWIndexView *indexView = [[YWIndexView alloc]initWithFrame:CGRectMake(screenW - 15, indexViewY, 10, indexViewH)];
    
    indexView.titles = titleArr;
    
    number = titleArr.count;
    
    
    for (int i = 0; i < titleArr.count; i++) {
        
        UILabel *letterLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, indexViewH/number*i,12, indexViewH/number)];
        
        letterLabel.font = [UIFont systemFontOfSize:12];
        
        letterLabel.textColor = [UIColor grayColor];
        
        letterLabel.text = titleArr[i];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(indexViewTap:)];
        
        [indexView addGestureRecognizer:tap];
        [indexView addSubview:letterLabel];
    }
    if (self.superview) {
        
        [self.superview addSubview:indexView];
        
    }
    else{
        return nil;
    }
    return indexView;
}

-(void)indexViewTap:(UITapGestureRecognizer *)tap{
    
   // indexView
    YWIndexView *label = (YWIndexView *)tap.view;
    float  touchY = [tap locationInView:tap.view].y;
    float index = touchY /label.bounds.size.height *(number);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }



@end

@implementation YWIndexView


@end
