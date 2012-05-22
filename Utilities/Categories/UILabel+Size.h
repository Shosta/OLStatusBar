//
//  UILabel+Size.h
//  OLStatusBarDemo
//
//  Created by Rémi LAVEDRINE on 05/08/11.
//  Copyright 2011 Orange Labs. All rights reserved.
//

@interface UILabel(Size)

/*
 @method Adjusts UILabel's frame to begin at defined x and y position and have a dynamic height
 @param startX - value that the frames x coord to be
 @param startY - value that the frames y coord to be
 */
-(void)setUpMultiLineFrameWithStartXPosition:(CGFloat)startX withStartYPosition:(CGFloat)startY;

/*
 @method Adjusts UILabel's frame to begin at defined x position, to maxiumum width and height, centered veritcally based on maxHeight and height of content
 @param width - value that the frames width property will be
 @param startX - value that the frames x coord to be
 @param maxHeight - value that the frames height property will be
 */
-(void)setUpMultiLineFrameBasedOnWidth:(CGFloat)width withStartXPosition:(CGFloat)startX withHeight:(CGFloat)maxHeight; 

/*
 @method Adjusts UILabel's frame to begin at defined x and y position, to maxiumum width and have a dynamic height
 @param maxWidth - value that the frames width property will be
 @param startX - value that the frames x coord to be
 @param startY - value that the frames y coord to be
 */
-(void)setUpMultiLineFrameBasedOnWidth:(CGFloat)maxWidth withStartXPosition:(CGFloat)startX withStartYPosition:(CGFloat)startY;

/*
 @method Adjusts UILabel's frame to begin at defined x position, to maxiumum width
 @param maxWidth - value that the frames width property will be
 @param startX - value that the frames x coord to be
 */
-(void)setUpMultiLineFrameBasedOnWidth:(CGFloat)maxWidth withStartXPosition:(CGFloat)startX;

/*
 @method Returns height value of UILabel based on content and max width
 @param width - max width of content
 @return height of UILabel
 */
-(CGFloat)getHeightBasedOnWidth:(CGFloat)width;

/*
 @method Returns size of UILabel based on content
 @return Size of UILabel
 */
-(CGSize)getSize;

@end
