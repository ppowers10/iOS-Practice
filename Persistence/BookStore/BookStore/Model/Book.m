//
//  Book.m
//  BookStore
//
//  Created by Powers, Patrick (US - Orlando) on 9/22/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import "Book.h"
#import "BookCategory.h"
#import "Page.h"


@implementation Book

@dynamic title;
@dynamic price;
@dynamic category;
@dynamic pages;

- (void)awakeFromInsert {
    [super awakeFromInsert];
    NSLog(@"New book created");
}

@end
