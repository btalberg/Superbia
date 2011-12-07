//
//  TopicViewController.h
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Topic.h"

@interface TopicViewController : UIViewController{
    @public
    Topic *mTopic;
    
    @private
    UIScrollView *mScrollView;
}

@property (strong, nonatomic) Topic *mTopic;
@property (strong, nonatomic) IBOutlet UIScrollView *mScrollView;

@end
