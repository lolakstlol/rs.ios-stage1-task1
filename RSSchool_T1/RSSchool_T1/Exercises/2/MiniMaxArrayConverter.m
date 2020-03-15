#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    
    NSMutableArray<NSNumber *> *arr = [[NSMutableArray alloc] initWithArray:array];
    NSSortDescriptor *lowestToHieghts = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [arr sortUsingDescriptors:[NSArray arrayWithObject:lowestToHieghts]];
    NSNumber *min = [[NSNumber alloc] initWithInt: 0];
    NSNumber *max = [[NSNumber alloc] initWithInt: 0];
    for (int i = 0 ; i < [arr count]; i++) {
        if (i == 0 ) {
            min = [NSNumber numberWithInt:([min intValue] + [arr[i] intValue])];
            continue;
        }
        if (i == [arr count] - 1) {
            max = [NSNumber numberWithInt:([max intValue] + [arr[i] intValue])];
            continue;
        }
        min = [NSNumber numberWithInt:([min intValue] + [arr[i] intValue])];
        max = [NSNumber numberWithInt:([max intValue] + [arr[i] intValue])];
    }
    return @[min,max];
}

@end
