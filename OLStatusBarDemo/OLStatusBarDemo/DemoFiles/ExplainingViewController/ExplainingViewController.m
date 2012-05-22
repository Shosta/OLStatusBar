//
//  ExplainingViewController.m
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 09/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "ExplainingViewController.h"


@implementation ExplainingViewController

@synthesize scrollView;

@synthesize titleLabel;
@synthesize imageView;
@synthesize codeDescriptionTitleLabel;
@synthesize codeDescriptionLabel;
@synthesize codeExampleLabel;
@synthesize placementDescriptionLabel;
@synthesize statusTitleLabel;
@synthesize statusCodeExampleLabel;

@synthesize explainingTitle;
@synthesize image;
@synthesize codeDescriptionTitle;
@synthesize codeDescription;
@synthesize codeExample;
@synthesize placementDescription;
@synthesize statusTitle;
@synthesize statusCodeExample;


#pragma mark -
#pragma mark Object life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  
  return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
                title:(NSString *)aTitle
                image:(UIImage *)anImage
 codeDescriptionTitle:(NSString *)aCodeDescriptionTitle
      codeDescription:(NSString *)aCodeDescription
          codeExample:(NSString *)aCodeExample
 placementDescription:(NSString *)aPlacementDescription
          statusTitle:(NSString *)aStatusTitle
    statusCodeExample:(NSString *)aStatusCodeExample
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization    
    title = [[NSString alloc] initWithString:aTitle];
    image = [[UIImage alloc] init];
    image = anImage;
    codeDescriptionTitle = [[NSString alloc] initWithString:aCodeDescriptionTitle];
    codeDescription = [[NSString alloc] initWithString:aCodeDescription];
    codeExample = [[NSString alloc] initWithString:aCodeExample];
    placementDescription = [[NSString alloc] initWithString:aPlacementDescription];
    statusTitle = [[NSString alloc] initWithString:aStatusTitle];
    statusCodeExample = [[NSString alloc] initWithString:aStatusCodeExample];
  }
  
  return self;
}

- (void)setAllInfos{
  [titleLabel setText:title];
  [imageView setImage:image];
  [codeDescriptionTitleLabel setText:codeDescriptionTitle];
  [codeDescriptionLabel setText:codeDescription];
  [codeExampleLabel setText:codeExample];
  [placementDescriptionLabel setText:placementDescription];
  [statusTitleLabel setText:statusTitle];
  [statusCodeExampleLabel setText:statusCodeExample];
  
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc
{
  [explainingTitle release];
  [image release];
  [codeDescriptionTitle release];
  [codeDescription release];
  [codeExample release];
  [placementDescription release];
  [statusTitle release];
  [statusCodeExample release];
  
  [titleLabel release];
  [imageView release];
  [codeDescriptionTitleLabel release];
  [codeDescriptionLabel release];
  [codeExampleLabel release];
  [placementDescriptionLabel release];
  [statusTitleLabel release];
  [statusCodeExampleLabel release];
  
  [scrollView release];
  
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  [self setAllInfos];
  [scrollView setContentSize:CGSizeMake(320, 550)];
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

#pragma mark -
#pragma mark Handle gesture

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
  if (motion == UIEventSubtypeMotionShake)
  {
    [self dismissModalViewControllerAnimated:YES];  
  }
}

- (BOOL)canBecomeFirstResponder{
  return YES;
}

@end
