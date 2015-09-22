//
//  Persistence.h
//  PersistenceApp
//
//  Created by Powers, Patrick (US - Orlando) on 9/21/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface Persistence : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(void)saveContext;
-(NSURL*)applicationDocumentsDirectory;

@end
