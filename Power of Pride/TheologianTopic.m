//
//  TheologianTopic.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "TheologianTopic.h"
#import "Theologian.h"
#import "Topic.h"


@implementation TheologianTopic

NSString *const THEOLOGIAN_TOPIC_MODEL_NAME = @"TheologianTopic";

@dynamic position;
@dynamic theologian;
@dynamic topic;

+ (TheologianTopic *) createInContext:(NSManagedObjectContext *)context
{
    
    return [NSEntityDescription insertNewObjectForEntityForName:THEOLOGIAN_TOPIC_MODEL_NAME 
                                         inManagedObjectContext:context];
}

@end
