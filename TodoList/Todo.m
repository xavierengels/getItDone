

#import "Todo.h"

@implementation Todo
- (instancetype)init{
    self = [super init];
    if (self){
        self.name = @"unnamed";
        self.details = @"no details";
        self.dueDate = [NSDate date];
    }
    
    return self;
}
@end
