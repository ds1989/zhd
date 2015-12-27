//
//  ZDStatusOriginalFrame.m
//  zhd
//
//  Created by luoyidong on 15/12/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatusOriginalFrame.h"
#import "NSString+Extension.h"
#import "ZDStatus.h"
#import "ZDStatusPhotosView.h"
#import "ZDUser.h"


@implementation ZDStatusOriginalFrame

-(void)setStatus:(ZDStatus *)status
{
    _status = status;
    //头像
    CGFloat iconX = DSStatusCellInset;
    CGFloat iconY= DSStatusCellInset;
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //昵称
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) +DSStatusCellInset;
    CGFloat nameY = iconY;
  
    CGSize nameSize = [status.user.username sizeWithFont:DSStatusOriginalNameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    self.nameFrame = (CGRect){{nameX, nameY}, nameSize};
    
    //正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconFrame) +DSStatusCellInset;
    CGFloat maxW = ZDScreenWidth - 2*textX;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    NSMutableAttributedString *attriString = [[[NSMutableAttributedString alloc] initWithString:@"this is test!"]
                                              autorelease];
    CGSize textSize = [attriString boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    self.textFrame = (CGRect){{textX,textY},textSize};
    
    //更多图标计算
    UIImage *moreImage = [UIImage imageNamed:@"timeline_icon_moren"];
    CGFloat moreW = moreImage.size.width;
    CGFloat moreX = ZDScreenWidth - DSStatusCellInset - moreW;
    CGFloat moreY = iconY;
    CGFloat moreH = moreImage.size.height;
    self.moreFrame = CGRectMake(moreX, moreY, moreW, moreH);
    
    //配图相册
    CGFloat h =0;

    if (status.pic_urls.count) {
        CGFloat photosX = textX;
        CGFloat photosY = CGRectGetMaxY(self.textFrame)+DSStatusCellInset;
        CGSize photosSize = [ZDStatusPhotosView sizeWithPhotosCount:(int) status.pic_urls.count];
        self.photosFrame = (CGRect){{photosX,photosY}, photosSize};
        h = CGRectGetMaxY(self.photosFrame)+DSStatusCellInset;
        
    }else
    {
        h =CGRectGetMaxY(self.textFrame)+DSStatusCellInset;
    }
    //h =CGRectGetMaxY(self.textFrame)+DSStatusCellInset;

    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = ZDScreenWidth;
    self.frame = CGRectMake(x, y, w, h);
}

@end
