//
//  MoreWebViewCell.h
//  Power of Pride
//
//  Created by Ben Talberg on 12/16/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreWebViewCell : UITableViewCell {
    UIWebView *mWebView;
    UILabel *mLabelField;
}

@property (strong, nonatomic) IBOutlet UIWebView *mWebView;
@property (strong, nonatomic) IBOutlet UILabel *mLabelField;

/**
 Sets the text displayed for the table view cell
 @params a_text The test to set for the cell's label
 */
-(void) setCellLabel:(NSString *)text;

/**
 Sets the iamge displayed for the table view cell
 @params a_image The test to set for the cell's image
 */
-(void) setCellWebView:(NSString *)url;

/**
 Play the youtube video
 */
- (void) playVideo;

@end
