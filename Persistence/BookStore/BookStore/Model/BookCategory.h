//
//  BookCategory.h
//  BookStore
//
//  Created by Powers, Patrick (US - Orlando) on 9/22/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface BookCategory : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *books;
@end

@interface BookCategory (CoreDataGeneratedAccessors)

- (void)addBooksObject:(Book *)value;
- (void)removeBooksObject:(Book *)value;
- (void)addBooks:(NSSet *)values;
- (void)removeBooks:(NSSet *)values;

@end
