//
//  TabViewUCViewPager.m
//  zhd
//
//  Created by luoyidong on 15/11/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "TabViewUCViewPager.h"

@implementation TabViewUCViewPager
{
    SelectedBlock _block;
    NSInteger _pageNum;
}

-(id)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles views:(NSArray<__kindof UIView *> *)views
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _views = views;
        _titleArray = titles;
        self.backgroundColor = [UIColor grayColor];
        
    }
    return self;
    
}

-(void)configSelf
{
    self.userInteractionEnabled = YES;
    _tabBgColor = [UIColor whiteColor];
    _tabArrowBgColor = [UIColor colorWithRed:204/255.0 green:(208/255.0) blue:210/225.0 alpha:1];
    _tabTitleColor = [UIColor colorWithRed:12/255.0 green:134/255.0 blue:247/255.0 alpha:1];
    _tabSelectedBgColor = [UIColor whiteColor];
    _tabSelectedTitleColor = [UIColor colorWithRed:12/255.0 green:134/255.0 blue:237/255.0 alpha:1];
    _tabSelectedArrowBgColor =[UIColor colorWithRed:12/255.0 green:134/255.0 blue:237/255.0 alpha:1];
    _showVLine = YES;
    _showAnimation = YES;
    _showBottomLine = YES;
    _showSelectedBottomLine = YES;
    _enabledScroll = YES;
}

//视图重构
-(void)drawRect:(CGRect)rect
{
    //drawing code
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 2, rect.size.width, rect.size.height-2)];
    _scrollView.userInteractionEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.backgroundColor = [UIColor whiteColor];
    CGRect frame;
    frame.origin.y = 38;
    frame.size.height = _scrollView.frame.size.height - 40;
    frame.size.width = rect.size.width;
    
    _pageControl = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 40)];
    _pageNum = _views.count;
    _pageControl.backgroundColor = [UIColor whiteColor];
    
    
    //创建菜单按钮下划线
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(9, _pageControl.frame.size.height -1, _pageControl.frame.size.width, 1)];
    label.backgroundColor = _tabArrowBgColor;
    label.tag = 220;
    
    UILabel *selectedLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _pageControl.frame.size.height -3, _pageControl.frame.size.width/_pageNum, 3)];
    selectedLabel.backgroundColor = _tabSelectedArrowBgColor;
    selectedLabel.tag = 300;
    
    if(!_showBottomLine)
    {
        CGRect labelFrame = label.frame;
        labelFrame.size.height = 0;
        label.frame = frame;
    }
    
    if (!_showSelectedBottomLine) {
        CGRect selectedFrame = selectedLabel.frame;
        selectedFrame.size.height = 0;
        selectedLabel.frame = selectedFrame;
    }
    
    for (NSInteger i=0; i<_views.count; i++) {
        //创建主视图
        UIView *view = [_views objectAtIndex:i];
        frame.origin.x = rect.size.width *i;
        [view   setFrame:frame];
        [_scrollView addSubview:view];
        
        CGRect _pageframe = _pageControl.frame;
        _pageframe.size.width = rect.size.width/_pageNum;
        _pageframe.origin.x = _pageframe.size.width *i;
        
        //创建菜单按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:_pageframe];
        button.tag = 100+i;
        [button setTitleColor:_tabTitleColor forState:UIControlStateNormal];
        [button setTitleColor:_tabSelectedTitleColor forState:UIControlStateSelected];
        [button setBackgroundColor:_tabBgColor];
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(tabBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        
        if(_titleIcons.count)
        {
            [button setImage:_titleIcons[i] forState:UIControlStateNormal];
        }
        
        if(_selectedIcons.count)
        {
            [button  setImage:_selectedIcons[i] forState:UIControlStateSelected];
            
        }
        
        //创建菜单按钮右上角的小红点
        UILabel *circleLabel = [[UILabel alloc] initWithFrame:CGRectMake([self getLabelWith:_titleArray[i] fontSize:15]/2 + button.titleLabel.frame.origin.x, 2, 16, 16)];
        
        circleLabel.backgroundColor = [UIColor redColor];
        circleLabel.textColor = [UIColor whiteColor];
        circleLabel.font    = [UIFont systemFontOfSize:12];
        circleLabel.textAlignment = NSTextAlignmentCenter;
        circleLabel.tag = 600+i;
        circleLabel.layer.cornerRadius = 8;
        circleLabel.layer.masksToBounds = YES;
        circleLabel.clipsToBounds = YES;
        
        if (_tipsCountArray==nil ||_tipsCountArray.count==0) {
            circleLabel.hidden = YES;
        }else if([_tipsCountArray[i] integerValue]==0)
        {
            circleLabel.hidden = YES;
        }
        else
        {
            circleLabel.hidden = NO;
            circleLabel.text = [_tipsCountArray[i] integerValue]>99?@"99+":[NSString stringWithFormat:@"%@",_tipsCountArray[i]];
            CGPoint center = circleLabel.center;
            CGRect cFrame  = circleLabel.frame;
            cFrame.size.width = [self getLabelWith:circleLabel.text fontSize:12]+6>16?[self getLabelWith:circleLabel.text fontSize:12]+6:16;
            
            circleLabel.frame = cFrame;
            circleLabel.center = center;
        }
        
        if (_showVLine) {
            //创建中间分割线
            UILabel *vlabel = [[UILabel alloc] initWithFrame:CGRectMake(-1, 10, 1, button.frame.size.height - 20)];
            vlabel.backgroundColor = _tabArrowBgColor;
            [button addSubview:vlabel];
            if (!i) {
                vlabel.hidden = YES;
            }
        }
        if(!i)
        {
            button.selected = YES;
        }
        if(button.selected)
        {
            [UIView animateWithDuration:0.3 animations:^{
                CGRect sframe = selectedLabel.frame;
                sframe.origin.x = button.frame.origin.x;
                selectedLabel.frame = sframe;
                [button setBackgroundColor:_tabSelectedBgColor];
            }];
        }
        [button addSubview:circleLabel];
        [_pageControl addSubview:button];
    }
    [_pageControl addSubview:label];
    [_pageControl addSubview:selectedLabel];
    
    if(_pageNum ==1)
    {
        _pageControl.hidden = YES;
    }
    
    if(_enabledScroll)
    {
        [_scrollView setContentSize:CGSizeMake(rect.size.width*_views.count+1, rect.size.height-2)];
    }else
    {
        [_scrollView setContentSize:CGSizeZero];
    }
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];
    
}

//按钮点击事件
-(void)tabBtnClicked:(UIButton *)sender
{
    NSInteger index = sender.tag -100;
    if(_showAnimation)
    {
        [UIView beginAnimations:@"navTab" context:nil];
        [UIView setAnimationDuration:0.3];
        [self setSelectIndex:index];
        _scrollView.contentOffset = CGPointMake(index*self.frame.size.width,0);
        [UIView commitAnimations];
    }else
    {
        [self setSelectIndex:index];
        _scrollView.contentOffset = CGPointMake(index*self.frame.size.width, 0);
    }
}

-(void)setSelectIndex:(NSInteger)selectIndex
{
    if(_block)
    {
        _block(self,selectIndex);
    
    }
    _selectIndex = selectIndex;
    for (NSInteger i=0; i<_pageNum; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:i+100];
        btn.backgroundColor = _tabBgColor;
        btn.selected = NO;
    }
    
    UIButton *btn = (UIButton *)[self viewWithTag:selectIndex+100];
    UILabel *selectedLabel = (UILabel *)[_pageControl viewWithTag:300];
    btn.backgroundColor = _tabSelectedBgColor;
    btn.selected = YES;
    
    if (_showAnimation)
    {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = selectedLabel.frame;
            frame.origin.x = btn.frame.origin.x;
            selectedLabel.frame = frame;
        }];
    }else
    {
        CGRect frame = selectedLabel.frame;
        frame.origin.x = btn.frame.origin.x;
        selectedLabel.frame = frame;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/self.frame.size.width;
    [self setSelectIndex:index];
}

-(void)setTabSelectedBgColor:(UIColor *)tabSelectedBgColor
{
    _tabSelectedBgColor = tabSelectedBgColor;
    [self setNeedsDisplay];
}
-(void)didSelectedBlock:(SelectedBlock)block
{
    _block = block;
}


- (NSInteger)getLabelWith:(NSString *)string fontSize:(CGFloat)size
{
    CGSize stringSize = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]}];
    CGFloat width = stringSize.width;
    return width;
}

#pragma mark -version 2.0

-(id) initWithFrame:(CGRect)frame
             titles:(NSArray<NSString *> *)titles
              icons:(NSArray<UIImage *> *)icons
      selectedIcons:(NSArray<UIImage *> *)selectedIcons
              views:(NSArray<__kindof UIView *> *)views
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _views = views;
        _titleArray = titles;
        _titleIcons = icons;
        _selectedIcons = selectedIcons;
        self.backgroundColor = [UIColor grayColor];
        [self configSelf];
        
    }
    return self;
}

//设置菜单标题右上角小红点显示的数字
-(void)setTipsCountArray:(NSArray *)tips
{
    _tipsCountArray = tips;
    [self setNeedsDisplay];
}

@end
