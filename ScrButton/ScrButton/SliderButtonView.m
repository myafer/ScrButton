//
//  SliderButtonView.m
//  ScrButton
//
//  Created by 口贷网 on 15/7/8.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "SliderButtonView.h"
#define SELECTED_COLOR [UIColor colorWithRed:0.147 green:0.614 blue:1.000 alpha:1.000]

@implementation SliderButtonView

- (instancetype)initWithFrame:(CGRect)frame withButtonNames:(NSArray *)array{
    self = [super initWithFrame:frame];
    if (self) {
        _buttonArray = [NSMutableArray array];
        self.backgroundColor = [UIColor colorWithRed:1.000 green:0.990 blue:0.855 alpha:1.000];
        
        self.backgroundColor = [UIColor redColor];
        NSInteger count = array.count;
        CGFloat selfWidth = frame.size.width;
        CGFloat selfHeight = frame.size.height;
        CGFloat buttonWidth = selfWidth / (count * 1.0);
        
        for (int i = 0; i < array.count; i ++) {
            UIButton *bu = [UIButton buttonWithType:(UIButtonTypeCustom)];
            bu.frame = CGRectMake(i * buttonWidth, 0, buttonWidth, frame.size.height - 3);
            [bu setTitle:array[i] forState:(UIControlStateNormal)];
            [bu addTarget:self action:@selector(buttonPressed:) forControlEvents:(UIControlEventTouchUpInside)];
            [bu setTitleColor:[UIColor colorWithWhite:0.326 alpha:1.000] forState:(UIControlStateNormal)];
            [bu setTitleColor:SELECTED_COLOR forState:(UIControlStateSelected)];
            bu.tag = 1000 + i;
            [self addSubview:bu];
            bu.selected = i == 0 ? YES : NO;
            bu.titleLabel.font = [UIFont boldSystemFontOfSize:15];
            [_buttonArray addObject:bu];
        }
        UIView *grayLineView = [[UIView alloc] initWithFrame:CGRectMake(0, selfHeight - 1, selfWidth, 0.5)];
        grayLineView.backgroundColor = [UIColor colorWithRed: 201 / 255.0 green:201 / 255.0 blue:201 / 255.0 alpha:1.0];
        [self addSubview:grayLineView];
        
        _sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, selfHeight - 3, buttonWidth, 2)];
        _sliderView.backgroundColor = SELECTED_COLOR;
        [self addSubview:_sliderView];
        _currentButtonTag = 0;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)buttonPressed:(UIButton *)sender {
    if (sender.selected == YES) {
        return;
    }
    for (UIButton *bu in _buttonArray) {
        bu.selected = NO;
    }
    NSInteger tag = sender.tag - 1000;
    sender.selected = YES;
    [UIView animateWithDuration:labs(_currentButtonTag - tag) * 0.2 animations:^{
        _sliderView.frame = CGRectMake(tag * sender.frame.size.width, sender.frame.size.height, sender.frame.size.width, 2);
        
    }];
    if (self.button_selected_block) {
        self.button_selected_block(tag);
    }
    
    _currentButtonTag = tag;
}

- (void)buttonCo:(UIColor *)buttonColor {
    for (UIButton *bu in _buttonArray) {
        [bu setBackgroundColor:buttonColor];
    }
}

- (void)currentIndexButton:(NSInteger)index {
    for (NSInteger i = 0; i < _buttonArray.count; i ++) {
        UIButton *bu = _buttonArray[i];
        bu.selected = NO;
        if (i == index) {
            [self buttonPressed:bu];
        }
    }
}


@end
