//
//  Topic.h
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString *const TOPIC_MODEL_NAME;

@interface Topic : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *theologianTopics;

+ (Topic *) createInContext:(NSManagedObjectContext *)context;
+ (Topic *) fetchInContext:(NSManagedObjectContext *)context 
                  withName:(NSString *)a_name;
+ (NSArray *) fetchAllInContext:(NSManagedObjectContext *)context;
@end

@interface Topic (CoreDataGeneratedAccessors)

- (void)addTheologianTopicsObject:(NSManagedObject *)value;
- (void)removeTheologianTopicsObject:(NSManagedObject *)value;
- (void)addTheologianTopics:(NSSet *)values;
- (void)removeTheologianTopics:(NSSet *)values;

@end
