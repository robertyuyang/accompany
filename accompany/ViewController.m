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
#import <UserNotifications/UserNotifications.h>
#import "StoreViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *hospImageView;
@property (weak, nonatomic) IBOutlet UILabel *hospLabel;
@property (weak, nonatomic) IBOutlet UIImageView *recImageView;
@property (weak, nonatomic) IBOutlet UILabel *recLabel;
@property (weak, nonatomic) IBOutlet UIImageView *reportImageView;
@property (weak, nonatomic) IBOutlet UILabel *reportLabel;
@property (weak, nonatomic) IBOutlet UIImageView *msgImageView;

@end

@implementation ViewController
- (IBAction)gotoHosp:(id)sender {
    NSLog(@"dd");
}

- (void)addLocalNotice {
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        // 标题
        content.title = @"用药提醒";
        content.subtitle = @"该吃药了~医生开扑热息痛";
        // 内容
        content.body = @"每日3次一次1片，当前是第2次";
        // 声音
       // 默认声音
     //    content.sound = [UNNotificationSound defaultSound];
     // 添加自定义声音
       content.sound = [UNNotificationSound soundNamed:@"Alert_ActivityGoalAttained_Salient_Haptic.caf"];
        // 角标 （我这里测试的角标无效，暂时没找到原因）
        content.badge = @1;
        // 多少秒后发送,可以将固定的日期转化为时间
        NSTimeInterval time = [[NSDate dateWithTimeIntervalSinceNow:10] timeIntervalSinceNow];
//        NSTimeInterval time = 10;
        // repeats，是否重复，如果重复的话时间必须大于60s，要不会报错
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:time repeats:NO];
        
        /*
        //如果想重复可以使用这个,按日期
        // 周一早上 8：00 上班
        NSDateComponents *components = [[NSDateComponents alloc] init];
        // 注意，weekday默认是从周日开始
        components.weekday = 2;
        components.hour = 8;
        UNCalendarNotificationTrigger *calendarTrigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
        */
        // 添加通知的标识符，可以用于移除，更新等操作
        NSString *identifier = @"noticeId";
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
        
        [center addNotificationRequest:request withCompletionHandler:^(NSError *_Nullable error) {
            NSLog(@"成功添加推送");
        }];
    }else {
        UILocalNotification *notif = [[UILocalNotification alloc] init];
        // 发出推送的日期
        notif.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
        // 推送的内容
        notif.alertBody = @"你已经10秒没出现了";
        // 可以添加特定信息
        notif.userInfo = @{@"noticeId":@"00001"};
        // 角标
        notif.applicationIconBadgeNumber = 1;
        // 提示音
        notif.soundName = UILocalNotificationDefaultSoundName;
        // 每周循环提醒
        notif.repeatInterval = NSCalendarUnitWeekOfYear;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notif];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view viewWithTag:301].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        StoreViewController* vc= [board instantiateViewControllerWithIdentifier: @"StoreVC"];
        vc.index = 1;
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    });
    [self.view viewWithTag:302].onClick(^(){
        [self addLocalNotice];
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        ViewController* vc= [board instantiateViewControllerWithIdentifier: @"StoreVC"];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    });
    [self.view viewWithTag:41].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        ViewController* vc= [board instantiateViewControllerWithIdentifier: @"HoFriendVC"];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    });
    [self.view viewWithTag:42].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        ViewController* vc= [board instantiateViewControllerWithIdentifier: @"HoFriendVC"];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
               [self presentViewController:vc animated:YES completion:nil];
    });
    [self.view viewWithTag:31].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        ViewController* vc= [board instantiateViewControllerWithIdentifier: @"ReportVC"];
        UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc ];
        navVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navVC animated:YES completion:nil];
    });
    [self.view viewWithTag:32].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        ViewController* vc= [board instantiateViewControllerWithIdentifier: @"ReportVC"];
        UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc ];
        navVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navVC animated:YES completion:nil];
    });
    [self.view viewWithTag:1002].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        ViewController* vc= [board instantiateViewControllerWithIdentifier: @"ReportVC"];
        UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc ];
        navVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navVC animated:YES completion:nil];
    });
    [self.view viewWithTag:1004].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        ViewController* vc= [board instantiateViewControllerWithIdentifier: @"TopicVC"];
        UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc ];
        navVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navVC animated:YES completion:nil];
    });
    self.msgImageView.onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        ViewController* vc= [board instantiateViewControllerWithIdentifier: @"MsgVC"];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:vc animated:YES completion:nil];
    });
        
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

- (void)showMsg {
    UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

    ViewController* vc= [board instantiateViewControllerWithIdentifier: @"MsgVC"];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
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
