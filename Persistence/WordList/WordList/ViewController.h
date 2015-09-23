//
//  ViewController.h
//  WordList
//
//  Created by Powers, Patrick (US - Orlando) on 9/23/15.
//  Copyright (c) 2015 Powers, Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *textView;
- (IBAction)loadTapped:(id)sender;

@end

