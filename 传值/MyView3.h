//
//  MyView3.h
//  传值
//
//  Created by mac on 16/3/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MVCdelegate<NSObject>

- (void)passText:(NSString *)text;

@end

@interface MyView3 : UIView

@property (nonatomic, copy) UITextView *textView;
@property (nonatomic, weak)id<MVCdelegate>delegate;

@end
