//
//  TopicsViewController.h
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    UIPickerView *mPicker;
    NSArray *mTopics;
}

@property (strong, nonatomic) IBOutlet UIPickerView *mPicker;
@property (strong, nonatomic) NSArray *mTopics;
@property (nonatomic) NSInteger mRow;

@end
