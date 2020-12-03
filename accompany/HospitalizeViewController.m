//
//  HospitalizeViewController.m
//  accompany
//
//  Created by Robert Yu on 11/27/20.
//  Copyright © 2020 robert. All rights reserved.
//

#import "HospitalizeViewController.h"
#import "common.h"
#import "NerdyUI/NerdyUI.h"

@interface HospitalizeViewController ()
@property (weak, nonatomic) IBOutlet UIView *chooseBgView;
@property (strong, nonatomic) NSMutableArray* memberbgViews;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation HospitalizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    // Do any additional setup after loading the view.
}

- (void)onBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) setUpViews{
    /*UIButton* backButton = Button.img(@"back").xywh(0,0,30,30);
    UIView *backButtonContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 46, 44)];
    backButtonContainerView.backgroundColor = [UIColor clearColor];
    [backButtonContainerView addSubview:backButton];
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonContainerView];
    //self.navigationItem.leftBarButtonItem = barButton;*/
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(onBack) ];
    
    [self.scrollView setContentSize:CGSizeMake(414, 900)];
    
    
    self.memberbgViews = [[NSMutableArray alloc] init];
    NSArray* memberNames = @[@"父亲", @"母亲",@"爷爷"];
    NSMutableArray* labels =@[];
   
    CGFloat w = 80;
    int i = 0;
    for(NSString* name in memberNames){
        UIView* bgView = [[UIView alloc] initWithFrame:CGRectMake(30 + i * w+ i * 15, 40, w, 36)];
        bgView.layer.cornerRadius = 18;
        bgView.layer.masksToBounds = YES;
        //bgView.layer.borderWidth = 1.5;
        bgView.layer.borderColor = [UIColor grayColor].CGColor;
        bgView.layer.masksToBounds = YES;
        bgView.backgroundColor =RGBHex(0xdddddd);
        
        UIView* circleView = [[UIView alloc] initWithFrame:CGRectMake(60, 20, 30, 30)];
        circleView.layer.cornerRadius = 15;
        circleView.backgroundColor = [UIColor orangeColor];
        circleView.layer.masksToBounds = YES;
        circleView.hidden = YES;
        [bgView addSubview:circleView];
        
        UIImageView* checkImageView = ImageView.img(@"对号").xywh(0,0,15,15);
        
        [circleView addSubview:checkImageView];

        [self.memberbgViews addObject:bgView];
        __weak typeof(self) wSelf = self;
        bgView.onClick(^(UIView *view) {
            for (UIView* view in self.memberbgViews){
                UILabel* l = view.subviews[1];
                l.textColor = [UIColor grayColor];
                view.backgroundColor = RGBHex(0xdddddd);
                //view.layer.borderColor = [UIColor grayColor].CGColor;
               // view.subviews[0].hidden = YES;
            }
            bgView.backgroundColor = RGBHex(0x0066cc);
            UILabel* l = bgView.subviews[1];
            l.textColor = [UIColor whiteColor];
            //bgView.layer.borderColor = [UIColor orangeColor].CGColor;
            //bgView.subviews[0].hidden = NO;
            

        });
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 7, 30, 30)];
        label.text = name;
        label.textColor = [UIColor grayColor];
        
        [label sizeToFit];
        [bgView addSubview:label];
        [self.chooseBgView addSubview:bgView];
        i++;
        
    }
    
    UIView* moreBgView = [[UIView alloc] initWithFrame:CGRectMake(30 + 3 * w+ 3 * 15, 40, w-10, 35)];
    moreBgView.backgroundColor = [UIColor orangeColor];
    UILabel* moreLabel = Label.str(@"更多..").addTo(moreBgView).xywh(7,7,w,20);
    moreLabel.textColor =[UIColor grayColor];
    moreBgView.backgroundColor = RGBHex(0xdddddd);
    [self.chooseBgView addSubview:moreBgView];

    
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
