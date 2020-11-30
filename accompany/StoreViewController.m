//
//  StoreViewController.m
//  accompany
//
//  Created by Robert on 2020/12/1.
//  Copyright © 2020 robert. All rights reserved.
//

#import "StoreViewController.h"

@interface StoreViewController ()
@property (nonatomic, strong) UIView* topView;
@property (nonatomic, strong) UIScrollView* scrollView;

@property (nonatomic, strong) UIView* selectView;
@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.topView = [self.view viewWithTag:50];
    self.scrollView= [self.view viewWithTag:100];
    [self.view viewWithTag:110].onClick(^(){
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
                                        
                                        
                                        );
    
    
    self.selectView = View.addTo(self.topView).bgColor(@"black").xywh(0,0,30,2);
    
    NSArray* cateList = @[@"医疗",@"硬件",@"体检",@"优惠"];
    int i = 0;
    for(NSString* cate in cateList){
        UILabel* label = Label.str(cate).color(@"black").addTo(self.topView).xywh(30 + i* 60 + i * 20, 16, 60, 20);
        [label sizeToFit];
        label.onClick(^(){
            [self switchCate:i];
        });
        i++;
    }
    
    for(int i = 0;i< cateList.count; i++){
        [self createCate:i];
    }
    
    [self switchCate:0];
    
    // Do any additional setup after loading the view.
}
- (void)switchCate:(int)i{
    self.selectView.xy(30+i*60+i*20, 40);
    [self.scrollView setContentOffset:CGPointMake(self.view.frame.size.width * i, 0) animated:YES];
}

- (UIView*)createCate:(int)i{
    UIScrollView* bgView = [[UIScrollView alloc] init];
    bgView.addTo(self.scrollView).xywh(0+i*self.scrollView.frame.size.width,0,self.scrollView.frame.size.width, self.scrollView.frame.size.height);

    NSArray* items = @[@[@"jd",@"安全家医套餐",@"专业医生报告解读-不限次",@"99",@"1489"],
                       @[@"jd",@"安全家医套餐",@"专业医生报告解读-不限次",@"99",@"1489"],
                       @[@"jd",@"安全家医套餐",@"专业医生报告解读-不限次",@"99",@"1489"],
                       @[@"pz",@"安全家医套餐",@"专业医生报告解读-不限次",@"99",@"1489"],
                       @[@"jd",@"安全家医套餐",@"专业医生报告解读-不限次",@"99",@"1489"],
                       @[@"pz",@"安全家医套餐",@"专业医生报告解读-不限次",@"99",@"1489"],
    ];
    
    //NSArray* itemNames = @[@"套餐1",@"套餐2",@"套餐3",@"优惠",@"陪诊",@"陪诊"];
    //NSArray* itemImgs= @[@"jd",@"jd",@"jd",@"jd",@"pz",@"pz"];
    CGFloat bottom = 0.0;
    for(int itemIndex = 0; itemIndex < items.count;itemIndex++){
        int w = (self.view.frame.size.width -30)/2;
        int h = 200;
        int x = 10+(itemIndex %2) * (w + 10);
        int y = 10+(itemIndex/2)*(h+10);
        UIView* itemView = View.addTo(bgView).xywh(x,y,w,h).bgColor(@"white").borderRadius(5);
        int txtH = 70;
        UIImageView* img = ImageView.addTo(itemView).xywh(0,0,w,h-txtH).img([UIImage imageNamed:items[itemIndex][0]]);
        [Label.addTo(itemView).xywh(5,h-txtH+10,100,10).fnt(14).str(items[itemIndex][1]) sizeToFit];
        [Label.addTo(itemView).xywh(5,h-txtH+15+15,100,15).fnt(12).color(@"gray").str(items[itemIndex][2]) sizeToFit];
        [Label.addTo(itemView).xywh(5,h-20,30,15).fnt(14).str(items[itemIndex][3]) sizeToFit];
        bottom = itemView.frame.origin.y+itemView.frame.size.height;
    }
    
    bgView.contentSize = CGSizeMake(self.view.frame.size.width, bottom+50);
    
    return bgView;
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
