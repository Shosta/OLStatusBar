//
//  OLStatusBarDemoChangeColorViewController.m
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 05/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "OLStatusBarDemoChangeColorViewController.h"
#include <stdlib.h>




@implementation OLStatusBarDemoChangeColorViewController

@synthesize changeBackgroundColorButton;
@synthesize changeTextColorButton;
@synthesize changeLineColorButton;

#pragma mark -
#pragma mark OLStatusView delegate methods

- (void)statusViewDidAppear{
  [super activateButton:changeBackgroundColorButton];
  [super activateButton:changeTextColorButton];
  [super activateButton:changeLineColorButton];
}


#pragma mark -
#pragma mark Object life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
    UIImage* anImage = [UIImage imageNamed:@"color.png"];
    UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Change colors" image:anImage tag:0];
    self.tabBarItem = theItem;
    [theItem release];
    
    colors = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor purpleColor], [UIColor brownColor], [UIColor yellowColor], [UIColor blueColor], [UIColor orangeColor], nil];
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
                                                                                     image:[UIImage imageNamed:@"statusViewChangeColorIcon.png"]
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
  [colors release];
  [changeBackgroundColorButton release];
  [changeTextColorButton release];
  [changeLineColorButton release];
  
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}


#pragma mark -
#pragma mark Status View color management

- (IBAction)changeLineColor{
  int r = arc4random() % [colors count];
  [statusView setLineBackgroundColor:[colors objectAtIndex:r]];
}

- (IBAction)changeTextColor{
  int r = arc4random() % [colors count];
  [statusView setStatusTextColor:[colors objectAtIndex:r]];
}

- (IBAction)changeBackgroundColor{
  int r = arc4random() % [colors count];
  [statusView setBackgroundColor:[colors objectAtIndex:r]];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  statusView = [[OLStatusView alloc] initWithStatusLabel:@"En cours de chargement" textFont:[UIFont fontWithName:@"Helvetica" size:16] orientation:UIInterfaceOrientationPortrait translationDirection:DownToUp];
  
  [super activateShowingButtons];
  [super deactivateButton:changeBackgroundColorButton];
  [super deactivateButton:changeTextColorButton];
  [super deactivateButton:changeLineColorButton];
  
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
