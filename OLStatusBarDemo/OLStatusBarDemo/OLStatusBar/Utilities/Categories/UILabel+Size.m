//
//  UILabel+Size.m
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 05/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

#import "UILabel+Size.h"

@implementation UILabel(Size)

-(void)setUpMultiLineFrameWithStartXPosition:(CGFloat)startX withStartYPosition:(CGFloat)startY
{
	self.lineBreakMode = UILineBreakModeWordWrap;
	self.numberOfLines = 0;//instructs the label to contain any number of lines
	
	CGSize minSize = [self getSize];
	[self setFrame:CGRectMake(startX, startY, minSize.width, minSize.height)];
}

-(void)setUpMultiLineFrameBasedOnWidth:(CGFloat)maxWidth withStartXPosition:(CGFloat)startX withHeight:(CGFloat)maxHeight{
	self.lineBreakMode = UILineBreakModeWordWrap;
	self.numberOfLines = 0; //instructs the label to contain any number of lines
	
	CGFloat labelHeight = [self getHeightBasedOnWidth:maxWidth];
	CGFloat padding = ((maxHeight - labelHeight)/2); //center label within maxHeight box
	[self setFrame:CGRectMake(startX, padding, maxWidth, labelHeight)];
}

-(void)setUpMultiLineFrameBasedOnWidth:(CGFloat)maxWidth withStartXPosition:(CGFloat)startX withStartYPosition:(CGFloat)startY{
	
	self.lineBreakMode = UILineBreakModeWordWrap;
	self.numberOfLines = 0;//instructs the label to contain any number of lines
	
	CGFloat labelHeight = [self getHeightBasedOnWidth:maxWidth];
	[self setFrame:CGRectMake(startX, startY, maxWidth, labelHeight)];
}

-(void)setUpMultiLineFrameBasedOnWidth:(CGFloat)maxWidth withStartXPosition:(CGFloat)startX{
	self.lineBreakMode = UILineBreakModeWordWrap;
	self.numberOfLines = 0;//instructs the label to contain any number of lines
	
	CGFloat labelHeight = [self getHeightBasedOnWidth:maxWidth];
	[self setFrame:CGRectMake(startX, 0, maxWidth, labelHeight)];
}

-(CGFloat)getHeightBasedOnWidth:(CGFloat)maxWidth{
	
	CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(maxWidth, 9999) lineBreakMode:self.lineBreakMode];
	
	return size.height;
}

-(CGSize)getSize{
	CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(9999, 9999) lineBreakMode:self.lineBreakMode];
	
	return size;
}

@end


