//
//  ETViewController.m
//  ExactTime
//
//  Created by Joshua Howland on 6/16/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ETViewController.h"
#import "AFNetworking.h"

@interface ETViewController ()

@end

@implementation ETViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.timeapi.org/utc/now"]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    //example if stuff coming back is JSON
    //JSON seriallizer
    [operation setCompletionBlockWithSuccess:
     ^(AFHTTPRequestOperation *operation, NSData *responseObject)
        {
            NSLog(@"THE TIME: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        }
                                     failure:
     ^(AFHTTPRequestOperation *operation, NSError *error)
        {
            NSLog(@"Failure");
        }
     ];
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
