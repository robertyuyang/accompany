//
//  HoFriendViewController.m
//  accompany
//
//  Created by Robert on 2020/11/29.
//  Copyright © 2020 robert. All rights reserved.
//

#import "HoFriendViewController.h"

@interface HoFriendViewController ()

@end

@implementation HoFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
    [self.view viewWithTag:110].onClick(^(){
        [self dismissViewControllerAnimated:YES completion:nil];
    });
    
    [self.view viewWithTag:1].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

           UIViewController* vc= [board instantiateViewControllerWithIdentifier: @"TopicVC"];
           UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc ];
           navVC.modalPresentationStyle = UIModalPresentationFullScreen;
           [self presentViewController:navVC animated:YES completion:nil];
    });
    
    [self.view viewWithTag:2].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        UIViewController* vc= [board instantiateViewControllerWithIdentifier: @"TopicVC"];
        UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc ];
        navVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navVC animated:YES completion:nil];
    });
    
    
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
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
