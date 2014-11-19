//
//  EditTaskViewController.h
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateTaskViewController.h"

@interface EditTaskViewController : CreateTaskViewController

@property (strong, nonatomic) NSString *oldTask;

- (id)initWithTask:(NSString *)oldTask;

@end
