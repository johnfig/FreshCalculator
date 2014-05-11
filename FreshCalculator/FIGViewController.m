//
//  FIGViewController.m
//  FreshCalculator
//
//  Created by John Figueiredo on 3/10/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import "FIGViewController.h"

@interface FIGViewController ()
@property (weak, nonatomic) IBOutlet UILabel *calulatorDisplay;

@end

@implementation FIGViewController

- (void)viewDidLoad {
  [super viewDidLoad];
	[self setCalculatorDisplay];
}

#pragma mark - Private Methods
- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

- (void)setCalculatorDisplay {
  CGSize screenSize = [[UIScreen mainScreen] bounds].size;
  if (screenSize.height > 480.0f) {
    [self.calulatorDisplay setFont: [UIFont fontWithName:@"HelveticaNeue" size:80.0f]];
  }
}

@end
