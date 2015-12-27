//
//  ZDTitleButtom.m
//  zhd
//
//  Created by luoyidong on 15/12/5.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDTitleButtom.h"

@implementation ZDTitleButtom

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //内部图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        //文字对齐
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        //字体大小
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //高亮的时候不需要调整的图片灰色
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

// 设置内部图片的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = self.height;
    CGFloat imageH = self.height;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

//设置内部文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleH = self.height;
    CGFloat titleW = self.width - self.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
    
}
-(void) setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    //1.计算文字的尺寸
    CGSize titleSize = [title sizeWithFont:self.titleLabel.font maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    //2.计算按钮的宽度
    self.width = titleSize.width + self.height + DSNavigationItemMargin;
}
@end
