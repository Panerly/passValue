//
//  MyView2.h
//  传值
//
//  Created by mac on 16/3/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NSString *(^MyBlock)();

@interface MyView2 : UIView
@property (nonatomic, copy) UITextView *textView;
@property (nonatomic, strong) MyBlock block;

@end
