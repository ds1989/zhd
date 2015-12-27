//
//  ZDStatusLabel.m
//  zhd
//
//  Created by luoyidong on 15/12/10.
//  Copyright © 2015年 robbert. All rights reserved.
//

#import "ZDStatusLabel.h"
#import "ZDLink.h"


#define ZDLinkBacngroundTag 100

@interface ZDStatusLabel()

@property (nonatomic,assign) UITextView *textView;
@property (nonatomic,strong) NSMutableArray *links;

@end

@implementation ZDStatusLabel

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITextView *textView = [[UITextView alloc] init];
        textView.editable = NO;
        textView.scrollEnabled=NO;
        textView.userInteractionEnabled = NO;
        
        //设置文字的内边框
        textView.textContainerInset = UIEdgeInsetsMake(0, -5, 0, -5);
        textView.backgroundColor = [UIColor clearColor];
        
        self.textView = textView;
        [self addSubview:textView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.textView.frame = self.bounds;
}


-(void)setAttributeText:(NSAttributedString *)attributeText
{
    _attributeText = attributeText;
    self.textView.attributedText = attributeText;
    self.links = nil;
}

/**
 *
 * 懒加载数据：主要提升性能问题
 *
 * @return 返回所有
*/

-(NSMutableArray *) links
{
    if (!_links) {
        NSMutableArray *links = [NSMutableArray array];
        
        //搜索所有的链接
        
        [self.attributeText enumerateAttributesInRange:NSMakeRange(0, self.attributeText.length) options:0 usingBlock:^(NSDictionary *attrs,NSRange range,BOOL *stop){
            NSString *linkText = attrs[DSLinkAttr];
            
            if (linkText ==nil) return;
            
            //创建一个链接
            ZDLink *link = [[ZDLink alloc] init];
            link.text = linkText;
            link.range = range;
            
            //处理矩形框
            NSMutableArray *rects = [NSMutableArray array];
            //设置选中的字符范围
            self.textView.selectedRange = range;
            //算出选中的字符范文的边框
            NSArray *selectionRects = [self.textView selectionRectsForRange:self.textView.selectedTextRange];
            for (UITextSelectionRect *selectionRect in selectionRects) {
                [rects addObject:selectionRect];
            }
            
            self.links = links;
            
        }];
    }
    return _links;
}

@end
