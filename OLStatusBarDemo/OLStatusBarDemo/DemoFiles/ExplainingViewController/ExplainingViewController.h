//
//  ExplainingViewController.h
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 09/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExplainingViewController : UIViewController {
  IBOutlet UIScrollView *scrollView;
  
  IBOutlet UILabel *titleLabel;
  IBOutlet UIImageView *imageView;
  IBOutlet UILabel *codeDescriptionTitleLabel;
  IBOutlet UILabel *codeDescriptionLabel;
  IBOutlet UILabel *codeExampleLabel;
  IBOutlet UILabel *placementDescriptionLabel;
  IBOutlet UILabel *statusTitleLabel;
  IBOutlet UILabel *statusCodeExampleLabel;
  
  NSString *title;
  UIImage *image;
  NSString *codeDescriptionTitle;
  NSString *codeDescription;
  NSString *codeExample;
  NSString *placementDescription;
  NSString *statusTitle;
  NSString *statusCodeExample;

}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *codeDescriptionTitleLabel;
@property (nonatomic, retain) UILabel *codeDescriptionLabel;
@property (nonatomic, retain) UILabel *codeExampleLabel;
@property (nonatomic, retain) UILabel *placementDescriptionLabel;
@property (nonatomic, retain) UILabel *statusTitleLabel;
@property (nonatomic, retain) UILabel *statusCodeExampleLabel;

@property (nonatomic, retain) NSString *explainingTitle;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSString *codeDescriptionTitle;
@property (nonatomic, retain) NSString *codeDescription;
@property (nonatomic, retain) NSString *codeExample;
@property (nonatomic, retain) NSString *placementDescription;
@property (nonatomic, retain) NSString *statusTitle;
@property (nonatomic, retain) NSString *statusCodeExample;


// Object life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
                title:(NSString *)aTitle
                image:(UIImage *)anImage
 codeDescriptionTitle:(NSString *)aCodeDescriptionTitle
      codeDescription:(NSString *)aCodeDescription
          codeExample:(NSString *)aCodeExample
 placementDescription:(NSString *)aPlacementDescription
          statusTitle:(NSString *)aStatusTitle
    statusCodeExample:(NSString *)aStatusCodeExample;


@end
