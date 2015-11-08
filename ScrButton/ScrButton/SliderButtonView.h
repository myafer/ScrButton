//
//  SliderButtonView.h
//  ScrButton
//
//  Created by 口贷网 on 15/7/8.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Button_Selected)(NSInteger tag);

@interface SliderButtonView : UIView {
    UIView *_sliderView;
    NSInteger _currentButtonTag;
    CGFloat _buttonWidth;
}

@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong, setter=buttonCo:) UIColor *buttonColor;
@property (nonatomic, assign, setter=currentIndexButton:) NSInteger index;
@property (nonatomic, copy) Button_Selected button_selected_block;

- (instancetype)initWithFrame:(CGRect)frame withButtonNames:(NSArray *)array;
@end
