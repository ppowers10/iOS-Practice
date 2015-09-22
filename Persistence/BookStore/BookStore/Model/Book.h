//
//  Book.h
//  BookStore
//
//  Created by Powers, Patrick (US - Orlando) on 9/22/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BookCategory, Page;

@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) BookCategory *category;
@property (nonatomic, retain) NSOrderedSet *pages;
@end

@interface Book (CoreDataGeneratedAccessors)

- (void)insertObject:(Page *)value inPagesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromPagesAtIndex:(NSUInteger)idx;
- (void)insertPages:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removePagesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInPagesAtIndex:(NSUInteger)idx withObject:(Page *)value;
- (void)replacePagesAtIndexes:(NSIndexSet *)indexes withPages:(NSArray *)values;
- (void)addPagesObject:(Page *)value;
- (void)removePagesObject:(Page *)value;
- (void)addPages:(NSOrderedSet *)values;
- (void)removePages:(NSOrderedSet *)values;
@end
