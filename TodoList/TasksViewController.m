//
//  FirstViewController.m
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import "TasksViewController.h"
#import "AIRFileHelpers.h"

@implementation TasksViewController

#pragma mark View Cycle

- (id)init {
    self = [self initWithNibName:@"TasksViewController" bundle:nil];
    return self;
}

- (void)setupNewTaskButton {
    UIBarButtonItem *newTaskButton = [[UIBarButtonItem alloc] initWithTitle:@"+"
                                                                      style:UIBarButtonItemStyleDone target:self
                                                                     action:@selector(newTapped)];
    
    self.navigationItem.rightBarButtonItem = newTaskButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Tasks";
    [self loadTasks];

    [self setupNewTaskButton];
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

#pragma mark Task Loading

- (NSString *)taskPath {
    return [AIRFileHelpers documentsPathWithPath:@"tasks"];
}

- (void)syncTasks {
    [self.tasks writeToFile:[self taskPath] atomically:true];
}

- (void)loadTasks {
    NSString *taskPath = [AIRFileHelpers documentsPathWithPath:@"tasks"];
    
    if ([AIRFileHelpers fileExistsAtPath:taskPath]) {
        self.tasks = [NSMutableArray arrayWithArray:[NSArray arrayWithContentsOfFile:[self taskPath]]];
    } else {
        self.tasks = [NSMutableArray array];
    }
}

- (void)newTapped {
    CreateTaskViewController *vc = [[CreateTaskViewController alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:true];
}

#pragma mark UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"taskCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    NSString *task = self.tasks[indexPath.row];
    cell.textLabel.text = task;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tasks removeObjectAtIndex:indexPath.row];
    [self syncTasks];
    [self.tableView reloadData];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

#pragma mark CreateTaskDelegate

- (void)createdTask:(NSString *)task {
    [self.tasks addObject:task];
    [self syncTasks];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:true];
}


@end
