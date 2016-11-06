//
//  ViewController.m
//  多线程
//
//  Created by maoziyue on 16/11/6.
//  Copyright © 2016年 maoziyue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    dispatch_queue_t queue = dispatch_queue_create( "queue", DISPATCH_QUEUE_CONCURRENT);
    
    
}


//延时操作
- (void)after
{
    [self performSelector:@selector(afterAction) withObject:nil afterDelay:2.0];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
}

- (void)afterAction
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //只执行一次；
    });
}



//队列组  异步执行耗时操作，然后在回到主线程执行操作

- (void)group
{
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //执行1个耗时异步操作
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //执行2个耗时异步操作
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        //等待前面的异步操作都执行完毕后，回到主线程。。。
    });
    
}









































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
