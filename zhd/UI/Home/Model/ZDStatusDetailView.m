//
//  ZDStatusDetailView.m
//  zhd
//
//  Created by luoyidong on 15/12/8.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatusDetailView.h"
#import "ZDStatusOriginalView.h"



@interface ZDStatusDetailView()

@property (nonatomic,assign) ZDStatusOriginalView *originalView;

@end

@implementation ZDStatusDetailView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame]; 
    if (self) {
        self.image = [UIImage resizableImageWithName:@"timeline_card_top_background"];
        self.highlightedImage = [UIImage resizableImageWithName:@"timeline_card_top_background_highlighted"];
        self.opaque = YES;
        //添加原创微博
        [self  setupOriginalView];
        
        self.userInteractionEnabled = YES;
        
        
    }
    return self;
}

-(void)setupOriginalView
{
    ZDStatusOriginalView *originalView = [[ZDStatusOriginalView alloc] init];
    [self addSubview:originalView];
    self.originalView = originalView;
}

-(void)setDetailFrame:(ZDStatusDetailFrame *)detailFrame
{
    _detailFrame = detailFrame;
    self.frame = detailFrame.frame;
    
    //原创微博的fram数据
    self.originalView.originalFrame = detailFrame.originalFrame;
}

@end
