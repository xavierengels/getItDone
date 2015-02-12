//
//  Project.h
//  TodoList
//
//  Created by xavier engels on 11/02/2015.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject
@property (strong, nonatomic) NSString *nameProject;
@property (strong, nonatomic) NSString *detailsProject;
@property (strong, nonatomic) NSDate *dueDateProject;
@property (assign, nonatomic) BOOL doneProject;
@end
