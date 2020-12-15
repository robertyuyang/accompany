//
//  HoFriendTopicViewController.m
//  accompany
//
//  Created by Robert on 2020/11/29.
//  Copyright © 2020 robert. All rights reserved.
//

#import "HoFriendTopicViewController.h"

@interface HoFriendTopicViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation HoFriendTopicViewController
- (void)onBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    
    [self.scrollView setContentSize:CGSizeMake(414, 1600)];
    
      self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(onBack) ];
    [self.view viewWithTag:20].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        UIViewController* vc= [board instantiateViewControllerWithIdentifier: @"TopicDetailVC"];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
              [self.navigationController pushViewController:vc animated:YES];
    });
    //[self addViewWithTag:20 presentboardVC:@"TopicDetailVC"];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UIEdgeInsets r1 = self.view.safeAreaInsets;

       if(r1.bottom>0){
           self.view.y(34);
       }
    //self.scrollView.maxY(self.view.maxY - self.scrollView.y);
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
