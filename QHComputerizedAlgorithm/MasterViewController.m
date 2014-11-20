//
//  MasterViewController.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-18.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSArray *arKey;
@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    [self initData];
//    self.tableView.reloadData;
}

- (void)initData
{
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    {
        NSMutableArray *arTmp = [NSMutableArray new];
        [arTmp addObject:@[@"1、数据压缩之游程编码", @"十分简单的无损数据压缩算法"]];
        [arTmp addObject:@[@"2、数据压缩之位图压缩算法", @"这个算法适用于任何数据结构"]];
        [arTmp addObject:@[@"3、数据压缩之图编码和模式替换", @"游程编码有两种变形"]];
        [arTmp addObject:@[@"4、数据压缩之相对编码", @"另一种数据压缩算法"]];
        [arTmp addObject:@[@"5、数据压缩之前缀编码（前向编码）", @"另一个通过移除冗余数据来降低数据量的算法"]];
        
        [self.objects addObject:@[@"一、计算机算法：数据压缩", arTmp]];
    }
    {
        NSMutableArray *arTmp = [NSMutableArray new];
        [arTmp addObject:@[@"1、栈和队列", @"简单介绍栈(Stack)和队列(Queue)的实现"]];
        
        [self.objects addObject:@[@"二、浅谈算法和数据结构", arTmp]];
    }
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *object = [((NSArray *)[((NSArray *)[self.objects objectAtIndex:indexPath.section]) objectAtIndex:1]) objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:@[indexPath, object]];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.objects.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)[((NSArray *)[self.objects objectAtIndex:section]) objectAtIndex:1]).count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return (NSString *)[((NSArray *)[self.objects objectAtIndex:section]) objectAtIndex:0];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSArray *object = [((NSArray *)[((NSArray *)[self.objects objectAtIndex:indexPath.section]) objectAtIndex:1]) objectAtIndex:indexPath.row];
    cell.textLabel.text = [object objectAtIndex:0];
    cell.detailTextLabel.text = [object objectAtIndex:1];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
