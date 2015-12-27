//
//  ZDStatusPhotosView.h
//  zhd
//
//  Created by luoyidong on 15/12/10.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDStatusPhotosView : UIImageView

@property (nonatomic,strong) NSArray *picUrls;

//根据图片个数计算尺寸
+(CGSize) sizeWithPhotosCount:(int) photoCount;

@end
