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
    
    CGFloat xPos;
    CGFloat viewMargin;
    CGFloat headerHeight;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        xPos = 200.0f;
        viewMargin = 10.0f;
        headerHeight = 20.0f;
    } else {
        xPos = 400.0f;
        viewMargin = 20.0f;
        headerHeight = 40.0f;
    }
    
    CGFloat objectWidth = self.view.frame.size.width - (2 * viewMargin);
    
    UILabel *bioHeader = [ViewHelper createHeader:@"Bio"];
    UILabel *themesHeader = [ViewHelper createHeader:@"Themes"];
    
    UITextView *bioTextView = 
        [ViewHelper createContent:[mTheologian bio] objectWidth:objectWidth];
    UITextView *themesTextView = 
        [ViewHelper createContent:[mTheologian themes] objectWidth:objectWidth];

    [self.mScrollView addSubview:bioHeader];
    [bioHeader setFrame:CGRectMake(viewMargin, xPos, objectWidth, headerHeight)];
    xPos += bioHeader.frame.size.height + viewMargin;
    
    [self.mScrollView addSubview:bioTextView];
    [bioTextView setFrame:CGRectMake(viewMargin, xPos, objectWidth, bioTextView.contentSize.height)];
    xPos += bioTextView.contentSize.height + viewMargin;

    [self.mScrollView addSubview:themesHeader];
    [themesHeader setFrame:CGRectMake(viewMargin, xPos, objectWidth, headerHeight)];
    xPos += themesHeader.frame.size.height + viewMargin;
    
    [self.mScrollView addSubview:themesTextView];
    [themesTextView setFrame:CGRectMake(viewMargin, xPos, objectWidth, themesTextView.contentSize.height)];
    xPos += themesTextView.contentSize.height + viewMargin;
  
    self.mScrollView.contentSize = CGSizeMake(self.view.frame.size.width, xPos);
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
