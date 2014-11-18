//
//  CreateTaskViewController.m
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import "CreateTaskViewController.h"


@implementation CreateTaskViewController

- (id)init {
    self = [self initWithNibName:@"CreateTaskViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)saveTapped {
    NSString *task = self.taskField.text;
    [self.delegate createdTask:task];
}



@end
