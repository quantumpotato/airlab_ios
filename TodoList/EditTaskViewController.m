//
//  EditTaskViewController.m
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import "EditTaskViewController.h"

@implementation EditTaskViewController

- (id)initWithTask:(NSString *)oldTask {
    self = [super init];
    self.oldTask = oldTask;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.taskField.text = self.oldTask;
}

- (IBAction)saveTapped {
    [self.delegate editedTask:self.taskField.text fromOldTask:self.oldTask];
}

@end
