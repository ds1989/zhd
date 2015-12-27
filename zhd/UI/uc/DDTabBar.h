//
//  DDTabBar.h
//  zhd
//
//  Created by luoyidong on 15/12/5.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDTabBar;
@protocol DDTabBarDelegate <NSObject>

@optional
-(void) tabBarDidClickedPlusButton:(DDTabBar *)tabBar;

@end


@interface DDTabBar : UITabBar

//@property(nonatomic,weak) id<DDTabBarDelegate> tabBarDelegate;

@end
