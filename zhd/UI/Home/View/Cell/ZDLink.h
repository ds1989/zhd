//
//  ZDLink.h
//  zhd
//
//  Created by luoyidong on 15/12/10.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDLink : UIView

//匹配的文本
@property (nonatomic,copy) NSString *text;

//匹配的文字范围
@property(nonatomic,assign)NSRange range;

//选中的范围
@property(nonatomic,strong)NSArray *rects;

@end
