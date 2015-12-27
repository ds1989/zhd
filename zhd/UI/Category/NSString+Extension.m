//
//  NSString+Extension.m
//  zhd
//
//  Created by luoyidong on 15/12/5.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString(Extension)

#pragma mark 计算字符串大小
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize textSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return textSize;
}

@end
