//
//  ZDStatusPhotosView.m
//  zhd
//
//  Created by luoyidong on 15/12/10.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatusPhotosView.h"
#import "ZDStatusPhotoView.h"


#define DSStatusPhotosMaxCount 9
#define DSStatusPhotosMaxCols(photosCount) ((photosCount == 4) ? 2 :3)
#define DSStatusPhotosW ZDScreenWidth*0.21
#define DSStatusPhotosH DSStatusPhotosW
#define DSStatusPhotosMargin 5

@interface ZDStatusPhotosView()
@property (nonatomic,assign) CGRect lastFrame;
@property (nonatomic,assign) UIImageView *bigImageView;

@end

@implementation ZDStatusPhotosView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
        //预先差ungjian9ge图片空间
        for (int i=0; i<DSStatusPhotosMaxCount; i++) {
            ZDStatusPhotoView *photoView = [[ZDStatusPhotoView alloc] init];
            photoView.tag = i;
            [self addSubview:photoView];
            
            //添加手势
            //UITapGestureRecognizer *gestrureRecoginzer = [[UITapGestureRecognizer alloc] initWithTarget:self action:<#(nullable SEL)#>]
        }
    }
    return self;
}

-(void)setPicUrls:(NSArray *)picUrls
{
    _picUrls = picUrls;
    for (int i = 0; i<DSStatusPhotosMaxCount; i++) {
        ZDStatusPhotoView *photoView = self.subviews[i];
        if (i<picUrls.count) {
            photoView.photo = picUrls[i];
            photoView.hidden = NO;
        }else
        {
            photoView.hidden = YES;
        }
    }
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    
    int count = (int) self.picUrls.count;
    int maxCols = DSStatusPhotosMaxCols(count);
    
    for (int i = 0; i<count; i++) {
        ZDStatusPhotoView *photoView = self.subviews[i];
        photoView.width = DSStatusPhotosW;
        photoView.height = DSStatusPhotosH;
        photoView.x = (i%maxCols)*(DSStatusPhotosW + DSStatusPhotosMargin);
        photoView.y = (i/maxCols)*(DSStatusPhotosW + DSStatusPhotosMargin);
        
    }
}

+(CGSize) sizeWithPhotosCount:(int)photoCount
{
    int maxCols = DSStatusPhotosMaxCols(photoCount);
    //总列数
    int totalCols = photoCount >= maxCols?maxCols:photoCount;
    
    //总行数
    int totalRows = (photoCount+maxCols - 1)/maxCols;
    
    CGFloat photosW = totalCols *DSStatusPhotosW +(totalCols - 1)*DSStatusPhotosMargin;
    CGFloat photosH = totalRows * DSStatusPhotosH +(totalRows - 1)*DSStatusPhotosMargin;
    
    return CGSizeMake(photosW, photosH);
}

@end
