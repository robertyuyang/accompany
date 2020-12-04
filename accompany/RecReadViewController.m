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
    
    for(int i = 1;i<= 7;i++){
        [self.view viewWithTag:i].hidden = YES;
    }
    for(int i = 298;i<= 300;i++){
        [self.view viewWithTag:i].hidden = YES;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(int i = 1;i<= 3;i++){
            [self.view viewWithTag:i].hidden = NO;
        }
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(int i = 4;i<= 5;i++){
            [self.view viewWithTag:i].hidden = NO;
        }
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(int i = 6;i<= 7;i++){
            [self.view viewWithTag:i].hidden = NO;
        }
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(int i = 298;i<= 300;i++){
            [self.view viewWithTag:i].hidden = NO;
        }
    });
    
    [self.view viewWithTag:110].onClick(^(){
        
    [self dismissViewControllerAnimated:YES completion:nil];
    }
                                        
                                        
                        );
    [self addViewWithTag:300 presentboardVC:@"RecReadDetailVC"];
    [self addViewWithTag:301 presentboardVC:@"RecReadDetailVC"];
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
