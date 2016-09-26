//
//  ConfigueAlertView.m
//  LYXAlertView
//
//  Created by 李云祥 on 16/9/26.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "ConfigueAlertView.h"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation ConfigueAlertView
- ( instancetype )initWithFrame:(CGRect)frame withGroupNumber:(NSInteger) num{
    self = [super initWithFrame:frame];
    if (self) {
        
        _alertView = [[UIView alloc] init];
        [self addSubview:_alertView];
        _alertView.layer.cornerRadius = 10.0;
        _alertView.center = self.center;
        _alertView.frame = CGRectMake((ScreenWidth - 243)/2, (ScreenHeight - 164)/2, 243, 164);
        _alertView.backgroundColor = [UIColor whiteColor];
        
        _operateLabel = [[UILabel alloc] init];
        [_alertView addSubview:_operateLabel];
        _operateLabel.text = @"提示";
        _operateLabel.font = [UIFont systemFontOfSize:15 weight:15];
        _operateLabel.textColor = UIColorFromRGB(0x73C0BC);
        _operateLabel.textAlignment = NSTextAlignmentLeft;
        _operateLabel.frame = CGRectMake(9, 1, 233, 30);
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 31, _alertView.bounds.size.width, 1)];
        [_alertView addSubview:lineView];
        lineView.backgroundColor = UIColorFromRGB(0x73C0BC);
        
        _messageLabel = [[UILabel alloc] init];
        [_alertView addSubview:_messageLabel];
        _messageLabel.textColor = UIColorFromRGB(0x666666);
        _messageLabel.font = [UIFont systemFontOfSize:12];
        _messageLabel.text = [NSString stringWithFormat:@"“伴儿服务”非内蒙古移动公司的产品，属第三方供应商提供，若因使用本产品产生的一切责任和后果均与内蒙古移动无关，请客户自行选择。"];
        _messageLabel.textAlignment = NSTextAlignmentLeft;
        _messageLabel.numberOfLines = 0;//最多显示Message行数
        CGRect r = [_messageLabel.text boundingRectWithSize:CGSizeMake(_alertView.frame.size.width - 24, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.f]} context:nil];
        _messageLabel.frame = CGRectMake(12, CGRectGetMaxY(_operateLabel.frame) + 9, _alertView.frame.size.width - 24, r.size.height);
        
        
        _setChatButton = [[UIButton alloc] initWithFrame:CGRectMake(48, CGRectGetMaxY(_messageLabel.frame) + 11 , 20, 20)];
        [_alertView addSubview:_setChatButton];
        [_setChatButton setImage:[UIImage imageNamed:@"矩形-33"] forState:UIControlStateNormal];
        [_setChatButton addTarget:self action:@selector(selectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        _chatLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_setChatButton.frame)+2, CGRectGetMaxY(_messageLabel.frame) + 11 , 169, 20)];
        [_alertView addSubview:_chatLabel];
        _chatLabel.text = @"记住我的选择，下次不再提示";
        _chatLabel.font = [UIFont systemFontOfSize:11];
        _chatLabel.textColor = UIColorFromRGB(0x666666);
        
        //创建中间灰色分割线
        UIView * separateBottomLine = [[UIView alloc] init];
        separateBottomLine.backgroundColor = [UIColor colorWithRed:153.f/255 green:153.f/255 blue:153.f/255 alpha:1];
        [_alertView addSubview:separateBottomLine];
        separateBottomLine.frame = CGRectMake(0, CGRectGetMaxY(_chatLabel.frame) + 12 , _alertView.bounds.size.width, 0.5);
        
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(separateBottomLine.frame)  , _alertView.frame.size.width / 2, 28)];
        [_alertView addSubview:_cancelButton];
        [_cancelButton setTitleColor:[UIColor colorWithRed:16.f/255 green:123.f/255 blue:251.f/255 alpha:1] forState:UIControlStateNormal];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_cancelButton setBackgroundColor:[UIColor whiteColor]];
        _cancelButton.tag = 0;
        [_cancelButton addTarget:self action:@selector(didClickBtnCancel:) forControlEvents:UIControlEventTouchUpInside];
        UIBezierPath *cancelmaskPath = [UIBezierPath bezierPathWithRoundedRect:_cancelButton.bounds byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(10,10)];
        CAShapeLayer *cancelmaskLayer = [[CAShapeLayer alloc] init];
        cancelmaskLayer.frame = _cancelButton.bounds;
        cancelmaskLayer.path = cancelmaskPath.CGPath;
        _cancelButton.layer.mask = cancelmaskLayer;
        
        
        _confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(_alertView.bounds.size.width/2, CGRectGetMaxY(separateBottomLine.frame) , _alertView.frame.size.width / 2, 28)];
        [_alertView addSubview:_confirmButton];
        _confirmButton.tag = 1;
        [_confirmButton setTitleColor:[UIColor colorWithRed:16.f/255 green:123.f/255 blue:251.f/255 alpha:1] forState:UIControlStateNormal];
        [_confirmButton setTitle:@"接受" forState:UIControlStateNormal];
        _confirmButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_confirmButton setBackgroundColor:[UIColor whiteColor]];
        [_confirmButton addTarget:self action:@selector(didClickBtnConfirm:) forControlEvents:UIControlEventTouchUpInside];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_confirmButton.bounds byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(10,10)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _confirmButton.bounds;
        maskLayer.path = maskPath.CGPath;
        _confirmButton.layer.mask = maskLayer;
        //创建中间灰色分割线
        UIView * mLine = [[UIView alloc] init];
        mLine.backgroundColor = [UIColor grayColor];
        [_alertView addSubview:mLine];
        mLine.frame = CGRectMake(_alertView.bounds.size.width / 2,  CGRectGetMaxY(separateBottomLine.frame) + 2, 0.5, 24);
        
        
        
    }
    return self;
    
}


- (void) selectButtonClicked:(UIButton *)btn{
    NSLog(@"记住我的选择");
    btn.selected = !btn.selected;
    if (!btn.selected) {
        [btn setImage:[UIImage imageNamed:@"矩形-33"] forState:UIControlStateNormal];
        
    }else{
        [btn setImage:[UIImage imageNamed:@"矩形-34"] forState:UIControlStateNormal];
    }
}
- (void) didClickBtnCancel:(UIButton *)btn {
    [self.delegate ButtonDidCilckedWithCancleOrConfirm:@"cancle" IsRemberMyChose:NO];
    [_alertView removeFromSuperview];
    [self removeFromSuperview];
}
- (void) didClickBtnConfirm:(UIButton *)btn {
    
    if (_setChatButton.selected) {
        [self.delegate ButtonDidCilckedWithCancleOrConfirm:@"confirm" IsRemberMyChose:YES];
    }else{
        [self.delegate ButtonDidCilckedWithCancleOrConfirm:@"confirm" IsRemberMyChose:NO];
    }
    [_alertView removeFromSuperview];
    [self removeFromSuperview];
}
@end

