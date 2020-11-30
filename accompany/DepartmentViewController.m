//
//  DepartmentViewController.m
//  accompany
//
//  Created by Robert on 2020/11/29.
//  Copyright © 2020 robert. All rights reserved.
//

#import "DepartmentViewController.h"

@interface DepartmentViewController ()
@property (nonatomic, strong) UIView* maskView;
@property (weak, nonatomic) IBOutlet UIView *resultView;
@property (weak, nonatomic) IBOutlet UILabel *hospLabel;
@property (weak, nonatomic) IBOutlet UILabel *depLabel;

@end

@implementation DepartmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = self.resultView.frame;
    self.resultView.xy(frame.origin.x + 414, frame.origin.y);
    
    self.maskView = View.bgColor(@"black").addTo(self.view);
    self.maskView.frame = self.view.frame;
    self.maskView.alpha = .3;
    self.maskView.hidden =YES;

    UIView* queryView = [self.view viewWithTag:2];
    queryView.hidden = YES;
    
    [self.view viewWithTag:1].onClick(^(){
        queryView.hidden = NO;
    });
    
    UILongPressGestureRecognizer* backdoorOpenGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
    //backdoorOpenGesture.minimumPressDuration = 2;
    [[self.view viewWithTag:10] addGestureRecognizer:backdoorOpenGesture];
    
}

-(void)voiceFinish{
    self.maskView.hidden =NO;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = @"正在识别，请稍等";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        hud.label.text = @"正在分析，请稍等";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
            self.maskView.hidden =YES;
            
            [UIView animateWithDuration:0.3
            animations:^{
                CGRect frame = self.resultView.frame;
                self.resultView.xy(frame.origin.x - 414, frame.origin.y);
            }completion:^(BOOL finish){
                self.hospLabel.text = @"人民医院";
                self.hospLabel.textColor = [UIColor orangeColor];
                self.depLabel.text = @"心血管科";
                self.depLabel.textColor = [UIColor orangeColor];
            }];
            
            

        });

    });
}
    
-(void)longP:(UILongPressGestureRecognizer*) g
{
    if (g.state == UIGestureRecognizerStateEnded) {
        NSLog(@"end");
        UIView* v = [self.view viewWithTag:10];
        UIView* mask = [self.view viewWithTag:20];
        [UIView animateWithDuration:0.3
        animations:^{
            v.transform = CGAffineTransformMakeScale(1, 1);
        }completion:^(BOOL finish){
            [self voiceFinish];
        }];
        mask.hidden = YES;
        
    } else if (g.state == UIGestureRecognizerStateBegan) {
        UIView* v = [self.view viewWithTag:10];
        UIView* mask = [self.view viewWithTag:20];
        mask.hidden = NO;
        [UIView animateWithDuration:0.3
        animations:^{
            v.transform = CGAffineTransformMakeScale(1.4, 1.4);
        }completion:^(BOOL finish){}];
        NSLog(@"begin");
    }
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
