//
//  AppGlobals.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "AppGlobals.h"
#import "GCDSingleton.h"

@implementation AppGlobals

@synthesize mManagedObjectContext;

+ (AppGlobals *) sharedInstance
{
    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
        return [[self alloc] init];
    });
}

+ (NSManagedObjectContext *) context {
    //return the context
    return [AppGlobals sharedInstance].mManagedObjectContext;
}

@end
