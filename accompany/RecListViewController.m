//
//  RecListViewController.m
//  accompany
//
//  Created by Robert Yu on 11/30/20.
//  Copyright © 2020 robert. All rights reserved.
//

#import "RecListViewController.h"

@interface RecListViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@end

@implementation RecListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollview.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    [self.view viewWithTag:1].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        UIViewController* vc= [board instantiateViewControllerWithIdentifier: @"RecReadVC"];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    });
    
    [self.view viewWithTag:2].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        UIViewController* vc= [board instantiateViewControllerWithIdentifier: @"RecReadVC"];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    });
    [self.view viewWithTag:3].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        UIViewController* vc= [board instantiateViewControllerWithIdentifier: @"RecReadVC"];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    });
        
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIEdgeInsets safe = self.view.safeAreaInsets;
    self.scrollview.frame = CGRectMake(0, 76, self.view.frame.size.width, self.view.frame.size.height - safe.bottom - safe.top - 76);
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
