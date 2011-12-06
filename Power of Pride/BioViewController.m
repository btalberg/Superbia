//
//  BioViewController.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "BioViewController.h"

@implementation BioViewController

@synthesize mTheologian;
@synthesize mNameField, mDateField, mImageField;

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
    
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd"
                                                             options:0
                                                              locale:[NSLocale currentLocale]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:formatString];
    
    [self.mNameField setText:[mTheologian name]];
    [self.mDateField setText:
     [NSString stringWithFormat:@"%@ - %@", 
      [dateFormatter stringFromDate:[mTheologian born]],
      [dateFormatter stringFromDate:[mTheologian died]]]];
    
    UIFont *headerFont = [UIFont fontWithName:@"Copperplate-Bold" size:21.0];
    UIFont *contentFont = [UIFont systemFontOfSize:16.0];
    
    UILabel *bioHeader =
        [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 190.0f, 300.0f, 20.0f)];
    bioHeader.font = headerFont;
    bioHeader.text = @"Bio";
    
    [self.view addSubview:bioHeader];
    
    UITextView *bioTextField = [[UITextView alloc] initWithFrame:CGRectZero];
    bioTextField.editable = NO;
    bioTextField.font = contentFont;
    bioTextField.text = [mTheologian bio];
    
    [self.view addSubview:bioTextField];
    [bioTextField setFrame:CGRectMake(20.0f, 220.0f, 300.0f, bioTextField.contentSize.height)];
    
    UILabel *themesHeader =
        [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 230.0f + bioTextField.contentSize.height, 300.0f, 20.0f)];
    themesHeader.font = headerFont;
    themesHeader.text = @"Themes";
    
    [self.view addSubview:themesHeader];
    
    UITextView *themesTextField = [[UITextView alloc] initWithFrame:CGRectZero];
    themesTextField.editable = NO;
    themesTextField.font = contentFont;
    themesTextField.text = [mTheologian themes];
    
    [self.view addSubview:themesTextField];
    [themesTextField setFrame:CGRectMake(20.0f, 260.0f + bioTextField.contentSize.height, 300.0f, themesTextField.contentSize.height)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
	return YES;
}

@end
