//
//  UIBarButtonItem+Extension.h
//  zhd
//
//  Created by luoyidong on 15/12/5.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(instancetype)BarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle) style target:(id) target action:(SEL) action;

+(instancetype)BarButtonItemWithBackgroundImageName:(NSString *)backgroundImage highBackgroudImageName:(NSString *) highBackgroudImagedName target:(id)target action:(SEL)target ;

+(instancetype)BarbuttonitemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName title:(NSString *)title target:(id) target action:(SEL)action;

@end
