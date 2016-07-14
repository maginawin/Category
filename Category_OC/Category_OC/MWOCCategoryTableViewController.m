//
//  MWOCCategoryTableViewController.m
//  Category_OC
//
//  Created by wangwendong on 16/7/14.
//  Copyright © 2016年 maginawin. All rights reserved.
//

#import "MWOCCategoryTableViewController.h"
#import "NSString+MW.h"
#import "MWItemMethodsController.h"

@interface MWOCCategoryTableViewController ()

@property (strong, nonatomic) NSArray *items;

@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation MWOCCategoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *itemsPath = [NSString stringWithFormat:@"%@/%@", [NSBundle mainBundle].resourcePath, @"OCCategoryItems.plist"];
    _items = [NSArray arrayWithContentsOfFile:itemsPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *identifier = segue.identifier;
    
    if ([identifier isEqualToString:@"pushToFunctions"]) {
        MWItemMethodsController *methodsController = (MWItemMethodsController *)segue.destinationViewController;
        methodsController.categoryName = _items[_selectedIndexPath.row];
    }
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    _selectedIndexPath = indexPath.copy;
    
    [self performSegueWithIdentifier:@"pushToFunctions" sender:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OCCategoryItem" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OCCategoryItem"];
    }
    
    cell.textLabel.text = _items[indexPath.row];
    
    return cell;
}


@end
