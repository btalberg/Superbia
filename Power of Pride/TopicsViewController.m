//
//  TopicsViewController.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "AppGlobals.h"
#import "TopicsViewController.h"
#import "TopicViewController.h"
#import "Topic.h"

@implementation TopicsViewController

@synthesize mPicker, mTopics, mRow;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.mTopics = [Topic fetchAllInContext:[AppGlobals context]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    self.mPicker = nil;
}

#pragma mark - Device rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Picker View Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [mTopics count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [[mTopics objectAtIndex:row] name];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.mRow = row;
}

#pragma mark - Seque Transition

// This will get called too before the view appears
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get destination view
    TopicViewController *topicViewController = [segue destinationViewController];
    [topicViewController setMTopic:[mTopics objectAtIndex:mRow]];
}


@end
