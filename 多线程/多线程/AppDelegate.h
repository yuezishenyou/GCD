//
//  AppDelegate.h
//  多线程
//
//  Created by maoziyue on 16/11/6.
//  Copyright © 2016年 maoziyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (assign, nonatomic) UIBackgroundTaskIdentifier backgroundUpdateTask;

@end

