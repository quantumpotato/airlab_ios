//
//  FirstViewController.m
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import "TasksViewController.h"
#import "AIRFileHelpers.h"
#import "EditTaskViewController.h"

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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    NSString *task = self.tasks[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Task #%ld", (long)indexPath.row + 1];
    cell.detailTextLabel.text = task;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tasks removeObjectAtIndex:indexPath.row];
    [self syncTasks];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *task = self.tasks[indexPath.row];
    EditTaskViewController *vc = [[EditTaskViewController alloc] initWithTask:task];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:true];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

#pragma mark taskDelegate

- (void)createdTask:(NSString *)task {
    [self.tasks addObject:task];
    [self syncTasks];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:true];
}

- (void)editedTask:(NSString *)task fromOldTask:(NSString *)oldTask {
    NSString *changedTask = nil;
    
    for (NSString *task in self.tasks) {
        if ([task isEqualToString:oldTask]) {
            changedTask = task;
            break;
        }
    }
    
    NSInteger index = [self.tasks indexOfObject:changedTask];
    [self.tasks replaceObjectAtIndex:index withObject:task];
    [self.navigationController popViewControllerAnimated:true];
    [self syncTasks];
    [self.tableView reloadData];
}



@end
