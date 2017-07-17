//
//  ZJBLTimerButton.m
//  ZJBL-SJ
//
//  Created by 郭军 on 2017/4/20.
//  Copyright © 2017年 ZJNY. All rights reserved.
//

#import "ZJBLTimerButton.h"
#define KTime   60 //设置重新发送的时间  自己可以改



@interface ZJBLTimerButton () {
    NSTimer *_myTimer;//定时器
}

@property (nonatomic,assign) NSInteger timer;


@end


@implementation ZJBLTimerButton




- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
       
        _timer = KTime;


        
//        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
//        [self.titleLabel setFont:[UIFont systemFontOfSize:14]];
//        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [self addTarget:self action:@selector(sentCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.enabled = YES;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        self.timeLabel.text = @"获取验证码";
        self.timeLabel.font = [UIFont systemFontOfSize:13];
        self.timeLabel.textColor = [UIColor whiteColor];
        
        [self refreshButtonView];

        
    }
    
    return self;
}



- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel  = [[UILabel alloc]initWithFrame:self.bounds];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_timeLabel];
    }
    
    return _timeLabel;
}



- (void)awakeFromNib{
    [super awakeFromNib];
    _timer = KTime;
    
    
    [self setBackgroundImage:[self imageWithColor:UIColorWithRGBA(255, 205, 70, 1) andSize:self.frame.size] forState:UIControlStateNormal];
    [self setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor] andSize:self.frame.size] forState:UIControlStateDisabled];
    [self reset];
    
   
}





- (void)reset{
    self.timeLabel.text = @"获取验证码";
    self.timeLabel.font = [UIFont systemFontOfSize:13];
    self.timeLabel.textColor = [UIColor whiteColor];
    
    self.enabled = YES;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    if (_myTimer) {
        [_myTimer invalidate];
        _myTimer = nil;
        _timer = KTime;
    }
    
}




-(void)setSecond:(int)second{
    _second = second;
    _timer = _second;
}




- (void)start{
    //获取验证码
    self.enabled = NO;
    self.timeLabel.text = [NSString stringWithFormat:@"获取验证码(%zi)", _timer];
    _myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(myTimer) userInfo:nil repeats:YES];
}




- (void)myTimer{
   self.timeLabel.text = [NSString stringWithFormat:@"获取验证码(%zi)", _timer];
    if (_timer == 0) {
        self.timeLabel.text = [NSString stringWithFormat:@"重新获取"];
       
        [self reset];
    }else{
        _timer --;
    }
    
}

- (void)refreshButtonView{
    [self setBackgroundImage:[self imageWithColor:UIColorWithRGBA(255, 205, 70, 1) andSize:self.frame.size] forState:UIControlStateNormal];
    [self setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor] andSize:self.frame.size] forState:UIControlStateDisabled];
}


- (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)aSize{
    CGRect rect = CGRectMake(0.0f, 0.0f, aSize.width, aSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
