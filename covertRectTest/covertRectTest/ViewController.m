//
//  ViewController.m
//  covertRectTest
//
//  Created by GiantAxe on 16/9/12.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTableView];
}

- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    CGRect rect = self.label.frame;
//    CGRect rect = [tableView convertRect:self.sw.frame toView:nil];
    NSLog(@"%zd", rect);
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 5)
    {
        UITableViewCell *cell = [UITableViewCell new];
        UILabel *label = [UILabel new];
        label.text = @"111";
//        [label sizeToFit];
        label.frame = CGRectMake(0, 0, 100, 30);
        [cell addSubview:label];
        self.label = label;
        return cell;
    }
    else
    {
        return [[UITableViewCell alloc] init];
    }

}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
