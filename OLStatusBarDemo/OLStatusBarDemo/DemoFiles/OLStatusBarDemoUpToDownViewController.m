//
//  OLStatusBarDemoUpToDownViewController.m
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 05/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "OLStatusBarDemoUpToDownViewController.h"


@implementation OLStatusBarDemoUpToDownViewController


#pragma mark -
#pragma mark Object life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    UIImage* anImage = [UIImage imageNamed:@"upToDown.png"];
    UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Up to Down" image:anImage tag:0];
    self.tabBarItem = theItem;
    [theItem release];
  }
  return self;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
  [explainingText release];
  
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark -
#pragma mark Help management

- (void)addExplainingView{
  explainingViewDisplayed = YES;
  ExplainingViewController *controller = [[ExplainingViewController alloc] initWithNibName:@"ExplainingViewController"
                                                                                    bundle:nil 
                                                                                     title:@"This statusView appears from the top of the current view." 
                                                                                     image:[UIImage imageNamed:@"statusViewUpToDownIcon.png"]
                                                                      codeDescriptionTitle:@"To call this statusView, just put the following code in viewDidLoad: "
                                                                           codeDescription:@"" 
                                                                               codeExample:@"statusView = [[OLStatusView alloc] initWithStatusLabel:@\"En cours de chargement\" textFont:[UIFont fontWithName:@\"Helvetica\" size:16] orientation:UIInterfaceOrientationPortrait translationDirection:UpToDown];" 
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


#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  statusView = [[OLStatusView alloc] initWithStatusLabel:@"En cours de chargement" textFont:[UIFont fontWithName:@"Helvetica" size:16] orientation:UIInterfaceOrientationPortrait translationDirection:UpToDown];
  
  [super activateShowingButtons];
  
  statusView.delegate = self;
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
