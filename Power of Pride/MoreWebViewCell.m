//
//  MoreWebViewCell.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/16/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "MoreWebViewCell.h"

@implementation MoreWebViewCell

@synthesize mWebView, mLabelField;

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

#pragma mark - Private Instance Methods

- (UIButton *)findButtonInView:(UIView *)view {
    UIButton *button = nil;
    
    if ([view isMemberOfClass:[UIButton class]]) {
        return (UIButton *)view;
    }
    
    if (view.subviews && [view.subviews count] > 0) {
        for (UIView *subview in view.subviews) {
            button = [self findButtonInView:subview];
            if (button) return button;
        }
    }
    
    return button;
}


#pragma mark - Public Instance Methods

- (void) setCellLabel:(NSString *)text
{
    //set the text of the label
    mLabelField.text = text;
}

-(void) setCellWebView:(NSString *)url
{
    //self.mWebView.scalesPageToFit = YES;
    
    // HTML to embed YouTube video
    NSString *youTubeVideoHTML = @"<html><head>\
    <body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
    width=\"%@\" height=\"%@\"></embed>\
    </body></html>";
    
    // Populate HTML with the URL and requested frame size
    NSString *html = [NSString stringWithFormat:youTubeVideoHTML, url, @"100%", @"100%"];
    
    // Load the html into the webview
    [self.mWebView loadHTMLString:html baseURL:nil];\
}

- (void) playVideo
{
    UIButton *b = [self findButtonInView:mWebView];
    [b sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end
