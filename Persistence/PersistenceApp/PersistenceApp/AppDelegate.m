//
//  AppDelegate.m
//  PersistenceApp
//
//  Created by Powers, Patrick (US - Orlando) on 9/21/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import "AppDelegate.h"
#import "Persistence.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.persistence = [[Persistence alloc] init];
    [self createObjects];
    [self fetchObjects];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) createObjects {
    NSManagedObject *iPad = [NSEntityDescription insertNewObjectForEntityForName:@"Gadget" inManagedObjectContext:self.persistence.managedObjectContext];
    [iPad setValue:@"iPad" forKey:@"name"];
    [iPad setValue:@499.0f forKey:@"price"];
    
    NSManagedObject *iPadMini = [NSEntityDescription insertNewObjectForEntityForName:@"Gadget" inManagedObjectContext:self.persistence.managedObjectContext];
    [iPadMini setValue:@"iPad Mini" forKey:@"name"];
    [iPadMini setValue:@329.0f forKey:@"price"];
    
    NSManagedObject *iPhone = [NSEntityDescription insertNewObjectForEntityForName:@"Gadget" inManagedObjectContext:self.persistence.managedObjectContext];
    [iPhone setValue:@"iPhone" forKey:@"name"];
    [iPhone setValue:@199.0f forKey:@"price"];
    
    NSManagedObject *iPodTouch = [NSEntityDescription insertNewObjectForEntityForName:@"Gadget" inManagedObjectContext:self.persistence.managedObjectContext];
    [iPodTouch setValue:@"iPod Touch" forKey:@"name"];
    [iPodTouch setValue:@299.0f forKey:@"price"];
    
    [self.persistence saveContext];
}

- (void) fetchObjects {
    NSFetchRequest *fetchReqeust = [NSFetchRequest fetchRequestWithEntityName:@"Gadget"];
    NSArray *fetchArray = [self.persistence.managedObjectContext executeFetchRequest:fetchReqeust error:nil];
    
    for (NSManagedObject *gadget in fetchArray) {
        NSLog(@"%@", gadget);
    }
}

@end
