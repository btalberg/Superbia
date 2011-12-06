//
//  BioViewController.h
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Theologian.h"

@interface BioViewController : UIViewController {
    @public 
    Theologian *mTheologian;
    
    @private
    UILabel *mNameField;
    UILabel *mDateField;
    UIImageView *mImageField;
}

@property (strong, nonatomic) Theologian *mTheologian;
@property (strong, nonatomic) IBOutlet UILabel *mNameField;
@property (strong, nonatomic) IBOutlet UILabel *mDateField;
@property (strong, nonatomic) IBOutlet UIImageView *mImageField;

@end
