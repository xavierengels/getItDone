

#import <Foundation/Foundation.h>

@interface Todo : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *details;
@property (strong, nonatomic) NSDate *dueDate;
@property (strong, nonatomic) NSString *edit;
@property (assign, nonatomic) BOOL done;
@end
