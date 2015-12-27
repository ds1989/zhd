//
//  TabViewUCViewPager.h
//  zhd
//
//  Created by luoyidong on 15/11/7.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectedBlock)(id viewPager,NSInteger index);

@interface TabViewUCViewPager : UIView<UIScrollViewDelegate>
{
    NSArray *_titleArray;       /**菜单标题**/
    NSArray *_views;            /**视图**/
    NSArray *_titleIcons;       /**菜单标题左侧的小图标**/
    NSArray *_selectedIcons;    /**菜单选中时左侧的小图标**/
    NSArray *_tipsCountArray;   /**菜单右上角的小红点显示的数量 */
}
@property (nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UIView *pageControl;

/**
 * 设置viewpager是否允许滚动，默认支持
 */
@property (nonatomic,assign) BOOL enabledScroll;

/**
 * 当前选择的菜单索引
 */
@property (nonatomic,assign) NSInteger selectIndex;

/**
 * 菜单按钮的背景
 */
@property (nonatomic,strong) UIColor *tabBgColor;
@property (nonatomic,strong) UIColor *tabSelectedBgColor;

/**
 * 菜单按钮下方黑星背景属性
 */
@property (nonatomic,strong) UIColor *tabArrowBgColor;
@property (nonatomic,strong) UIColor *tabSelectedArrowBgColor;

/**
 *  菜单按钮的标题颜色属性
 */
@property (nonatomic,strong) UIColor *tabTitleColor;
@property (nonatomic,strong) UIColor *tabSelectedTitleColor;

/**
 *  是否显示垂直分割线  默认显示
 */

@property (nonatomic,assign) BOOL showVLine;

/**
 *  是否显示底部横线  默认显示
 */
@property(nonatomic,assign) BOOL showBottomLine;
/**
 *  选中状态是否显示底部横线  默认显示
 */
@property(nonatomic,assign) BOOL showSelectedBottomLine;



/**
 *  是否显示垂直分割线  默认显示
 */
@property (nonatomic, assign) BOOL showAnimation;


/**
 * 初始化 TabViewUCViewPager 的方法
 *  @param frame frame
 *  @param titles 标题数组
 *  @param views 视图数组  和标题数组--对应
 * 
 *  @return UIViewUCViewPager
 */
-(id)initWithFrame:(CGRect)frame
            titles:(NSArray<NSString *> *)titles
             views:(NSArray<__kindof UIView *> *)views;


-(void)setSelectIndex:(NSInteger)selectIndex;

-(void)didSelectedBlock:(SelectedBlock)block;

#pragma mark    - version 2.0
/**
 * 初始化 TabViewUCViewPager 的方法
 *  @param frame frame
 *  @param titles 标题数组
 *  @param selectedIcons 标题右侧选中时的图标数组
 *  @param views 视图数组  和标题数组--对应
 *
 *  @return UIViewUCViewPager
 */
-(id)initWithFrame:(CGRect)frame
             titles:(NSArray<NSString *> *)titles
              icons:(NSArray<UIImage *> *)icons
      selectedIcons:(NSArray<UIImage *> *)selectedIcons
              views:(NSArray<__kindof UIView *> *)views;
/**
 *  设置菜单标题左边的icon 图标
 *
 *  @param icons 图标image
 *  @param selectedIcons 菜单被选中时显示的图标image
 */
-(void)setTitleIconsArray:(NSArray<UIImage *> *)icons
       selectedIconsArray:(NSArray<UIImage *>*)selectedIconsArray;

/**
 *  设置菜单右上角小红点显示的文字，数组需与菜单一一对应，数字为0时 赋值 @0或@""
 *
 *  @param tips 小红点上的文字
 */
-(void)setTipsCountArray:(NSArray *)tips;
@end
