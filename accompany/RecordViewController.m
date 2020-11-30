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
#import "MBProgressHUD.h"

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

- (void)onBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doUpload{
    self.maskView.hidden =NO;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"正在上传，请稍等";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        hud.label.text = @"上传成功";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
            self.maskView.hidden =YES;
            
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoRecList" object:nil];
            

            

        });

    });
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(onBack) ];

    [self.view viewWithTag:801].hidden =YES;
    self.maskView = View.bgColor(@"black").addTo(self.view);
    self.maskView.frame = self.view.frame;
    self.maskView.alpha = .7;
    self.maskView.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"closeUpload" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [self.childVC.view removeFromSuperview];
        self.maskView.hidden =YES;
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"doUpload" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [self.childVC.view removeFromSuperview];
        [self doUpload];
    }];
   
    self.maskView.hidden = NO;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"正在识别，请稍等";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
        //[MBProgressHUD hideHUDForView: [UIApplication sharedApplication].keyWindow animated:YES];
        self.maskView.hidden =YES;
        [self.view viewWithTag:801].hidden =NO;

    });
   
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
