//
//  BaseTableView.h
//  WMTTTTAAB
//
//  Created by MengWang on 2017/12/4.
//  Copyright © 2017年 yuki.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BTProtocol <NSObject>
- (void)tableViewDidScroll:(UITableView *)tbView withOffsetY:(CGFloat)offsetY;
@end

@interface BaseTableView : UIView
@property (nonatomic, strong)UITableView *tbView;
@property(nonatomic,weak)id<BTProtocol> delegate;
@end
