//
//  OLStatusBarDemoAppDelegate.h
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 05/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OLStatusBarDemoViewController;

@interface OLStatusBarDemoAppDelegate : NSObject <UIApplicationDelegate> {
  
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet OLStatusBarDemoViewController *viewController;

- (UITabBarController *)createTabBarController;
- (NSArray *)createViewControllers;

@end
