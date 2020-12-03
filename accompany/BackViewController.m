//
//  BackViewController.m
//  accompany
//
//  Created by Robert Yu on 12/3/20.
//  Copyright © 2020 robert. All rights reserved.
//

#import "BackViewController.h"

@interface BackViewController ()

@end

@implementation BackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* backImageView = ImageView.xywh(10,37,30,30).img(@"back").addTo(self.view);
    backImageView.onClick(^(){
        [self dismissViewControllerAnimated:YES completion:nil];
    });
    UIScrollView* scrollView = [self.view viewWithTag:1000];
    if([scrollView isKindOfClass:[UIScrollView class]]){
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1600);
    }
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
