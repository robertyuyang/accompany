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

- (void)onBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

    
- (void)viewDidLoad {
    [super viewDidLoad];
    
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
