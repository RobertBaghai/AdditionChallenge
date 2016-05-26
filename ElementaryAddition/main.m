//
//  main.m
//  ElementaryAddition
//
//  Created by Robert Baghai on 5/26/16.
//  Copyright © 2016 Robert Baghai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Addition.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Addition *one = [Addition new];
        NSLog(@"%@",[one arrayFromInteger:123]);
        
        Addition *two = [Addition new];
        NSLog(@"%@",[two bigAdderWithValueOne:12345 andValueTwo:12]);
        
    }
    return 0;
}
