//
//  ViewController.m
//  LYXAlertView
//
//  Created by 李云祥 on 16/9/26.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "ViewController.h"
#import "ConfigueAlertView.h"
@interface ViewController ()<configueButtonClickDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)buttonClick:(id)sender
{
    NSUserDefaults *choser = [NSUserDefaults standardUserDefaults];
    NSString *myChose = [ choser objectForKey:@"userChose"];
    if (![myChose isEqualToString:@"remember"]) {
        ConfigueAlertView *alertView = [[ConfigueAlertView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)withGroupNumber:10];
        alertView.delegate = self;
        alertView.backgroundColor = [UIColor colorWithRed:10.f/255 green:10.f/255 blue:10.f/255 alpha:0.7];
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
        //    [self.view.window addSubview:alertView];
        
    }

}

-(void)ButtonDidCilckedWithCancleOrConfirm:(NSString *)states IsRemberMyChose:(BOOL)myChose
{
    NSLog(@"%d",myChose);
 
    if ([states isEqualToString:@"cancle"]) {
        //点击取消按钮
       
    }else
    {
        //点击确定按钮  根据存储的内容对以后是否显示该控件进行判断
        if (myChose == YES) {
            //记住我的选择
            //将NSString 对象存储到 NSUserDefaults 中
            NSString *remember = @"remember";
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user setObject:remember forKey:@"userChose"];
        }else
        {
            
        }
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
