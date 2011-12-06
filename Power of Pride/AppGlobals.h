//
//  AppGlobals.h
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppGlobals : NSObject {
    NSManagedObjectContext *mManagedObjectContext;
}

@property (strong, nonatomic) NSManagedObjectContext *mManagedObjectContext;

/**
 Singleton
 */
+ (AppGlobals *) sharedInstance;

+ (NSManagedObjectContext *) context;

@end
