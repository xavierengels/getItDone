//
//  DBManager.h
//  TodoList
//
//  Created by xavier engels on 12/02/2015.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DBManager : NSObject

#pragma mark - singleton creation pattern
+ (id)sharedInstance;

#pragma mark - Generic Core data entity deletion -
- (void)deleteManagedObject:(NSManagedObject *)object;

#pragma mark - Generic Core data Managed Object creation -
- (id)createManagedObjectWithName:(NSString *)entityName;
- (id)createManagedObjectWithClass:(Class)entityClass;
- (id)createTemporaryObjectWithClass:(Class)entityClass;

#pragma mark - DB features
- (BOOL)persistData;
- (void)refreshObject:(NSManagedObject *)managedObject mergeChanges:(BOOL)flag;


#pragma mark - Domain related feature -
- (NSArray *)fetchTodos;
@end
