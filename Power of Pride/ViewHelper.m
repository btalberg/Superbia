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
    
    return header;
}

+ (UITextView *) createContent:(NSString *)text
{
    UIFont *contentFont = [UIFont systemFontOfSize:16.0];
    
    UITextView *textField = [[UITextView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 300.0f, 0.0f)];
    textField.editable = NO;
    textField.font = contentFont;
    textField.text = text;
    textField.scrollEnabled = NO;
    
    return textField;
}

@end
