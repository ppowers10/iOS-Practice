//
//  ViewController.m
//  WordList
//
//  Created by Powers, Patrick (US - Orlando) on 9/23/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Persistence.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateStatistics];
}

- (void)updateStatistics {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.textView.text = [appDelegate.persistence statistics];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadTapped:(id)sender {
    [(UIButton *)sender setHidden:YES];
    
    NSURL *url = [NSURL URLWithString:@"https://dotnetperls-controls.googlecode.com/files/enable1.txt"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"Loading words");
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSString *words = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        if (words != nil && statusCode == 200) {
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [appDelegate.persistence loadWordList:words];
        }else {
            NSLog(@"Error: %lu", statusCode);
            if (connectionError != NULL) {
                NSLog(@"Error %@", [connectionError localizedDescription]);
            }
        }
        [(UIButton *)sender setHidden:NO];
        [self updateStatistics];
    }];
    
}

@end
