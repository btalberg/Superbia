//
//  TopicViewController.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "Theologian.h"
#import "TheologianTopic.h"
#import "TopicViewController.h"
#import "ViewHelper.h"

@implementation TopicViewController

@synthesize mTopic, mScrollView;

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

    self.title = [NSString stringWithFormat:@"On %@", mTopic.name];
    
    CGFloat xPos = 20.0f;
    CGFloat viewMargin = 10.0f;
    
    NSArray *thelogiansTopics = [[mTopic theologianTopics] allObjects];
    
    for (int ii=0; ii < [thelogiansTopics count]; ii++) {
        Theologian *theologian = [(TheologianTopic *)[thelogiansTopics objectAtIndex:ii] theologian];
        UILabel *header = [ViewHelper createHeader:[theologian name]];
        UITextView *textView = 
            [ViewHelper createContent:[[thelogiansTopics objectAtIndex:ii] position]];
        
        [self.mScrollView addSubview:header];
        [header setFrame:CGRectMake(10.0f, xPos, 300.0f, 20.0f)];
        xPos += header.frame.size.height + viewMargin;
        
        [self.mScrollView addSubview:textView];
        [textView setFrame:CGRectMake(10.0f, xPos, 300.0f, textView.contentSize.height)];
        xPos += textView.contentSize.height + viewMargin;
    }
    
    self.mScrollView.contentSize = CGSizeMake(320.0f, xPos);
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
