//
//  OLStatusBarDemoViewController.h
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 05/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OLStatusView.h"

#import "ExplainingViewController.h"

@interface OLStatusBarDemoViewController : UIViewController <OLStatusViewDelegate, UIAccelerometerDelegate> {
  OLStatusView *statusView;
  
  IBOutlet UIButton *showStatusViewButton;
  IBOutlet UIButton *removeStatusViewButton;
  IBOutlet UIButton *animateShowStatusViewButton;
  IBOutlet UIButton *animateRemoveStatusViewButton;
  
  UIAcceleration *lastAcceleration; 
  BOOL shakeDetected;
  BOOL explainingViewDisplayed;
  NSString *explainingText;
  UIView *explainingView;
}

@property (nonatomic, retain) OLStatusView *statusView;

@property (nonatomic, retain) UIButton *showStatusViewButton;
@property (nonatomic, retain) UIButton *removeStatusViewButton;
@property (nonatomic, retain) UIButton *animateShowStatusViewButton;
@property (nonatomic, retain) UIButton *animateRemoveStatusViewButton;

@property (nonatomic, retain) UIAcceleration *lastAcceleration;
@property (nonatomic, retain) NSString *explainingText;
@property (nonatomic, retain) UIView *explainingView;


// Action management
- (IBAction)showOLStatusView;
- (IBAction)removeOLStatusView;
- (IBAction)animateShowOLStatusView;
- (IBAction)animateRemoveOLStatusView;

- (void)activateShowingButtons;
- (void)activateRemovingButtons;

- (void)activateAllButtons;
- (void)activateButton:(UIButton *)aButton;
- (void)deactivateAllButtons;
- (void)deactivateButton:(UIButton *)aButton;

// Help management
- (void)handleExplainingViewBehavior;
- (void)addExplainingView;
- (void)removeExplainingView;

// View life cycle
- (void)addShakeImageOnBackOfView;

@end
