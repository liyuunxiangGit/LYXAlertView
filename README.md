# LYXAlertView
`您的star是我前进的动力，如果觉得好的话请您给个star吧！谢谢。。。`

![image](https://github.com/liyuunxiangGit/LYXAlertView/blob/master/111.gif)
###下方层次关系
![image](https://github.com/liyuunxiangGit/LYXAlertView/blob/master/屏幕快照%202016-09-26%2011.52.19.png)
##主要代码

用法：
将封装的View导入。然后按照demo中的写就可以。

下方主要使用代码：
这是添加的方法：
```java  
  
ConfigueAlertView *alertView = [[ConfigueAlertView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)withGroupNumber:10];
       alertView.delegate = self;
       alertView.backgroundColor = [UIColor colorWithRed:10.f/255 green:10.f/255 blue:10.f/255 alpha:0.7];
       [[UIApplication sharedApplication].keyWindow addSubview:alertView];
  
```
这是点击按钮的代理方法：
```java  
  
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
  
```
