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
    UILabel *mDateBornField;
    UILabel *mCityBornField;
    UILabel *mDateDiedField;
    UILabel *mCityDiedField;
    UIImageView *mImageField;
    UIScrollView *mScrollView;
}

@property (strong, nonatomic) Theologian *mTheologian;

@property (strong, nonatomic) IBOutlet UIImageView *mImageField;
@property (strong, nonatomic) IBOutlet UILabel *mDateBornField;
@property (strong, nonatomic) IBOutlet UILabel *mDateDiedField;
@property (strong, nonatomic) IBOutlet UILabel *mCityBornField;
@property (strong, nonatomic) IBOutlet UILabel *mCityDiedField;
@property (strong, nonatomic) IBOutlet UIScrollView *mScrollView;

@end
