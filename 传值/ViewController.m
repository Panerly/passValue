//
//  ViewController.m
//  传值
//
//  Created by mac on 16/3/22.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "MyView1.h"
#import "MyView2.h"
#import "MyView3.h"
#import "MyView4.h"
#import "MyView5.h"

@interface ViewController ()<MVCdelegate>
{
    MyView1 *MV1;
    MyView5 *MVC5;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _label.backgroundColor = [UIColor orangeColor];
    _label.clipsToBounds = YES;
    _label.layer.cornerRadius = 10.0;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)attrPass:(id)sender {
    MV1 = [[MyView1 alloc] initWithFrame:self.view.frame];
    [self.view addSubview:MV1];
    
    self.label.text = MV1.str;
}


- (IBAction)blockPass:(id)sender {
    MyView2 *MVC2 = [[MyView2 alloc] initWithFrame:self.view.frame];
    [self.view addSubview:MVC2];
    
        __weak typeof(MVC2) weakMVC2 = MVC2;
        MVC2.block = ^(){
        return weakMVC2.textView.text;
       };
}

- (IBAction)delegatePass:(id)sender {
    MyView3 *MVC3 = [[MyView3 alloc] initWithFrame:self.view.frame];
    MVC3.delegate = self;
    [self.view addSubview:MVC3];
}
- (void)passText:(NSString *)text
{
    self.label.text = text;
}

- (IBAction)notiPass:(id)sender {
    
    MyView4 *MVC4 = [[MyView4 alloc] initWithFrame:self.view.frame];
    [self.view addSubview:MVC4];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiAct:) name:@"noti" object:nil];
}

- (IBAction)kvoPass:(id)sender {
    MVC5 = [[MyView5 alloc] initWithFrame:self.view.frame];
    [self.view addSubview:MVC5];
    [MVC5 addObserver:self forKeyPath:@"str" options:NSKeyValueObservingOptionNew context:nil];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@", change);
    
    _label.text = change[@"new"];
}

- (void)notiAct:(NSNotification *)noti
{
    self.label.text = [noti.object valueForKey:@"str"];
}

- (void)dealloc
{
    [MVC5 removeObserver:self forKeyPath:@"str"];
}

@end
