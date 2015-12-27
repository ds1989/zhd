//
//  ZDStatusPhotoView.m
//  zhd
//
//  Created by luoyidong on 15/12/11.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatusPhotoView.h"


@interface ZDStatusPhotoView()

@property (nonatomic,assign) UIImageView *gifView;
@end

@implementation ZDStatusPhotoView

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        self.opaque = YES;
        //添加一个gif 图标
        UIImage *image = [UIImage imageWithName:@"timelinke_image_gif"];
        UIImageView *gifView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:gifView];
        self.gifView = gifView;
    }
    return self;
}


-(void)setPhoto:(NSString *)photo
{
    _photo = photo;
    [self setImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    //1、下载图片
    //2、添加gif表显示
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.x = self.width - self.gifView.width;
    self.gifView.y = self.height - self.gifView.height;
}
@end
