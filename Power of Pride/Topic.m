//
//  Topic.m
//  Power of Pride
//
//  Created by Ben Talberg on 12/5/11.
//  Copyright (c) 2011 AppCanny. All rights reserved.
//

#import "Topic.h"


@implementation Topic

NSString *const TOPIC_MODEL_NAME = @"Topic";

@dynamic name;
@dynamic theologianTopics;


+ (Topic *) createInContext:(NSManagedObjectContext *)context
{
    
    return [NSEntityDescription insertNewObjectForEntityForName:TOPIC_MODEL_NAME 
                                         inManagedObjectContext:context];
}

+ (Topic *) fetchInContext:(NSManagedObjectContext *)context 
           withName:(NSString *)a_name
{
    if(!a_name) return nil;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:[NSEntityDescription entityForName:TOPIC_MODEL_NAME inManagedObjectContext:context]];
	[request setPredicate:[NSPredicate predicateWithFormat:@"name = %@", a_name]];
	
	NSError *fetchError = nil;
	NSArray *results = [context executeFetchRequest:request error:&fetchError];
	
	Topic *topic = nil;
	
	if(results && results.count > 0)
		topic = (Topic *)[results lastObject];
    
	return topic;
}

+ (NSArray *) fetchAllInContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:[NSEntityDescription entityForName:TOPIC_MODEL_NAME inManagedObjectContext:context]];
    
    NSError *fetchError = nil;
	NSArray *results = [context executeFetchRequest:request error:&fetchError];
	
	if(results && results.count > 0)
		return results;
    else
        return nil;

}

@end
