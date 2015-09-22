//
//  Persistence.m
//  PersistenceApp
//
//  Created by Powers, Patrick (US - Orlando) on 9/21/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import "Persistence.h"

@implementation Persistence

- (id) init {
    self = [super init];
    if (self != nil) {
        //Initialize the managed object model
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"PersistenceApp" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        
        //Initialize the persistent store coordinator
        NSURL *storeURL = [[self applicationDocumentsDirectory]  URLByAppendingPathComponent:@"PersistenceApp.sqlite"];
        
        NSError *error = nil;
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        //Initialize the managed object context
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    }
    return self;
}

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
