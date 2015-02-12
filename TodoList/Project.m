//
//  Project.m
//  TodoList
//
//  Created by xavier engels on 11/02/2015.
//

#import "Project.h"

@implementation Project
- (instancetype)init{
    self = [super init];
    if (self){
        self.nameProject = @"unnamed";
        self.detailsProject = @"no details";
        self.dueDateProject = [NSDate date];
    }
    
    return self;
}
@end
