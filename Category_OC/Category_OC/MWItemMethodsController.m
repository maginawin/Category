//
//  MWItemMethodsController.m
//  Category_OC
//
//  Created by wangwendong on 16/7/14.
//  Copyright © 2016年 maginawin. All rights reserved.
//

#import "MWItemMethodsController.h"
#import "NSDate+MW.h"
#import "NSString+MW.h"

@interface MWItemMethodsController ()

@property (strong, nonatomic) NSArray *functions;

@end

@implementation MWItemMethodsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _categoryName;
    
    NSString *functionsPath = [NSString stringWithFormat:@"%@/%@%@", [NSBundle mainBundle].resourcePath, _categoryName, @"_Functions.plist"];
    _functions = [NSArray arrayWithContentsOfFile:functionsPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate And Datasource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self handleDidSelectRowAtIndexPath:indexPath.copy];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _functions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionsCell" forIndexPath:indexPath];
    
    cell.textLabel.text = _functions[indexPath.row];
    
    return cell;
}

#pragma mark - Private

- (void)handleDidSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *functionName = _functions[indexPath.row];
    
    NSString *title = nil;
    NSString *message = nil;
    
    if ([_categoryName isEqualToString:@"NSDate+MW"]) {
        NSDate *now = [NSDate date];        
        
        if ([functionName isEqualToString:@"year"]) {
            title = @(now.year).stringValue;
        } else if ([functionName isEqualToString:@"month"]) {
            title = @(now.month).stringValue;
        } else if ([functionName isEqualToString:@"day"]) {
            title = @(now.day).stringValue;
        } else if ([functionName isEqualToString:@"minute"]) {
            title = @(now.minute).stringValue;
        } else if ([functionName isEqualToString:@"hour"]) {
            title = @(now.hour).stringValue;
        } else if ([functionName isEqualToString:@"second"]) {
            title = @(now.second).stringValue;
        } else if ([functionName isEqualToString:@"weekday"]) {
            title = @(now.weekday).stringValue;
        } else if ([functionName isEqualToString:@"weekdayOrdinal"]) {
            title = @(now.weekdayOrdinal).stringValue;
        } else if ([functionName isEqualToString:@"hhmm"]) {
            title = now.hhmm.copy;
        } else if ([functionName isEqualToString:@"hhmmss"]) {
            title = now.hhmmss.copy;
        } else if ([functionName isEqualToString:@"yyyyMMddWithSeparator"]) {
            title = [now yyyyMMddWithSeparator:@"-"];
            message = @"-";
        } else if ([functionName isEqualToString:@"yyyyMMddWithDateSeparator"]) {
            title = [now yyyyMMddWithDateSeparator:@"/"];
            message = @"/";
        }
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
}

@end
