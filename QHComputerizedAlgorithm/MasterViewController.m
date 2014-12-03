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
        [arTmp addObject:@[@"2、基本排序算法", @"排序与我们日常生活中息息相关"]];
        [arTmp addObject:@[@"3、合并排序", @"将两个有序的序列合并为一个大的有序的序列的方式来实现排序。"]];
        [arTmp addObject:@[@"4、快速排序", @"它也是一种采用分治法解决问题的一个典型应用"]];
        [arTmp addObject:@[@"5、优先级队列与堆排序", @"二叉堆是一个近似完全二叉树的结构"]];
        [arTmp addObject:@[@"6、符号表及其基本实现", @"名为符号表（Symbol Table）的抽象数据结构"]];
        [arTmp addObject:@[@"7、二叉查找树", @"也称有序二叉树（ordered binary tree）,排序二叉树（sorted binary tree）"]];
        [arTmp addObject:@[@"8、平衡查找树之2-3树", @"实现起来比较复杂，在某些情况插入后的平衡操作可能会使得效率降低。"]];
        [arTmp addObject:@[@"9、平衡查找树之红黑树", @"像是对2-3查找树进行编码，尤其是对2-3查找树中的3-nodes节点添加额外的信息。"]];
        [arTmp addObject:@[@"10、平衡查找树之B树", @"是一个节点可以拥有多于2个子节点的二叉查找树"]];
        [arTmp addObject:@[@"11、哈希表", @"以 键-值(key-indexed) 存储数据的结构"]];
        
        [self.objects addObject:@[@"二、浅谈算法和数据结构", arTmp]];
    }
    {
        NSMutableArray *arTmp = [NSMutableArray new];
        [arTmp addObject:@[@"1、基数估计", @""]];
        [arTmp addObject:@[@"2、BK树", @""]];
        [arTmp addObject:@[@"3、喷泉码", @""]];
        [arTmp addObject:@[@"4、同型哈希", @""]];
        
        [self.objects addObject:@[@"三、超酷算法", arTmp]];
    }
    {
        NSMutableArray *arTmp = [NSMutableArray new];
        [arTmp addObject:@[@"1、一道位运算的算法题", @""]];
        
        [self.objects addObject:@[@"四、算法题库", arTmp]];
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
