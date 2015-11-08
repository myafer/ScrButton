//
//  SliderScrollView.m
//  ScrButton
//
//  Created by 口贷网 on 15/7/8.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "SliderScrollView.h"

@implementation SliderScrollView

- (instancetype)initWithFrame:(CGRect)frame withViewArray:(NSArray *)viewArray
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat selfWidth = frame.size.width;
        CGFloat selfHeight = frame.size.height;
        NSInteger count = viewArray.count;
        _scr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight)];
        _scr.contentSize = CGSizeMake(selfWidth * count, selfHeight);
        _scr.pagingEnabled = YES;
        _scr.delegate = self;
        int i = 0;
        for (UIView *view in viewArray) {
            view.frame = CGRectMake(i * selfWidth, 0, selfWidth, selfHeight);
            [_scr addSubview:view];
            i ++;
        }
        [self addSubview:_scr];
        
    }
    return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / self.frame.size.width;
    if (self.get_Index_Block) {
        self.get_Index_Block(index);
    }
}




@end
