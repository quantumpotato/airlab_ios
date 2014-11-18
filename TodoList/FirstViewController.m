//
//  FirstViewController.m
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

#pragma mark View Cycle

- (id)init {
    self = [self initWithNibName:@"FirstViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Tasks";
    self.tasks = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        NSString *newTask = [NSString stringWithFormat:@"Task #%d", i + 1];
        [self.tasks addObject:newTask];
    }
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



@end
