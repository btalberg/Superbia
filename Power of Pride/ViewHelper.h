//
//  ViewHelper.h
//  Power of Pride
//
//  Created by Ben Talberg on 12/7/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewHelper : NSObject

+ (UILabel *) createHeader:(NSString *)text;
+ (UITextView *) createContent:(NSString *)text;

@end
