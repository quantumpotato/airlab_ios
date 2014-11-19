//
//  FirstViewController.h
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateTaskViewController.h"

@interface TasksViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, CreateTaskDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *tasks;

@end

