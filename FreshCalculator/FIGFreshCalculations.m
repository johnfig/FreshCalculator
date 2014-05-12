//
//  FIGFreshCalculations.m
//  FreshCalculator
//
//  Created by John Figueiredo on 5/11/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import "FIGFreshCalculations.h"

@implementation FIGFreshCalculations

- (void)setOperand:(double)anOperand {
  operand = anOperand;
}

- (void)performWaitingOperation {
  if ([@"+" isEqualToString:waitingOperation] ) {
    operand = waitingOperand + operand;
  } else if ([@"-" isEqualToString:waitingOperation]) {
    operand = waitingOperand - operand;
  } else if ([@"x" isEqualToString:waitingOperation]) {
    operand = waitingOperand * operand;
  } else if ([@"÷" isEqualToString:waitingOperation]) {
    operand = waitingOperand / operand;
  }
}

- (double)performOperation:(NSString *)operation {
  [self performWaitingOperation];
  waitingOperation = operation;
  waitingOperand = operand;
  
  return operand;
}

@end
