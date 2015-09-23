//
//  AppDelegate.h
//  WordList
//
//  Created by Powers, Patrick (US - Orlando) on 9/23/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Persistence;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Persistence *persistence;

@end

