//
//  MainViewController.m
//  accompany
//
//  Created by Robert on 2020/11/28.
//  Copyright © 2020 robert. All rights reserved.
//

#import "MainTabViewController.h"
#import "ViewController.h"

@interface MainTabViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *indexScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *indexTab;
@property (weak, nonatomic) IBOutlet UIImageView *recListTab;
@property (weak, nonatomic) IBOutlet UIImageView *mdTab;

@property (strong, nonatomic) NSArray* vcs;
@property (strong, nonatomic) NSArray* tabs;

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.indexScrollView.contentSize = CGSizeMake(414, 1299);
    UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

    ViewController* indexVC= [board instantiateViewControllerWithIdentifier: @"IndexVC"];
    

    ViewController* recListVC= [board instantiateViewControllerWithIdentifier: @"RecListVC"];


    [self addChildViewController: indexVC];
    [self addChildViewController: recListVC];
    
    [self.indexScrollView addSubview:recListVC.view];
    [self.indexScrollView addSubview:indexVC.view];
    
    self.vcs= @[indexVC, recListVC, recListVC];
    self.tabs= @[self.indexTab, self.mdTab, self.recListTab];
    for(NSUInteger i = 0; i < _tabs.count; i++){
        UIView* tab = _tabs[i];
        tab.onClick(^(){
            [self switchTab:i];
        });
    }
    
    [self switchTab:0];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"gotoRecList" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [self switchTab:2];
    }];
    
    // Do any additional setup after loading the view.
}

-(void)switchTab:(NSUInteger) i{
    for(NSUInteger vci = 0; vci < _vcs.count; vci++){
        UIViewController* vc = _vcs[vci];
        if(vci == i){
            vc.view.hidden = NO;
        }
        else{
            vc.view.hidden = YES;
        }
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIEdgeInsets safe = self.view.safeAreaInsets;
    for (UIViewController* vc in self.childViewControllers){
        vc.view.frame = CGRectMake(0, 0, 414, self.view.frame.size.height - safe.bottom - safe.top );
    }
    //self.indexScrollView.frame = CGRectMake(0, 0, 414, self.view.frame.size.height - safe.bottom - safe.top );// self.view.frame;
    self.indexScrollView.clipsToBounds = YES;
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
