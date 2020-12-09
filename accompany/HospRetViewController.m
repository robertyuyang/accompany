//
//  HospRetViewController.m
//  accompany
//
//  Created by Robert on 2020/11/29.
//  Copyright © 2020 robert. All rights reserved.
//

#import "HospRetViewController.h"
#import "StoreViewController.h"

@interface HospRetViewController ()

@end

@implementation HospRetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view viewWithTag:1].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        UIViewController* vc= [board instantiateViewControllerWithIdentifier: @"HoFriendVC"];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    });
    
    [self.view viewWithTag:2].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        StoreViewController* vc= [board instantiateViewControllerWithIdentifier: @"StoreVC"];
        vc.index = 1;
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    });
    //[self addViewWithTag:1 presentboardVC:@"HoFriendVC"];
    //[self addViewWithTag:2 presentboardVC:@"StoreVC"];
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
