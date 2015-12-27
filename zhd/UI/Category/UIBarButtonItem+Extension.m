//
//  UIBarButtonItem+Extension.m
//  zhd
//
//  Created by luoyidong on 15/12/5.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"


@implementation UIBarButtonItem (Extension)


+(instancetype)BarButtonItemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
    return [[self alloc] initWithTitle:title style:style target:target action:action];
}

+(instancetype) BarButtonItemWithBackgroundImageName:(NSString *)backgroundImage highBackgroudImageName:(NSString *)highBackgroudImagedName target:(id)target action:(SEL)action
{
    UIButton *button  = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageWithName:backgroundImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:highBackgroudImagedName] forState:UIControlStateHighlighted];
    
    //设置按钮的池翠背景图片的尺寸
    
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}


/**
 *  设置tarbuttoonItem
 *
 *  @param imageName     图片名称
 *  @param highImageName 高亮图片名称
 *  @param title         标题
 *  @param target        回调对象
 *  @param action        回调方法
 *
 *  @return UIBarButtonItem
 */
+(instancetype)BarbuttonitemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageWithName:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:highImageName] forState:UIControlStateHighlighted];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:DSCommonColor forState:UIControlStateHighlighted];
    }
    //
   // button.frame.size.width = button.currentImage.size.width +[title sizeWithFont:button.titleLabel.font maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)].width;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

@end
