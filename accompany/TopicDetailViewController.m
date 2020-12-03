//
//  TopicDetailViewController.m
//  accompany
//
//  Created by Robert Yu on 12/3/20.
//  Copyright © 2020 robert. All rights reserved.
//

#import "TopicDetailViewController.h"

@interface TopicDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end

@implementation TopicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scroll.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
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
