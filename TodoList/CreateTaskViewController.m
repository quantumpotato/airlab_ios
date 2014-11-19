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
    [self.taskField becomeFirstResponder];
    
//    UIView *box = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 70, 30)];
//    box.backgroundColor = [UIColor blueColor];
//    box.alpha = .7;
//    [self.view addSubview:box];
//    
//    box.userInteractionEnabled = true;
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(saveTapped)];
//    
//    [box addGestureRecognizer:tap];
}

- (IBAction)saveTapped {
    NSString *task = self.taskField.text;
    [self.delegate createdTask:task];
}



@end
