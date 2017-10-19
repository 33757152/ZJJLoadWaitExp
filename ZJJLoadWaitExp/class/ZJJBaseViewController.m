//
//  ZJJBaseViewController.m
//  ZJJLoadWaitExp
//
//  Created by 张锦江 on 2017/10/19.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import "ZJJBaseViewController.h"
#import "ZJJWarnLabelView.h"

@interface ZJJBaseViewController () {
    UILabel *_tipLabel;
}

@property (nonatomic, strong) UIView *waitView;

@end

@implementation ZJJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatBaseView];
}

- (void)creatBaseView {
    self.waitView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _waitView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UIColor darkGrayColor];
    blackView.center = _waitView.center;
    blackView.bounds = CGRectMake(0, 0, self.view.frame.size.width/3, self.view.frame.size.width/3);
    blackView.layer.cornerRadius = 10.f;
    blackView.clipsToBounds = YES;
    [_waitView addSubview:blackView];
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((blackView.frame.size.width-50)/2, 20, 50, 50)];
    CGAffineTransform transform = CGAffineTransformMakeScale(1.5f, 1.5f);
    activityView.transform = transform;
    activityView.color = [UIColor whiteColor];
    [blackView addSubview:activityView];
    [activityView startAnimating];
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, blackView.frame.size.height-50, blackView.frame.size.width, 45)];
    _tipLabel.backgroundColor = [UIColor clearColor];
    _tipLabel.text = @"加载中...";
    _tipLabel.textColor = [UIColor whiteColor];
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    [blackView addSubview:_tipLabel];
}

- (void)remindWords {
    if (_loadName && ![_loadName isEqualToString:@""]) {
        _tipLabel.text = [NSString stringWithFormat:@"%@...",_loadName];
    }
}

- (void)beginLoading {
    [self remindWords];
    [self endLoading];
    [self.view addSubview:_waitView];
    [self performSelector:@selector(outOfTime) withObject:nil afterDelay:30];
}

- (void)endLoading {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [_waitView removeFromSuperview];
}

- (void)outOfTime {
    [ZJJWarnLabelView warnLabelWithTitle:@"操作超时!"];
    [self endLoading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
