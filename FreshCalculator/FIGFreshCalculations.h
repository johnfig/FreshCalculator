//
//  FIGFreshCalculations.h
//  FreshCalculator
//
//  Created by John Figueiredo on 5/11/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import <Foundation/Foundation.h>

double operand;
NSString *waitingOperation;
double waitingOperand;

@interface FIGFreshCalculations : NSObject
- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;
@end
