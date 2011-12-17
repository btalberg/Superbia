//
//  MoreViewController.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "MoreViewController.h"
#import "ViewHelper.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation MoreViewController

@synthesize mTableView, mTableContents, mKeys, mInternetReachable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initReachability
{
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(checkNetworkStatus:) 
                                                 name:kReachabilityChangedNotification 
                                               object:nil];
    
    self.mInternetReachable = [Reachability reachabilityForInternetConnection];
    
}

- (void) initTableContents
{
    NSDictionary *_augustineRow1 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"enchiridion_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                   @"The Enchiridion - Chap. 1-17 (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                   @"http://www.archive.org/download/enchiridion_of_st_augustine_librivox/enchiridion_01_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];

    NSDictionary *_augustineRow2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"enchiridion_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"The Enchiridion - Chap. 18-33 (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/enchiridion_of_st_augustine_librivox/enchiridion_02_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow3 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"enchiridion_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"The Enchiridion - Chap. 33-53 (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/enchiridion_of_st_augustine_librivox/enchiridion_03_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow4 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"enchiridion_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"The Enchiridion - Chap. 54-72 (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/enchiridion_of_st_augustine_librivox/enchiridion_04_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow5 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"enchiridion_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"The Enchiridion - Chap. 73-92 (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/enchiridion_of_st_augustine_librivox/enchiridion_05_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow6 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"enchiridion_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"The Enchiridion - Chap. 93-110 (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/enchiridion_of_st_augustine_librivox/enchiridion_06_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow7 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIa (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_11a_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow8 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIb (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_11b_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow9 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIc (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_11c_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow10 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIIa (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_12a_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow11 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIIb (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_12b_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow12 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIIc (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_12c_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow13 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIIIa (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_13a_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow14 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIIIb (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_13b_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow15 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIIIc (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_13c_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow16 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIVa (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_14a_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow17 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIVb (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_14b_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow18 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIVc (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_14c_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow19 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XIVd (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_14d_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow20 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XVIa (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_16a_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow21 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XVIb (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_16b_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow22 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XVIc (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_16c_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow23 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XVId (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_16d_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow24 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XVIIIa (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_18a_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow25 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XVIIIb (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_18b_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow26 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XVIIIc (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_18c_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow27 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                    @"City of God - Book XVIIId (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                    @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_18d_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                    [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                    nil];
    
    NSDictionary *_augustineRow28 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                     [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                     @"City of God - Book XVIIIe (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                     @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_18e_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                     [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                     nil];
    
    NSDictionary *_augustineRow29 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                     [UIImage imageNamed:@"cityofgod_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                     @"City of God - Book XVIIIf (Librivox)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                     @"http://www.archive.org/download/city_of_god_ds_librivox/cityofgod_18f_augustine_64kb.mp3", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                     [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                     nil];
    
    NSDictionary *_malcolmRow1 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                   [UIImage imageNamed:@"malcolm_hate_yourself_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                   @"Who Taught You to Hate Yourself?", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                  @"http://www.youtube.com/watch?v=gRSgUTWffMQ", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                  [NSNumber numberWithInt:REMOTE_YOUTUBE], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                  nil];
    
    NSDictionary *_malcolmRow2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [UIImage imageNamed:@"malcom_miseducation_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                  @"On the Mis-Education of the Black Race?", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                  @"http://www.youtube.com/watch?v=R_KOQKObkm0", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                  [NSNumber numberWithInt:REMOTE_YOUTUBE], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                  nil];
    
    NSDictionary *_malcolmRow3 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [UIImage imageNamed:@"malcolm_oxford_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                  @"Oxford Union Debate", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                  @"http://www.youtube.com/watch?v=Dmzaaf-9aHQ", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                  [NSNumber numberWithInt:REMOTE_YOUTUBE], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                  nil];
    
    NSDictionary *_malcolmRow4 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [UIImage imageNamed:@"malcolm_ballot_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                  @"Ballot or Bullet", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                  @"http://www.youtube.com/watch?v=CRNciryImqg", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                  [NSNumber numberWithInt:REMOTE_YOUTUBE], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                  nil];
        
    

    NSDictionary *_niebuhrRow1 = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  [UIImage imageNamed:@"niebuhr_on_being_artwork"], [NSNumber numberWithInt:ROW_CATEGORY_IMAGE],
                                  @"Niebuhr Rediscovered (On Being)", [NSNumber numberWithInt:ROW_CATEGORY_TITLE],
                                  @"http://download.publicradio.org/podcast/speakingoffaith/20071025_niebuhr-rediscovered.mp3?_kip_ipx=618351131-1323849289", [NSNumber numberWithInt:ROW_CATEGORY_LINK], 
                                  [NSNumber numberWithInt:REMOTE_MP3], [NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE],
                                  nil];
    
    //Addition Options for the case
    NSArray *_augustineLinks = [[NSArray alloc] initWithObjects:
                                _augustineRow1,
                                _augustineRow2,
                                _augustineRow3,
                                _augustineRow4,
                                _augustineRow5,
                                _augustineRow6,
                                _augustineRow7,
                                _augustineRow8,
                                _augustineRow9,
                                _augustineRow10,
                                _augustineRow11,
                                _augustineRow12,
                                _augustineRow13,
                                _augustineRow14,
                                _augustineRow15,
                                _augustineRow16,
                                _augustineRow17,
                                _augustineRow18,
                                _augustineRow19,
                                _augustineRow20,
                                _augustineRow21,
                                _augustineRow22,
                                _augustineRow23,
                                _augustineRow24,
                                _augustineRow25,
                                _augustineRow26,
                                _augustineRow27,
                                _augustineRow28,
                                _augustineRow29,
                                nil];
    
    //Editing Options for the case
    NSArray *_niebuhrLinks = [[NSArray alloc] initWithObjects:
                              _niebuhrRow1,
                              nil];
    
    NSArray *_malcolmLinks = [[NSArray alloc] initWithObjects:
                              _malcolmRow1,
                              _malcolmRow2,
                              _malcolmRow3,
                              _malcolmRow4,
                              nil];
    
    self.mTableContents = [[NSDictionary alloc] initWithObjectsAndKeys:
                           _augustineLinks, [NSNumber numberWithInt:THEOLOGIAN_CATEGORY_AUGUSTINE], 
                           _niebuhrLinks, [NSNumber numberWithInt:THEOLOGIAN_CATEGORY_NIEBUHR],
                           _malcolmLinks, [NSNumber numberWithInt:THEOLOGIAN_CATEGORY_MALCOLM],
                           nil];
    
    self.mKeys = [mTableContents allKeys];
    
}

#pragma mark - Private Instance Methods

- (void) loadRemoteMP3:(NSURL *)url
{
    MPMoviePlayerViewController *playerController =
    [[MPMoviePlayerViewController alloc] initWithContentURL:url];

    // Remove the movie player view controller from the "playback did finish" notification observers
    [[NSNotificationCenter defaultCenter] removeObserver:playerController
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:playerController.moviePlayer];
    
    // Register this class as an observer instead
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:playerController.moviePlayer];
    
    // Set the modal transition style of your choice
    playerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    // Present the movie player view controller
    [self presentModalViewController:playerController animated:YES];
    
    [[playerController moviePlayer] play];
}

/*
 * Helper function for rendering simple alerts
 */
- (void)displayAlertWithTitle:(NSString*)title message:(NSString*)message
{
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self 
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
    [alertView show];
}

- (BOOL)testInternetReachability
{
    NetworkStatus internetStatus = [mInternetReachable currentReachabilityStatus];
    
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)) {
        [self displayAlertWithTitle:@"Warning" message:@"Could not connect to internet"];
        return FALSE;
    }
    
    return TRUE;
}

/* Initialize reachability class network/website availability tasks. Declare a ReachabilityChangedNotification class observer.
 */
- (BOOL)testReachability
{
    return [self testInternetReachability];
}

#pragma mark - Public Instance Methods

- (void)movieFinishedCallback:(NSNotification*)aNotification
{
    // Obtain the reason why the movie playback finished
    NSNumber *finishReason = [[aNotification userInfo] objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    
    // Dismiss the view controller ONLY when the reason is not "playback ended"
    if ([finishReason intValue] != MPMovieFinishReasonPlaybackEnded)
    {
        MPMoviePlayerController *moviePlayer = [aNotification object];
        
        // Remove this class from the observers
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:MPMoviePlayerPlaybackDidFinishNotification
                                                      object:moviePlayer];
        
        // Dismiss the view controller
        [self dismissModalViewControllerAnimated:YES];
    }
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    [super viewDidLoad];

    [self initReachability];
    [self initTableContents];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [self initReachability];
    
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
}

- (void)viewDidUnload
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    self.mInternetReachable = nil;
    self.mKeys = nil;
    self.mTableContents = nil;
    self.mTableView = nil;
    
    [super viewDidUnload];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self mKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray *_sectionItems = [[self mTableContents] 
                              objectForKey:[self.mKeys objectAtIndex:section]];
    return [_sectionItems count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSNumber *sectionNumber = (NSNumber *) [self.mKeys objectAtIndex:section];
    
    switch ([sectionNumber intValue]) {
        case (THEOLOGIAN_CATEGORY_AUGUSTINE):
            return @"Augustine";
            break;
        case (THEOLOGIAN_CATEGORY_NIEBUHR):
            return @"Niebuhr";
            break;
        case (THEOLOGIAN_CATEGORY_MALCOLM):
            return @"Malcolm X";
            break;
        default:
            return @"";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //Get the items for the section
    NSArray *_itemsForKey = [[self mTableContents] objectForKey:[self.mKeys 
                                                                 objectAtIndex:[indexPath section]]];
    
    //Config the cell
    NSDictionary *item = [_itemsForKey objectAtIndex:indexPath.row];
    
    NSNumber *contentType = (NSNumber *)[item objectForKey:[NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE]];
    
    UITableViewCell *cell;
    
    switch ([contentType intValue]) {
        case (REMOTE_MP3):
            cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
            
            [(MoreImageViewCell *)cell setCellImage:[item objectForKey:[NSNumber numberWithInt:ROW_CATEGORY_IMAGE]]];
            [(MoreImageViewCell *)cell setCellLabel:[item objectForKey:[NSNumber numberWithInt:ROW_CATEGORY_TITLE]]];
            
            break;
        case (REMOTE_YOUTUBE):
            cell = [tableView dequeueReusableCellWithIdentifier:@"WebCell"];
            
            [(MoreWebViewCell *)cell setCellWebView:[item objectForKey:[NSNumber numberWithInt:ROW_CATEGORY_LINK]]];
            [(MoreWebViewCell *)cell setCellLabel:[item objectForKey:[NSNumber numberWithInt:ROW_CATEGORY_TITLE]]];
            
            break;
        default:
            break;
    }
    
    return cell;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section 
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];

    UILabel *label = [ViewHelper createHeader:[tableView.dataSource tableView:tableView titleForHeaderInSection:section]];
    
    [label setFrame:CGRectMake(10, 3, tableView.bounds.size.width - 10, 18)];
    
    [headerView addSubview:label];
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    return headerView;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (![self testInternetReachability]) {
        return;
    }
    
    //Get the items for the section
    NSArray *_itemsForKey = [[self mTableContents] objectForKey:[self.mKeys 
                                                                 objectAtIndex:[indexPath section]]];
    
    //Config the cell
    NSDictionary *item = [_itemsForKey objectAtIndex:indexPath.row];
    
    NSNumber *contentType = (NSNumber *)[item objectForKey:[NSNumber numberWithInt:ROW_CATEGORY_CONTENT_TYPE]];
                            
    switch ([contentType intValue]) {
        case (REMOTE_MP3):
            [self loadRemoteMP3:[NSURL URLWithString:[item objectForKey:[NSNumber numberWithInt:ROW_CATEGORY_LINK]]]];
            break;
        case (REMOTE_YOUTUBE):
            [(MoreWebViewCell *)[tableView cellForRowAtIndexPath:indexPath] playVideo];
            break;
        default:
            break;
    }
}

@end
