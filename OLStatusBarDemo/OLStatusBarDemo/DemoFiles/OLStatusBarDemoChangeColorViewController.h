//
//  OLStatusBarDemoChangeColorViewController.h
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 05/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OLStatusBarDemoViewController.h"

@interface OLStatusBarDemoChangeColorViewController : OLStatusBarDemoViewController {
  NSArray *colors;
  
  IBOutlet UIButton *changeBackgroundColorButton;
  IBOutlet UIButton *changeTextColorButton;
  IBOutlet UIButton *changeLineColorButton;
}

@property (nonatomic, retain) UIButton *changeBackgroundColorButton;
@property (nonatomic, retain) UIButton *changeTextColorButton;
@property (nonatomic, retain) UIButton *changeLineColorButton;


- (IBAction)changeLineColor;
- (IBAction)changeBackgroundColor;

@end
