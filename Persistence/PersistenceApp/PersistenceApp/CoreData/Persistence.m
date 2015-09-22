//
//  Persistence.m
//  PersistenceApp
//
//  Created by Powers, Patrick (US - Orlando) on 9/21/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import "Persistence.h"

@implementation Persistence



- (void) saveContext {
    NSError *error; if ([self.managedObjectContext hasChanges] && ![ self.managedObjectContext save:& error]) {
        NSLog(@" Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (NSURL *) applicationDocumentsDirectory {
    return [[[ NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

    
    
@end
