//
//  AIRFileHelpers.m
//  TodoList
//
//  Created by quantum on 18/11/2014.
//  Copyright (c) 2014 AirLabs. All rights reserved.
//

#import "AIRFileHelpers.h"

@implementation AIRFileHelpers

+ (BOOL)fileExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

+ (NSString *)documentsPathWithPath:(NSString *)path {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    return [documentsDirectory stringByAppendingPathComponent:path];
}

+ (BOOL)fileExistsAtDocumentsPath:(NSString *)fileName {
    fileName = [self documentsPathWithPath:fileName];
    return [self fileExistsAtPath:fileName];
}


@end
