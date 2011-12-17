//
//  MoreImageViewCell.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/13/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "MoreImageViewCell.h"

@implementation MoreImageViewCell

@synthesize mImageField, mLabelField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - Device Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Instance Methods

- (void) setCellLabel:(NSString *)text
{
    //set the text of the label
    mLabelField.text = text;
}

-(void) setCellImage:(UIImage *)image
{
    mImageField.image = image;
}

@end
