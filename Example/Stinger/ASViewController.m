//
//  ASViewController.m
//  Stinger
//
//  Created by Assuner on 12/05/2017.
//  Copyright (c) 2017 Assuner. All rights reserved.
//

#import "ASViewController.h"
#import <Stinger/Stinger.h>

@interface ASViewController ()

- (IBAction)test:(id)sender;

@end

@implementation ASViewController

- (void)methodA {
  
}

- (void)setFrame:(CGRect)rect {
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.class st_hookInstanceMethod:@selector(methodA) option:STOptionBefore usingIdentifier:@"hook methodA before" withBlock:^(id<StingerParams> params) {
    
  }];
  [self.class st_hookInstanceMethod:@selector(methodA) option:STOptionAfter usingIdentifier:@"hook methodA after" withBlock:^(id<StingerParams> params) {
    
  }];
  [self st_hookInstanceMethod:@selector(setFrame:) option:STOptionBefore usingIdentifier:@"hook setFrame: before" withBlock:^(id<StingerParams> params, CGRect rect) {
    NSLog(@"%@!!!!", [NSValue valueWithCGRect:rect]);
  }];
}

- (IBAction)test:(id)sender {
  for (NSInteger i = 0; i < 100000; i++) {
    [self methodA];
  }
  NSLog(@"clicked!!");
  [self setFrame:CGRectMake(1, 1, 1, 1)];
}
@end
