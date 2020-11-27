//
//  UploadViewController.m
//  accompany
//
//  Created by Robert Yu on 11/27/20.
//  Copyright © 2020 robert. All rights reserved.
//

#import "UploadViewController.h"
#import "NerdyUI/NerdyUI.h"

@interface UploadViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *closeImageView;
@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.closeImageView.onClick(^(id view){
                                [[NSNotificationCenter defaultCenter] postNotificationName:@"closeUpload" object:nil];
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
