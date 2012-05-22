//
//  OLStatusBarDemoDownToUpViewController.m
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 05/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "OLStatusBarDemoDownToUpViewController.h"


@implementation OLStatusBarDemoDownToUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    UIImage* anImage = [UIImage imageNamed:@"downToUp.png"];
    UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Down to Up" image:anImage tag:0];
    self.tabBarItem = theItem;
    [theItem release];
  }
  return self;
}


#pragma mark -
#pragma mark Help management

- (void)addExplainingView{
  explainingViewDisplayed = YES;
  ExplainingViewController *controller = [[ExplainingViewController alloc] initWithNibName:@"ExplainingViewController"
                                                                                    bundle:nil 
                                                                                     title:@"This statusView appears from the bottom of the current view."
                                                                                     image:[UIImage imageNamed:@"statusViewDownToUpIcon.png"]
                                                                      codeDescriptionTitle:@"To call this statusView, just put the following code in viewDidLoad: "
                                                                           codeDescription:@"" 
                                                                               codeExample:@"statusView = [[OLStatusView alloc] initWithStatusLabel:@\"En cours de chargement\" textFont:[UIFont fontWithName:@\"Helvetica\" size:16] orientation:UIInterfaceOrientationPortrait translationDirection:DownToUp];" 
                                                                      placementDescription:@"Define the statusView's delegate to \"self\" if you want to use the delegate's methods \"statusViewWillAppear\", \"statusViewWillDisappear\", \"statusViewDidAppear\" or \"statusViewDidDisappear \"."  
                                                                               statusTitle:@"For this controller, these methods are called to display the buttons or not depending on the state of statusView." 
                                                                         statusCodeExample:@"statusView.delegate = self;"]; 

  
  
  [self presentModalViewController:controller animated:YES];
  [controller release];
  
}

- (void)removeExplainingView{
  explainingViewDisplayed = NO;
  [self dismissModalViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  
  statusView = [[OLStatusView alloc] initWithStatusLabel:@"En cours de chargement" textFont:[UIFont fontWithName:@"Helvetica" size:16] orientation:UIInterfaceOrientationPortrait translationDirection:DownToUp];
  
  [super activateShowingButtons];
  
  statusView.delegate = self;
  
  // [UIAccelerometer sharedAccelerometer].delegate = self;
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  
  [self becomeFirstResponder];
}


- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
