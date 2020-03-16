#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    if ([n intValue] > 6) {
        return @"-1";
    }
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *maxNum = [f numberFromString: [self maxNum: s]];
    NSNumber *currentNum = [f numberFromString:s];
    
    while ([maxNum intValue] > [currentNum intValue]) {
        maxNum = [[NSNumber alloc] initWithInt: [maxNum intValue] - 1];
        if ([self isPolindrome: [maxNum stringValue]] && [[self countOfChanges:[maxNum stringValue] current: s] intValue] == [k intValue]) {
            return [maxNum stringValue];
        }
    }
    return @"-1";
}

- (BOOL) isPolindrome: (NSString*) num {
    if ([num isEqualToString: [self reverseString:num]]) {
        return YES;
    } else {
        return NO;
    }
}


- (NSString*) maxNum: (NSString*) count {
    NSMutableString *result = [[NSMutableString alloc] init];
    for (int i = 0; i < [count length]; i++) {
        [result appendString:@"9"];
    }
    return result;
}

- (NSString *)reverseString:(NSString *)input {
    NSUInteger len = [input length];
    unichar *buffer = malloc(len * sizeof(unichar));
    if (buffer == nil) return nil; // error!
    [input getCharacters:buffer];

    // reverse string; only need to loop through first half
    for (NSUInteger stPos=0, endPos=len-1; stPos < len/2; stPos++, endPos--) {
        unichar temp = buffer[stPos];
        buffer[stPos] = buffer[endPos];
        buffer[endPos] = temp;
    }

    return [[NSString alloc] initWithCharactersNoCopy:buffer length:len freeWhenDone:YES];
}

- (NSNumber*)countOfChanges: (NSString*) polindrom current:(NSString*) num {
    int c = 0;
    for (int i = 0; i < [polindrom length]; i++) {
        if ([polindrom characterAtIndex: i] != [num characterAtIndex:i]) {
            c++;
        }
    }
    return [NSNumber numberWithInt: c];
}

@end
