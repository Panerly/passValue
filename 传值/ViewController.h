//
//  ViewController.h
//  传值
//
//  Created by mac on 16/3/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef NSString *(^MyBlock)();
@interface ViewController : UIViewController


//@property (nonatomic, strong) MyBlock block;
@property (strong, nonatomic) IBOutlet UILabel *label;
- (IBAction)attrPass:(id)sender;
- (IBAction)blockPass:(id)sender;
- (IBAction)delegatePass:(id)sender;
- (IBAction)notiPass:(id)sender;
- (IBAction)kvoPass:(id)sender;

@end

