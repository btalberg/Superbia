//
//  TheologiansViewController.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "AppGlobals.h"
#import "BioViewController.h"
#import "TheologiansViewController.h"
#import "Theologian.h"

@implementation TheologiansViewController


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Device Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Seque Transition

// This will get called too before the view appears
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get destination view
    BioViewController *bioViewController = [segue destinationViewController];
    
    
    if ([[segue identifier] isEqualToString:@"Augustine"]) {
        
        // Pass the information to your destination view
        [bioViewController setMTheologian:[Theologian fetchAugustineInContext:[AppGlobals context]]];
    }
    
    if ([[segue identifier] isEqualToString:@"Niebuhr"]) {
        
        // Pass the information to your destination view
        [bioViewController setMTheologian:[Theologian fetchNiebuhrInContext:[AppGlobals context]]];
    }
    
    if ([[segue identifier] isEqualToString:@"Malcolm"]) {
        
        // Pass the information to your destination view
        [bioViewController setMTheologian:[Theologian fetchMalcolmInContext:[AppGlobals context]]];
    }
}
@end
