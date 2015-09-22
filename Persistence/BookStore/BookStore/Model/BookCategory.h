//
//  BookCategory.h
//  BookStore
//
//  Created by Powers, Patrick (US - Orlando) on 9/21/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BookCategory : NSManagedObject

@property (nonatomic, retain) NSString * name;

@end
