//
//  BioViewController.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "BioViewController.h"
#import "ViewHelper.h"

@implementation BioViewController

@synthesize mTheologian;
@synthesize mScrollView, mDateBornField, mDateDiedField, mCityBornField, mCityDiedField, mImageField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
	
    [super viewDidLoad];
    
    self.title = mTheologian.name;
    [self.mImageField setImage:mTheologian.avatar];
    
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"dd MMMM y"
                                                             options:0
                                                              locale:[NSLocale currentLocale]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    
    [self.mDateBornField setText:[dateFormatter stringFromDate:[mTheologian dateborn]]];
    [self.mDateDiedField setText:[dateFormatter stringFromDate:[mTheologian datedied]]];
    [self.mCityBornField setText:[mTheologian cityborn]];
    [self.mCityDiedField setText:[mTheologian citydied]];
    
    
    CGFloat xPos = 200.0f;
    CGFloat viewMargin = 10.0f;
    
    
    UILabel *bioHeader = [ViewHelper createHeader:@"Bio"];
    UILabel *themesHeader = [ViewHelper createHeader:@"Themes"];
    
    UITextView *bioTextView = 
        [ViewHelper createContent:[mTheologian bio]];
    UITextView *themesTextView = 
        [ViewHelper createContent:[mTheologian themes]];

    [self.mScrollView addSubview:bioHeader];
    [bioHeader setFrame:CGRectMake(10.0f, xPos, 300.0f, 20.0f)];
    xPos += bioHeader.frame.size.height + viewMargin;
    
    [self.mScrollView addSubview:bioTextView];
    [bioTextView setFrame:CGRectMake(10.0f, xPos, 300.0f, bioTextView.contentSize.height)];
    xPos += bioTextView.contentSize.height + viewMargin;

    [self.mScrollView addSubview:themesHeader];
    [themesHeader setFrame:CGRectMake(10.0f, xPos, 300.0f, 20.0f)];
    xPos += themesHeader.frame.size.height + viewMargin;
    
    [self.mScrollView addSubview:themesTextView];
    [themesTextView setFrame:CGRectMake(10.0f, xPos, 300.0f, themesTextView.contentSize.height)];
    xPos += themesTextView.contentSize.height + viewMargin;
  
    self.mScrollView.contentSize = CGSizeMake(320.0f, xPos);
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    self.mDateBornField = nil;
    self.mCityBornField = nil;
    self.mDateDiedField = nil;
    self.mCityDiedField = nil;
    self.mImageField = nil;
    self.mScrollView = nil;

}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Device Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
