//
//  OLStatusBarDemoAppDelegate.m
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 05/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "OLStatusBarDemoAppDelegate.h"

#import "OLStatusBarDemoViewController.h"
#import "OLStatusBarDemoUpToDownViewController.h"
#import "OLStatusBarDemoDownToUpViewController.h"
#import "OLStatusBarDemoDownToUpWithIconViewController.h"
#import "OLStatusBarDemoDownToUpWithSpinnerViewController.h"
#import "OLStatusBarDemoDownToUpWithInfoLabelViewController.h"
#import "OLStatusBarDemoChangeColorViewController.h"

@implementation OLStatusBarDemoAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;

#pragma mark -
#pragma mark Object creation management

- (UITabBarController *)createTabBarController{
  
  UITabBarController *tabBarController = [[UITabBarController alloc] init];
  [tabBarController setViewControllers:[self createViewControllers]];
  
  return [tabBarController autorelease];
}

- (NSArray *)createViewControllers{
  // Override point for customization after application launch.
  OLStatusBarDemoUpToDownViewController *upToDownDemoViewController = [[OLStatusBarDemoUpToDownViewController alloc] initWithNibName:@"OLStatusBarDemoUpToDownViewController" bundle:nil];
  OLStatusBarDemoDownToUpViewController *downToUpViewController = [[OLStatusBarDemoDownToUpViewController alloc] initWithNibName:@"OLStatusBarDemoDownToUpViewController" bundle:nil];
  OLStatusBarDemoDownToUpWithIconViewController *downToUpWithIconViewController = [[OLStatusBarDemoDownToUpWithIconViewController alloc] initWithNibName:@"OLStatusBarDemoDownToUpWithIconViewController" bundle:nil];
  OLStatusBarDemoDownToUpWithSpinnerViewController *downToUpWithSpinnerViewController = [[OLStatusBarDemoDownToUpWithSpinnerViewController alloc] initWithNibName:@"OLStatusBarDemoDownToUpWithSpinnerViewController" bundle:nil];
  OLStatusBarDemoDownToUpWithInfoLabelViewController *downToUpWithInfoLabelViewController = [[OLStatusBarDemoDownToUpWithInfoLabelViewController alloc] initWithNibName:@"OLStatusBarDemoDownToUpWithInfoLabelViewController" bundle:nil];
  OLStatusBarDemoChangeColorViewController *changeColorViewController = [[OLStatusBarDemoChangeColorViewController alloc] initWithNibName:@"OLStatusBarDemoChangeColorViewController" bundle:nil];
  
  
  NSArray *views = [[NSArray alloc] initWithObjects:upToDownDemoViewController, downToUpViewController, downToUpWithIconViewController, downToUpWithSpinnerViewController, downToUpWithInfoLabelViewController, changeColorViewController, nil];
  
  return [views autorelease];
}


#pragma mark -
#pragma mark Application action management

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // [tabBarController setToolbarItems:[NSArray arrayWithObjects:@"Up to Down", @"Down to Up", nil]];
  
  // self.window.rootViewController = self.viewController;
  self.window.rootViewController = [self createTabBarController];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

- (void)dealloc
{
  [_window release];
  [_viewController release];
    [super dealloc];
}

@end
