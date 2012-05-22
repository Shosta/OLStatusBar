//
//  OLStatusBarDemoViewController.m
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 05/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "OLStatusBarDemoViewController.h"
#import "UILabel+Size.h"

@implementation OLStatusBarDemoViewController

@synthesize statusView;

@synthesize showStatusViewButton;
@synthesize removeStatusViewButton;
@synthesize animateShowStatusViewButton;
@synthesize animateRemoveStatusViewButton;

@synthesize lastAcceleration;
@synthesize explainingText;
@synthesize explainingView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    explainingView = [[UIView alloc] initWithFrame:self.view.bounds];
    [explainingView setBackgroundColor:[UIColor lightGrayColor]];
    [explainingView setAlpha:0.9];
    
    [UIAccelerometer sharedAccelerometer].delegate = self;
  }
  return self;
}

#pragma mark -
#pragma mark OLStatusView delegate methods

- (void)statusViewWillAppear{
  [self deactivateAllButtons];
}

- (void)statusViewWillDisappear{
  [self deactivateAllButtons];
}

- (void)statusViewDidAppear{
  [self activateRemovingButtons];
}

- (void)statusViewDidDisappear{
  [self activateShowingButtons];
}

#pragma mark -
#pragma mark Action management

- (IBAction)showOLStatusView{
  [statusView showOnView:self.view];
}

- (IBAction)animateShowOLStatusView{
  [statusView animateShowOnView:self.view];
}

- (IBAction)removeOLStatusView{
  [statusView remove];
  
}

- (IBAction)animateRemoveOLStatusView{
  [statusView animateRemove];
}

- (void)activateShowingButtons{
  [self activateButton:showStatusViewButton];
  [self activateButton:animateShowStatusViewButton];
  
  [self deactivateButton:removeStatusViewButton];
  [self deactivateButton:animateRemoveStatusViewButton];
}

- (void)activateRemovingButtons{
  [self activateButton:removeStatusViewButton];
  [self activateButton:animateRemoveStatusViewButton];
  
  [self deactivateButton:showStatusViewButton];
  [self deactivateButton:animateShowStatusViewButton];
}

- (void)activateAllButtons{
  [self activateButton:showStatusViewButton];
  [self activateButton:animateShowStatusViewButton];
  
  [self activateButton:removeStatusViewButton];
  [self activateButton:animateRemoveStatusViewButton]; 
}

- (void)activateButton:(UIButton *)aButton{
  [aButton setEnabled:YES];
  [aButton setAlpha:1.0];
}

- (void)deactivateAllButtons{
  [self deactivateButton:showStatusViewButton];
  [self deactivateButton:animateShowStatusViewButton];
  
  [self deactivateButton:removeStatusViewButton];
  [self deactivateButton:animateRemoveStatusViewButton];
}

- (void)deactivateButton:(UIButton *)aButton{
  [aButton setEnabled:NO];
  [aButton setAlpha:0.5];
}

#pragma mark -
#pragma mark Shake detection

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
  if (motion == UIEventSubtypeMotionShake)
  {
    [self handleExplainingViewBehavior];  
  }
}

- (BOOL)canBecomeFirstResponder{
  return YES;
}


#pragma mark -
#pragma mark Help management

- (void)handleExplainingViewBehavior{
  if ( !explainingViewDisplayed ) {
    [self addExplainingView];
  }else{
    [self removeExplainingView];
  }
}

- (void)addExplainingView{
  explainingViewDisplayed = YES;
}

- (void)removeExplainingView{
  explainingViewDisplayed = NO;
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
  [statusView release];
  
  [showStatusViewButton release];
  [removeStatusViewButton release];
  [animateShowStatusViewButton release];
  [animateRemoveStatusViewButton release];
  
  [explainingView release];
  
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}



#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  
  statusView = [[OLStatusView alloc] initWithStatusLabel:@"En cours de chargement" textFont:[UIFont fontWithName:@"Helvetica" size:16] orientation:UIInterfaceOrientationPortrait translationDirection:DownToUp];
  
  [self activateShowingButtons];
  
  statusView.delegate = self;
  [self addShakeImageOnBackOfView];
}

- (void)addShakeImageOnBackOfView{
  UIImage *shakeImage = [UIImage imageNamed:@"shakePhone.png"];
  UIImageView *anImageView = [[UIImageView alloc] initWithImage:shakeImage];
  [anImageView setFrame:CGRectMake(0, 0, 270, 402)];
  [anImageView setAlpha:0.1];
  
  [self.view addSubview:anImageView];
  [self.view sendSubviewToBack:anImageView];
  
  [anImageView release];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
  
  self.statusView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
