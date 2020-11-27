//
//  RecordViewController.m
//  accompany
//
//  Created by Robert Yu on 11/27/20.
//  Copyright © 2020 robert. All rights reserved.
//

#import "RecordViewController.h"
#import "NerdyUI/NerdyUI.h"
#import "UploadViewController.h"

@interface RecordViewController ()
@property (nonatomic, strong) UIView* maskView;
@property (nonatomic, strong) UIViewController* childVC;

@end

@implementation RecordViewController

- (IBAction)onUpload:(id)sender {
    UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

    UploadViewController* vc= [board instantiateViewControllerWithIdentifier: @"UploadVC"];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    self.childVC = vc;
    
    self.maskView.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.maskView = View.bgColor(@"black").addTo(self.view);
    self.maskView.frame = self.view.frame;
    self.maskView.alpha = .3;
    self.maskView.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"closeUpload" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [self.childVC.view removeFromSuperview];
        self.maskView.hidden =YES;
    }];

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
