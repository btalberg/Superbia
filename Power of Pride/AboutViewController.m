//
//  AboutViewController.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "AboutViewController.h"
#import "ViewHelper.h"

@implementation AboutViewController

@synthesize mScrollView;
/*@synthesize mAboutHeader, mAboutTextField;
@synthesize mInspirationHeader, mInspirationTextField;
@synthesize mSourcesHeader, mSourcesTextField;*/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat xPos;
    CGFloat viewMargin;
    CGFloat headerHeight;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        xPos = 20.0f;
        viewMargin = 10.0f;
        headerHeight = 20.0f;
    } else {
        xPos = 40.0f;
        viewMargin = 20.0f;
        headerHeight = 40.0f;
    }
    
    CGFloat objectWidth = self.view.frame.size.width - (2 * viewMargin);
    
    UILabel *aboutHeader = [ViewHelper createHeader:@"About"];
    UILabel *inspirationHeader = [ViewHelper createHeader:@"Inspiration"];
    UILabel *sourcesHeader = [ViewHelper createHeader:@"Sources"];
    
    UITextView *aboutTextView = 
    [ViewHelper createContent:NSLocalizedString(@"AboutView_AboutText", @"") objectWidth:objectWidth];
    UITextView *inspirationTextView = 
        [ViewHelper createContent:NSLocalizedString(@"AboutView_InspirationText", @"") objectWidth:objectWidth];
    UITextView *sourcesTextView = 
        [ViewHelper createContent:NSLocalizedString(@"AboutView_SourcesText", @"") objectWidth:objectWidth];
    
    [self.mScrollView addSubview:aboutHeader];
    [aboutHeader setFrame:CGRectMake(viewMargin, xPos, objectWidth, headerHeight)];
    xPos += aboutHeader.frame.size.height + viewMargin;
 
    [self.mScrollView addSubview:aboutTextView];
    [aboutTextView setFrame:CGRectMake(viewMargin, xPos, objectWidth, aboutTextView.contentSize.height)];
    xPos += aboutTextView.contentSize.height + viewMargin;
    
    [self.mScrollView addSubview:inspirationHeader];
    [inspirationHeader setFrame:CGRectMake(viewMargin, xPos, objectWidth, headerHeight)];
    xPos += inspirationHeader.frame.size.height + viewMargin;
    
    [self.mScrollView addSubview:inspirationTextView];
    [inspirationTextView setFrame:CGRectMake(viewMargin, xPos, objectWidth, inspirationTextView.contentSize.height)];
    xPos += inspirationTextView.contentSize.height + viewMargin;
    
    [self.mScrollView addSubview:sourcesHeader];
    [sourcesHeader setFrame:CGRectMake(viewMargin, xPos, objectWidth, headerHeight)];
    xPos += sourcesHeader.frame.size.height + viewMargin;

    [self.mScrollView addSubview:sourcesTextView];
    [sourcesTextView setFrame:CGRectMake(viewMargin, xPos, objectWidth, sourcesTextView.contentSize.height)];
    xPos += sourcesTextView.contentSize.height + viewMargin;
    
    self.mScrollView.contentSize = CGSizeMake(self.view.frame.size.width, xPos);
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    self.mScrollView = nil;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Device rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
        
}

@end
