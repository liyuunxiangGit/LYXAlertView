//
//  ConfigueAlertView.h
//  LYXAlertView
//
//  Created by 李云祥 on 16/9/26.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@protocol  configueButtonClickDelegate <NSObject>

/**
 *  点击按钮触发事件
 *
 *  @param states  点击的按钮是取消还是接受
 *  @param myChose 是否选择小方框
 */
-(void)ButtonDidCilckedWithCancleOrConfirm:(NSString *)states IsRemberMyChose:(BOOL) myChose ;

@end

@interface ConfigueAlertView : UIView



/* 创建提示框View */
@property (nonatomic, strong) UIView *alertView;
/* 提示Label */
@property (nonatomic,strong) UILabel *operateLabel;

@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIFont  *titleFont;

/* 消息Label */
@property (nonatomic,strong) UILabel *messageLabel;

@property (nonatomic,strong) UIColor *msgColor;
@property (nonatomic,strong) UIFont  *msgFont;
/* 发起聊天按钮 */
@property (nonatomic,strong) UIButton *setChatButton;
/* 发起聊天Label */
@property (nonatomic,strong) UILabel *chatLabel;
/* 取消按钮 */
@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIColor  *cancelColor;

/* 确定 */
@property (nonatomic,strong) UIButton *confirmButton;
@property (nonatomic,strong) UIColor  *confirmColor;

@property (nonatomic,retain) id <configueButtonClickDelegate> delegate;



- ( instancetype )initWithFrame:(CGRect)frame withGroupNumber:(NSInteger) num;


@end

