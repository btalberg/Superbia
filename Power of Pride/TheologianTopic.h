//
//  TheologianTopic.h
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString *const THEOLOGIAN_TOPIC_MODEL_NAME;

@class Theologian, Topic;

@interface TheologianTopic : NSManagedObject

@property (nonatomic, retain) NSString * position;
@property (nonatomic, retain) Topic *topic;
@property (nonatomic, retain) Theologian *theologian;

+ (TheologianTopic *) createInContext:(NSManagedObjectContext *)context;

@end
