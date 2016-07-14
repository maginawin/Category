//
//  NSString+MW.m
//  Category_OC
//
//  Created by wangwendong on 16/7/14.
//  Copyright © 2016年 maginawin. All rights reserved.
//

#import "NSString+MW.h"

@implementation NSString (MW)

+ (NSString *)documentsPath {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    return path;
}

@end
