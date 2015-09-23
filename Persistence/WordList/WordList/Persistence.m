//
//  Persistence.m
//  WordList
//
//  Created by Powers, Patrick (US - Orlando) on 9/23/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import "Persistence.h"

@implementation Persistence

- (id) init {
    self = [super init];
    if (self != nil) {
        //Initialize the managed object model
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"WordList" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        
        //Initialize the persistent store coordinator
        NSURL *storeURL = [[self applicationDocumentsDirectory]  URLByAppendingPathComponent:@"WordList.sqlite"];
        
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

- (void)saveContext {
    NSError *error = nil;
    if ([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)deleteAllObjectsForEntityWithName:(NSString *)name {
    NSLog(@"Deleting all objects with entity %@", name);
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:name];
    fetchRequest.resultType = NSManagedObjectIDResultType;
    
    NSArray *objectIDs = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    for (NSManagedObjectID *objectID in objectIDs) {
        [self.managedObjectContext deleteObject:[self.managedObjectContext objectWithID:objectID]];
    }
    [self saveContext];
}
- (void)loadWordList:(NSString *)wordList {
    [self deleteAllObjectsForEntityWithName:@"Word"];
    [self deleteAllObjectsForEntityWithName:@"WordCategory"];
    
    NSMutableDictionary *wordCategories = [NSMutableDictionary dictionaryWithCapacity:26];
    for (char c = 'a'; c <= 'z'; c++) {
        NSString *firstLetter = [NSString stringWithFormat:@"%c", c];
        NSManagedObject *wordCategory = [NSEntityDescription insertNewObjectForEntityForName:@"WordCategory" inManagedObjectContext:self.managedObjectContext];
        [wordCategory setValue:firstLetter forKey:@"firstLetter"];
        [wordCategories setValue:wordCategory forKey:firstLetter];
        NSLog(@"Added category '%@'", firstLetter);
    }
    
    NSUInteger wordsAdded = 0;
    NSArray *newWords = [wordList componentsSeparatedByCharactersInSet:[ NSCharacterSet whitespaceAndNewlineCharacterSet]];
    for (NSString *word in newWords) {
        if (word.length > 0) {
            NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:self.managedObjectContext];
            [object setValue:word forKey:@"text"];
            [object setValue:[ NSNumber numberWithInteger:word.length] forKey:@"length"];
            [object setValue:[ wordCategories valueForKey:[word substringToIndex:1]] forKey:@"wordCategory"];
            ++wordsAdded;
            if (wordsAdded % 100 == 0)
                NSLog(@"Added %lu words", wordsAdded);
        }
    }
    NSLog(@"Added %lu words", wordsAdded);
    [self saveContext];
    NSLog(@"Context saved");
}

- (NSString *)statistics {
    NSMutableString *string = [[NSMutableString alloc] init];
    [string appendString:[self wordCount]];
    return string;
}

- (NSString *)wordCount {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Word"];
    NSUInteger count = [self.managedObjectContext countForFetchRequest:fetchRequest error:nil];
    return [NSString stringWithFormat:@"Word Count: %lu\n", count];
}



@end
