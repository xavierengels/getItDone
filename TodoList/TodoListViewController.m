

#import "TodoListViewController.h"
#import "TodoDetailViewController.h"
#import "ProjectViewController.h"
#import "Todo.h"

#define TODO_CELL_ID        @"TodoCellIdentifier"
#define SEGUE_TO_DETAIL_ID  @"ListToDetail"
#define SEGUE_TO_PROJECT_ID  @"ListToProject"

@interface TodoListViewController ()
@property (strong, nonatomic) Todo *selectedTodo;
@property (strong, nonatomic) Todo *editTodo;
@property (strong, nonatomic) Project *ToProject;

@end

@implementation TodoListViewController
#pragma mark - Privates
- (void)setupModel{
    self.todos = [@[] mutableCopy];
}

- (void)configureOutlets{
    self.tableTodos.delegate = self;
    self.tableTodos.dataSource = self;
    
    self.dateFormatter = [NSDateFormatter new];
    self.dateFormatter.dateFormat = @"dd/MM/YYYY";
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupModel];
    [self configureOutlets];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableTodos reloadData];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:SEGUE_TO_DETAIL_ID]){
        TodoDetailViewController *controller = segue.destinationViewController;
        controller.todo = self.selectedTodo;
    }
}

#pragma mark - Actions
- (IBAction)didTouchAddButton:(id)sender {
    if ([self.fieldTodo.text isEqualToString:@""])
        return;
    
    Todo *newTodo = [[Todo alloc] init];
    newTodo.name = self.fieldTodo.text;
    newTodo.done = false;
    
    [self.todos addObject:newTodo];
    [self.fieldTodo setText:@""];
    
    [self.tableTodos reloadData];
}
//find the parent cell
-(UITableViewCell *)parentCellForView:(id)theView
{
    id viewSuperView = [theView superview];
    while (viewSuperView != nil) {
        if ([viewSuperView isKindOfClass:[UITableViewCell class]]) {
            return (UITableViewCell *)viewSuperView;
        }
        else {
            viewSuperView = [viewSuperView superview];
        }
    }
    return nil;
}

- (IBAction)editButton:(id)sender {
    UIButton *butn = (UIButton *)sender;
    UITableViewCell *cell = [self parentCellForView:butn];
    if (cell != nil) {
        NSIndexPath *indexPath = [self.tableTodos indexPathForCell:cell];
        NSLog(@"show detail for item at row %d", indexPath.row);
        self.selectedTodo = self.todos[indexPath.row];
    }
}



#pragma mark - UITableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.todos.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableTodos dequeueReusableCellWithIdentifier:TODO_CELL_ID];
    
    
    Todo *todo = self.todos[indexPath.row];
    
    cell.textLabel.text = todo.name;
    cell.backgroundColor = (todo.done)? [UIColor greenColor] : [UIColor lightGrayColor];
    cell.detailTextLabel.text = [self.dateFormatter stringFromDate:todo.dueDate];
    
    return cell;
}



#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedTodo = self.todos[indexPath.row];
    [self performSegueWithIdentifier:SEGUE_TO_PROJECT_ID sender:self];
    
}






@end
