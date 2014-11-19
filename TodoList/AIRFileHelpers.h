//
//  AIRFileHelpers.h
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIRFileHelpers : NSObject

+ (BOOL)fileExistsAtPath:(NSString *)path;
+ (NSString *)documentsPathWithPath:(NSString *)path;
+ (BOOL)fileExistsAtDocumentsPath:(NSString *)fileName;


@end
