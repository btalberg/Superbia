//
//  Theologian.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "Theologian.h"


@implementation Theologian

NSString *const THEOLOGIAN_MODEL_NAME = @"Theologian";

@dynamic name;
@dynamic cityborn;
@dynamic citydied;
@dynamic dateborn;
@dynamic datedied;
@dynamic bio;
@dynamic themes;
@dynamic theologianTopics;


+ (Theologian *) createInContext:(NSManagedObjectContext *)context
{
    
    return [NSEntityDescription insertNewObjectForEntityForName:THEOLOGIAN_MODEL_NAME
                                         inManagedObjectContext:context];
}

+ (Theologian *) fetchInContext:(NSManagedObjectContext *)context 
                  withName:(NSString *)a_name
{
    if(!a_name) return nil;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:[NSEntityDescription entityForName:THEOLOGIAN_MODEL_NAME inManagedObjectContext:context]];
	[request setPredicate:[NSPredicate predicateWithFormat:@"name = %@", a_name]];
	
	NSError *fetchError = nil;
	NSArray *results = [context executeFetchRequest:request error:&fetchError];
	
	Theologian *theologian = nil;
	
	if(results && results.count > 0)
		theologian = (Theologian *)[results lastObject];
    
	return theologian;
}

+ (Theologian *) fetchAugustineInContext:(NSManagedObjectContext *)context
{
    return [self fetchInContext:context withName:@"Augustine of Hippo"];
}

+ (Theologian *) fetchNiebuhrInContext:(NSManagedObjectContext *)context
{
    return [self fetchInContext:context withName:@"Reinhold Niebuhr"];
}

+ (Theologian *) fetchMalcolmInContext:(NSManagedObjectContext *)context
{
    return [self fetchInContext:context withName:@"Malcolm X"];
}

- (UIImage *) avatar
{
    if ([self.name isEqualToString:@"Augustine of Hippo"]) {
        return [UIImage imageNamed: @"augustine_avatar.png"];
    } else if ([self.name isEqualToString:@"Reinhold Niebuhr"]) {
        return [UIImage imageNamed: @"niebuhr_avatar.png"];
    } else if ([self.name isEqualToString:@"Malcolm X"]) {
        return [UIImage imageNamed: @"malcolm_avatar.png"];
    } else {
        return nil;
    }
}

@end
