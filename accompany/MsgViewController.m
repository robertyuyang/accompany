//
//  MsgViewController.m
//  accompany
//
//  Created by Robert on 2020/11/28.
//  Copyright © 2020 robert. All rights reserved.
//

#import "MsgViewController.h"
#import "NerdyUI/NerdyUI.h"

@interface MsgViewController ()

@end

@implementation MsgViewController


    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    for(int i = 1;i<= 7;i++){
        [self.view viewWithTag:i].hidden = YES;
    }
    for(int i = 11;i<= 13;i++){
        [self.view viewWithTag:i].hidden = YES;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(int i = 1;i<= 3;i++){
            [self.view viewWithTag:i].hidden = NO;
        }
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(int i = 4;i<= 5;i++){
            [self.view viewWithTag:i].hidden = NO;
        }
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(int i = 6;i<= 7;i++){
            [self.view viewWithTag:i].hidden = NO;
        }
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(int i = 11;i<= 13;i++){
            [self.view viewWithTag:i].hidden = NO;
        }
    });
    
    [self.view viewWithTag:13].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        UIViewController* vc= [board instantiateViewControllerWithIdentifier: @"ReportVC"];
        UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc ];
        navVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navVC animated:YES completion:nil];
    });
    

    [self.view viewWithTag:110].onClick(^(){
        
    [self dismissViewControllerAnimated:YES completion:nil];
    }
                        );
    
    UIImageView* backImgView = ImageView.img([UIImage imageNamed: @"back"]).xywh(10,10,10,10).addTo(self.view);
    backImgView.onClick(^(){
        
    [self dismissViewControllerAnimated:YES completion:nil];
    }
                        );
   
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
