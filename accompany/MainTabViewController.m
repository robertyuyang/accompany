//
//  MainViewController.m
//  accompany
//
//  Created by Robert on 2020/11/28.
//  Copyright © 2020 robert. All rights reserved.
//

#import "MainTabViewController.h"
#import "ViewController.h"

@interface MainTabViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *indexScrollView;

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.indexScrollView.contentSize = CGSizeMake(414, 1299);
    UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

    ViewController* indexVC= [board instantiateViewControllerWithIdentifier: @"IndexVC"];


    [self addChildViewController: indexVC];
    [self.indexScrollView addSubview:indexVC.view];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
