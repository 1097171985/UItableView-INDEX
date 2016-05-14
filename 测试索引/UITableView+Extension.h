//
//  UITableView+Extension.h
//  测试索引
//
//  Created by iOS吴 加锋 on 16/5/14.
//  Copyright © 2016年 iOS吴 加锋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YWIndexView;

@interface UITableView (Extension)



-(UIView *)setIndexViewWithSArr:(NSArray *)titleArr;

@end




@interface YWIndexView : UIView
    
@property(nonatomic,strong)NSMutableArray *titles;


@end