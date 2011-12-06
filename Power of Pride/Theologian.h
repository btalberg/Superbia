//
//  Theologian.h
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString *const THEOLOGIAN_MODEL_NAME;

@interface Theologian : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * born;
@property (nonatomic, retain) NSDate * died;
@property (nonatomic, retain) NSString * bio;
@property (nonatomic, retain) NSString * themes;
@property (nonatomic, retain) NSSet *theologianTopics;

+ (Theologian *) createInContext:(NSManagedObjectContext *)context;
+ (Theologian *) fetchInContext:(NSManagedObjectContext *)context 
                       withName:(NSString *)a_name;
+ (Theologian *) fetchAugustineInContext:(NSManagedObjectContext *)context;
+ (Theologian *) fetchNiebuhrInContext:(NSManagedObjectContext *)context;
+ (Theologian *) fetchMalcolmInContext:(NSManagedObjectContext *)context;

@end

@interface Theologian (CoreDataGeneratedAccessors)

- (void)addTheologianTopicsObject:(NSManagedObject *)value;
- (void)removeTheologianTopicsObject:(NSManagedObject *)value;
- (void)addTheologianTopics:(NSSet *)values;
- (void)removeTheologianTopics:(NSSet *)values;

@end
