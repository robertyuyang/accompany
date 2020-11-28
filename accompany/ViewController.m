//
//  ViewController.m
//  accompany
//
//  Created by Robert Yu on 11/27/20.
//  Copyright © 2020 robert. All rights reserved.
//

#import "ViewController.h"
#import "NerdyUI/NerdyUI.h"
#import "MBProgressHUD.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *hospImageView;
@property (weak, nonatomic) IBOutlet UILabel *hospLabel;
@property (weak, nonatomic) IBOutlet UIImageView *recImageView;
@property (weak, nonatomic) IBOutlet UILabel *recLabel;
@property (weak, nonatomic) IBOutlet UIImageView *reportImageView;
@property (weak, nonatomic) IBOutlet UILabel *reportLabel;

@end

@implementation ViewController
- (IBAction)gotoHosp:(id)sender {
    NSLog(@"dd");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hospImageView.onClick(^(){
        
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
        UIViewController* vc= [board instantiateViewControllerWithIdentifier: @"HospVC"];
        UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc ];
        navVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navVC animated:YES completion:nil];
    } );
    
    self.recImageView.onClick(^(){
         UIImagePickerController *imagePicker=[[UIImagePickerController alloc] init];
            imagePicker.delegate=self;
        //    imagePicker.view.frame=s
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
             imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
                
            }
           // imagePicker.allowsEditing=YES;
        //    [self.view addSubview:imagePicker.view];
        [self presentViewController:imagePicker animated:YES completion:^{
            
        }];
    });
    
    // Do any additional setup after loading the view.
}





- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    
}

- (void) showRec{
    UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    UIViewController* vc= [board instantiateViewControllerWithIdentifier: @"RecVC"];
    UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc ];
    navVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navVC animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@",info);
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    [self showRec];
    
    
    

}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
