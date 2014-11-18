//
//  CreateTaskViewController.h
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreateTaskDelegate <NSObject>

- (void)createdTask:(NSString *)task;

@end

@interface CreateTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *taskField;

@property (nonatomic, assign) id <CreateTaskDelegate> delegate;

- (IBAction)saveTapped;

@end
