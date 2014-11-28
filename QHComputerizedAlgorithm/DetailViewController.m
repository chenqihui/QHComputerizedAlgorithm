//
//  DetailViewController.m
//  QHComputerizedAlgorithm
//
//  Created by chen on 14-11-18.
//  Copyright (c) 2014年 chen. All rights reserved.
//

#import "DetailViewController.h"

#import "RunCoding.h"
#import "BitMapCode.h"
#import "MapAndModeCode.h"
#import "RelativeCoding.h"
#import "PrefixionCode.h"

#import "StackAndQueue.h"
#import "BasicSortAlgorithms.h"
#import "MergeSort.h"
#import "QuickSort.h"
#import "PriorityQueueAndHeapSort.h"
#import "SymbolTableDictionary.h"
#import "BinarySearchTree.h"
#import "TwoThreeSearchTree.h"
#import "RedBlackTree.h"
#import "BAndBplusTree.h"
#import "HashTableSort.h"

@interface DetailViewController ()
{
    NSIndexPath *_indexPath;
    NSArray *_arData;
}

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem)
    {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem)
    {
        _indexPath = [self.detailItem objectAtIndex:0];
        _arData = [self.detailItem objectAtIndex:1];
        
        self.navigationItem.title = [_arData objectAtIndex:0];
        
        switch (_indexPath.section)
        {
            case 0:
            {
                BasicCodeObject *coding = nil;
                switch (_indexPath.row)
                {
                    case 0:
                        coding = [RunCoding new];
                        break;
                    case 1:
                        coding = [BitMapCode new];
                        break;
                    case 2:
                        coding = [MapAndModeCode new];
                        break;
                    case 3:
                        coding = [RelativeCoding new];
                        break;
                    case 4:
                        coding = [PrefixionCode new];
                        break;
                        
                    default:
                        break;
                }
                if (coding != nil)
                {
                    [coding runingCode];
                }
                break;
            }
            case 1:
            {
                BasicAlgorithmsAndDataStructuresObject *dataSA = nil;
                switch (_indexPath.row)
                {
                    case 0:
                        dataSA = [StackAndQueue new];
                        break;
                    case 1:
                        dataSA = [BasicSortAlgorithms new];
                        break;
                    case 2:
                        dataSA = [MergeSort new];
                        break;
                    case 3:
                        dataSA = [QuickSort new];
                        break;
                    case 4:
                        dataSA = [PriorityQueueAndHeapSort new];
                        break;
                    case 5:
                        dataSA = [SymbolTableDictionary new];
                        break;
                    case 6:
                        dataSA = [BinarySearchTree new];
                        break;
                    case 7:
                        dataSA = [TwoThreeSearchTree new];
                        break;
                    case 8:
                        dataSA = [RedBlackTree new];
                        break;
                    case 9:
                        dataSA = [BAndBplusTree new];
                        break;
                    case 10:
                        dataSA = [HashTableSort new];
                        break;
                        
                    default:
                        break;
                }
                if (dataSA != nil)
                {
                    [dataSA runing];
                }
                break;
            }
            default:
                break;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
