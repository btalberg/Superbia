//
//  ViewHelper.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/7/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "ViewHelper.h"

@implementation ViewHelper


+ (UILabel *) createHeader:(NSString *)text
{
    UIFont *headerFont = [UIFont fontWithName:@"Copperplate-Bold" size:21.0];
    
    UILabel *header =
        [[UILabel alloc] initWithFrame:CGRectZero];
    header.font = headerFont;
    header.text = text;
    header.backgroundColor = [UIColor clearColor];
    
    return header;
}

+ (UITextView *) createContent:(NSString *)text objectWidth:(CGFloat)width
{
    UIFont *contentFont = [UIFont systemFontOfSize:16.0];
    
    UITextView *textField = [[UITextView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, width, 0.0f)];
    textField.editable = NO;
    textField.font = contentFont;
    textField.text = text;
    textField.scrollEnabled = NO;
    textField.backgroundColor = [UIColor clearColor];
    
    return textField;
}

+ (UIButton *) createButton:(NSString *)text withResource:(NSString *)resource
{
    UIButton *remoteButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 0.0f)];
    [remoteButton setTitle:text forState:UIControlStateNormal];
    
    return remoteButton;
}

@end
