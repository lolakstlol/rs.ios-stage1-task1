#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray<NSNumber*> *mutableBill = [[NSMutableArray alloc] initWithArray: bill];
    [mutableBill removeObjectAtIndex: index];
    NSNumber * sumArray = [mutableBill valueForKeyPath:@"@sum.self"];
    if ([sumArray intValue] / 2 == [sum intValue]) {
        return @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%d", ([sum intValue] - [sumArray intValue] / 2)];
    }
    return @"";
}

@end
