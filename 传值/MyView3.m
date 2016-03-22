//
//  MyView3.m
//  传值
//
//  Created by mac on 16/3/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MyView3.h"

@implementation MyView3


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(20, 100, self.frame.size.width - 40, self.frame.size.height - 400);
        self.backgroundColor = [UIColor orangeColor];
        [self _textField];
    }
    return self;
}

- (void)_textField
{
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 60)];
    _textView.backgroundColor = [UIColor cyanColor];
    [self addSubview:_textView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.center.x-50, self.frame.size.height-30, 50, 20)];
    btn.backgroundColor = [UIColor redColor];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(dissMiss) forControlEvents:UIControlEventTouchUpInside];
}
- (void)dissMiss
{
    if ([self.delegate respondsToSelector:@selector(passText:)]) {
        [self.delegate passText:_textView.text];
    }
    [UIView animateWithDuration:.25 animations:^{
        self.transform = CGAffineTransformMakeScale(.01, .01);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
