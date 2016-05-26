//
//  Addition.m
//  ElementaryAddition
//
//  Created by Robert Baghai on 5/26/16.
//  Copyright © 2016 Robert Baghai. All rights reserved.
//

#import "Addition.h"

@implementation Addition

/*
 *Adds two numbers Together using elementary addition logic
 *Prints the sum in the format of an array
 */

- (NSMutableArray*)bigAdderWithValueOne:(int)valOne andValueTwo:(int) valTwo {
    
    NSMutableArray *integerArrayOne = [self arrayFromInteger:valOne];
    NSMutableArray *integerArrayTwo = [self arrayFromInteger:valTwo];
    NSMutableArray *sum             = [NSMutableArray new];
    NSNumber       *value           = 0;
    NSNumber       *carryOver       = 0;
    NSMutableArray *largerArray;
    NSMutableArray *smallerArray;
    
    //check to see how many iterations we have to do based on both array lengths
    if (integerArrayOne.count >= integerArrayTwo.count)  largerArray = integerArrayOne, smallerArray = integerArrayTwo;
    else                                                 largerArray = integerArrayTwo, smallerArray = integerArrayOne;
    
    for(NSInteger i = largerArray.count - 1; i >= 0; i--) {
        
        if (smallerArray.count < largerArray.count) {   //to make arrays the same length, append 0's to smaller array
            unsigned long arraySizeDifferential = largerArray.count - smallerArray.count;
            for (int i = 0; i < arraySizeDifferential; i++) {
                [smallerArray insertObject:@0 atIndex:0];
            }
        }
        
        value = @([largerArray[i] intValue] + [smallerArray[i] intValue]);
        
        if([carryOver intValue] > @(0).intValue) { //if there is an existing carryOver number, we add it to the current value and reset remainder back to 0
            value = @([value intValue] + [carryOver intValue]);
            carryOver = @0;
        }
        
        if ([value intValue] > @(9).intValue) { //if the 'value' is >= 10, get the remainder to use for next iteration in the loop
            NSMutableArray *arr = [self arrayFromInteger:[value intValue]]; //array will never have a count greater than 2
            carryOver = arr[0];
            value     = arr[1];
        }
        
        [sum insertObject:value atIndex:0];
    }
    
    if([carryOver intValue] > @(0).intValue) { //makes sure the carryOver of the last iteration gets used if needed
        [sum insertObject:carryOver atIndex:0];
    }
    
    return sum;
}


/*
 *Takes an integer as an argument and converts it into an array of integers
 */
- (NSMutableArray*)arrayFromInteger:(int)value {
    
    NSMutableArray *arrayOfIntegers = [NSMutableArray new];
    NSString       *tempString      = [NSString stringWithFormat:@"%d",value];
    
    for(int i = 0; i < tempString.length; i++) {
        unichar temp = [tempString characterAtIndex:i];
        [arrayOfIntegers addObject:@(temp - '0')]; //converts the ASCII value to it's integer counterpart
    }
    return arrayOfIntegers;
}


@end
