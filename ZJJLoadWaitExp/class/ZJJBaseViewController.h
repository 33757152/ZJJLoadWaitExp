//
//  ZJJBaseViewController.h
//  ZJJLoadWaitExp
//
//  Created by 张锦江 on 2017/10/19.
//  Copyright © 2017年 ZJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJJBaseViewController : UIViewController

- (void)beginLoading;

- (void)endLoading;

@property (nonatomic, copy) NSString *loadName;

@end
