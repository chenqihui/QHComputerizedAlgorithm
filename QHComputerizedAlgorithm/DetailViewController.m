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

@interface DetailViewController ()
{
    NSIndexPath *_indexPath;
    NSArray *_arData;
}

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
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
        
        BasicCodeObject *coding = nil;
        switch (_indexPath.row)
        {
            case 0:
                coding = [RunCoding new];
                break;
            case 1:
                coding = [BitMapCode new];
                break;
                
            default:
                break;
        }
        if (coding != nil)
        {
            [coding runingCode];
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
