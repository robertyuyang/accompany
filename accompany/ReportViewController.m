//
//  ReportViewController.m
//  accompany
//
//  Created by Robert on 2020/11/29.
//  Copyright © 2020 robert. All rights reserved.
//

#import "ReportViewController.h"
#import "StoreViewController.h"

@interface ReportViewController ()

@end

@implementation ReportViewController
- (void)onBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* img1 = [self.view viewWithTag:1001];
    UIImageView* img2 = [self.view viewWithTag:1002];
    
    img2.onClick(^(){
        [UIView animateWithDuration:.3 animations:^{
            img2.x(414);
        }];
        
    });
    
    img1.onClick(^(){
        [UIView animateWithDuration:.3 animations:^{
            img1.x(414);
        }];
        
    });
    
    [self.view viewWithTag:11].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        StoreViewController* vc= [board instantiateViewControllerWithIdentifier: @"StoreVC"];
        vc.index = 1;
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    });
    [self.view viewWithTag:22].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        StoreViewController* vc= [board instantiateViewControllerWithIdentifier: @"StoreVC"];
        vc.index = 0;
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    });
    
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(onBack) ];
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
