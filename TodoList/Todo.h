

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Todo : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *details;
@property (strong, nonatomic) NSDate *dueDate;
@property (assign, nonatomic) BOOL done;
@end
