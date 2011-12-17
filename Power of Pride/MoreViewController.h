//
//  MoreViewController.h
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreImageViewCell.h"
#import "MoreWebViewCell.h"
#import "Reachability.h"

typedef enum {
    THEOLOGIAN_CATEGORY_AUGUSTINE,
    THEOLOGIAN_CATEGORY_NIEBUHR,
    THEOLOGIAN_CATEGORY_MALCOLM
} tableCategoriesEnum;

typedef enum {
    ROW_CATEGORY_IMAGE,
    ROW_CATEGORY_TITLE,
    ROW_CATEGORY_LINK,
    ROW_CATEGORY_CONTENT_TYPE
} rowCategoriesEnum;

typedef enum {
    REMOTE_MP3,
    REMOTE_YOUTUBE
} remoteContentType;

@interface MoreViewController : UITableViewController {
    UITableView *mTableView;
    NSDictionary *mTableContents;
    NSArray *mKeys;
    Reachability *mInternetReachable;
}

@property (strong, nonatomic) IBOutlet UITableView *mTableView;

@property (strong, nonatomic) NSDictionary *mTableContents;
@property (strong, nonatomic) NSArray *mKeys;

@property (nonatomic, strong) Reachability *mInternetReachable;

- (void)movieFinishedCallback:(NSNotification*)notification;

@end
