//
//  ZDStatusUserHeadView.m
//  zhd
//
//  Created by luoyidong on 15/12/16.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatusUserHeadView.h"

@interface ZDStatusUserHeadView()

@property (nonatomic,assign) UIImageView *verifiedImageView;

@end

@implementation ZDStatusUserHeadView


-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        UIImageView *verifiedImageView = [[UIImageView alloc] init];
        
        [self addSubview:verifiedImageView];
        _verifiedImageView = verifiedImageView;
        
    }

    return self;
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    
    UIImage *vipImage = [UIImage imageNamed:@"avatar_vip"];
    
    _verifiedImageView.center = CGPointMake(self.width, self.height);
    _verifiedImageView.width = vipImage.size.width - 1;
    _verifiedImageView.height = vipImage.size.height -1;
}


//添加验证图片
-(void) addVIPImageWithVerified:(NSString *)verified verifiedType:(int)verifiedType
{
    UIImage *vipImage;
    _verifiedImageView.hidden = YES;
    if (verified.intValue==0) {
        return;
    }
    _verifiedImageView.hidden = NO;
    
    if (verifiedType==0) {//个人认证
        vipImage = [UIImage imageNamed:@"avatar_vip"];
    }
    if (verifiedType==3) {
        vipImage = [UIImage imageNamed:@"avatar_enterprise_vip"];
    }
    _verifiedImageView.image = vipImage;
}


@end
