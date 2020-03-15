#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *preResult = [[NSMutableArray alloc] init];
    if ([sadArray count] < 3) {
        return sadArray;
    }
    [preResult addObject: [sadArray objectAtIndex: 0]];
    for (int i = 1; i < [sadArray count] - 1; i++) {
        NSNumber *curentNum = [sadArray objectAtIndex: i];
        NSNumber *preNum = [sadArray objectAtIndex: i - 1];
        NSNumber *nextNum = [sadArray objectAtIndex: i + 1];
        if ([curentNum intValue] < [nextNum intValue] + [preNum intValue]) {
            [preResult addObject: curentNum];
        }
    }
    [preResult addObject: [sadArray objectAtIndex: [sadArray count] - 1]];
    if ([self isHappy: [preResult copy]]) {
        return [preResult copy];
    } else {
        preResult = [self convertToHappy: [preResult copy]];
    }
    return [preResult copy];
}

- (BOOL)isHappy:(NSArray *)array {
    for (int i = 1; i < [array count] - 1; i++) {
        NSNumber *curentNum = [array objectAtIndex: i];
        NSNumber *preNum = [array objectAtIndex: i - 1];
        NSNumber *nextNum = [array objectAtIndex: i + 1];
        if ([curentNum intValue] > [nextNum intValue] + [preNum intValue]) {
            return false;
        }
    }
    return true;
}

@end
