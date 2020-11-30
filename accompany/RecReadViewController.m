//
//  RecReadViewController.m
//  accompany
//
//  Created by Robert Yu on 11/30/20.
//  Copyright © 2020 robert. All rights reserved.
//

#import "RecReadViewController.h"

@interface RecReadViewController ()

@end

@implementation RecReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view viewWithTag:110].onClick(^(){
        
    [self dismissViewControllerAnimated:YES completion:nil];
    }
                        );
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
