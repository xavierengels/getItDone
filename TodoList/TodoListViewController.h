

#import <UIKit/UIKit.h>

@interface TodoListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnAddTodo;


@property (weak, nonatomic) IBOutlet UITableView *tableTodos;
@property (weak, nonatomic) IBOutlet UITextField *fieldTodo;

@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSMutableArray *todos;

//@property (copy) void (^blockProperty)(void);
@end

