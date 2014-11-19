//
//  CreateTaskViewController.h
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TaskDelegate <NSObject>

- (void)createdTask:(NSString *)task;
- (void)editedTask:(NSString *)task fromOldTask:(NSString *)oldTask;

@end

@interface CreateTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *taskField;

@property (nonatomic, assign) id <TaskDelegate> delegate;

- (IBAction)saveTapped;

@end
