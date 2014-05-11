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
@property (nonatomic, getter = isStillTypingNumber) BOOL stillTypingNumber;
@property (nonatomic, getter = isNegativeNumber) BOOL negativeNumber;
@end

@implementation FIGViewController

- (void)viewDidLoad {
  [super viewDidLoad];
	[self setCalculatorDisplay];
}

#pragma mark - IBActions
- (IBAction)digitPressed:(id)sender {
  NSString *digit = [[sender titleLabel] text];
  if ([self.calulatorDisplay.text isEqualToString:@"0"]) {
    [self.calulatorDisplay setText:digit];
    self.stillTypingNumber = YES;
  } else if ([self isStillTypingNumber]) {
    [self.calulatorDisplay setText:[[self.calulatorDisplay text] stringByAppendingString:digit]];
  } else {
    [self.calulatorDisplay setText:digit];
    self.stillTypingNumber = YES;
  }
}

- (IBAction)clearButtonPressed:(id)sender {
  [self.calulatorDisplay setText:@"0"];
  self.stillTypingNumber = NO;
}

- (IBAction)percentButtonPressed:(id)sender {
  NSString *string = self.calulatorDisplay.text;
  float number = [string floatValue];
  float percent = number / 100.0f;
  NSString *finalString = [[NSNumber numberWithFloat:percent] stringValue];
  [self.calulatorDisplay setText:finalString];
}

- (IBAction)negativeOrPositiveButonPressed:(id)sender {
  NSString *originalString = self.calulatorDisplay.text;
  
  if ([self isNegativeNumber]) {
    NSString *newString = [originalString substringWithRange:NSMakeRange(1, [originalString length]-1)];
    [self.calulatorDisplay setText:newString];
    self.negativeNumber = NO;
  } else if (![originalString isEqualToString:@"0"]) {
    [self.calulatorDisplay setText:[@"-" stringByAppendingString:originalString]];
    self.negativeNumber = YES;
  }
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
