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
        UILabel* label = Label.str(cate).addTo(self.topView).xywh(50 + i* 60 + i * 20, 16, 60, 20);
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
    self.selectView.xy(50+i*60+i*25, 40);
    [self.scrollView setContentOffset:CGPointMake(self.view.frame.size.width * i, 0) animated:YES];
}

- (UIView*)createCate:(int)i{
    UIScrollView* bgView = [[UIScrollView alloc] init];
    bgView.addTo(self.scrollView).xywh(0+i*self.scrollView.frame.size.width,0,self.scrollView.frame.size.width, self.scrollView.frame.size.height);

    NSArray* items = nil;
    if(i != 1){
        
    items = @[@[@"jd",@"安全家医套餐",@"专业医生报告解读-不限次",@"￥99",@"1489人付款", @"好评率95%"],
                       @[@"jd",@"安心家医套餐",@"特需医生报告解读-12次",@"￥199",@"700人付款", @"好评率95%"],
                       @[@"jd",@"安享家医套餐",@"专业医生报告解读-不限次，特需医生报告解读-12次",@"￥999",@"907人付款", @"好评率95%"],
                       @[@"pz",@"友伴高级VIP套餐",@"特需医生解读 + 智能健康手表",@"￥1999",@"483人付款", @"好评率95%"],
                       @[@"pz",@"一站式陪诊套餐",@"一站式陪诊12次",@"￥1999",@"930人付款", @"好评率95%"],
                       @[@"pz",@"一站式陪诊VIP套餐",@"一站式陪诊+诊前服务+诊中陪伴",@"￥2999",@"1419人付款", @"好评率95%"],
    ];
    }
    else if (i==1){
        items = @[@[@"h6",@"友伴智能手表plus",@"血压监控，心率监控",@"￥399",@"1489人付款", @"好评率95%"],
                           @[@"h5",@"友伴智能手表",@"血压监控，心率监控",@"￥349",@"700人付款", @"好评率95%"],
                           @[@"h4",@"老年人智能手环",@"一键报警，x心率监控",@"￥199",@"907人付款", @"好评率95%"],
                           @[@"h3",@"老年人智能手环",@"血压心率手环",@"￥299",@"483人付款", @"好评率95%"],
                           @[@"h2",@"智能血压计",@"血压记录",@"￥399",@"930人付款", @"好评率95%"],
                           @[@"h1",@"智能血糖仪",@"病友伴侣",@"￥599",@"1419人付款", @"好评率95%"],
        ];
        
    }
        
    
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
/*<<<<<<< HEAD
        [Label.addTo(itemView).xywh(5,h-txtH+10,100,10).fnt(14).str(items[itemIndex][1]) sizeToFit];
        UILabel* label = Label.addTo(itemView).xywh(5,h-txtH+15+15,100,15).fnt(12).str(items[itemIndex][2]);
        label.textColor = [UIColor grayColor];
        [label sizeToFit];
        [Label.addTo(itemView).xywh(5,h-20,30,15).fnt(14).str(items[itemIndex][3]) sizeToFit];
        label =Label.addTo(itemView).xywh(40,h-20+2,30,13).fnt(12).str(items[itemIndex][4]);
        label.textColor = [UIColor grayColor];
        [label sizeToFit];
=======*/
        NSString* content = items[itemIndex][2];
        if(content.length > 12){
            UILabel* label = Label.addTo(img).xywh(0,h-txtH-40,w,40).fnt(15).bgColor(@"orange").lines(2).str(items[itemIndex][2]);
            label.textColor = [UIColor whiteColor];
        }
        else{
            UILabel* label = Label.addTo(img).xywh(0,h-txtH-20,w,20).fnt(15).bgColor(@"orange").lines(1).str(items[itemIndex][2]);
            label.textColor = [UIColor whiteColor];
        }
        if(itemIndex == 1){
            UILabel* label = Label.addTo(img).xywh(w-70,0,70,20).fnt(11).bgColor(@"red").str(@" 最畅销产品 ");
            label.textColor = [UIColor whiteColor];
        }
        UILabel* l =  Label.addTo(itemView).xywh(5,h-txtH+10,31,10).fnt(12).bgColor(@"red").str(@"直营");
        [l sizeToFit];
        l.textColor = [UIColor whiteColor];
        [Label.addTo(itemView).xywh(31+5,h-txtH+10,100,10).fnt(14).str(items[itemIndex][1]) sizeToFit];
        l= Label.addTo(itemView).xywh(5,h-txtH+15+15,100,15).fnt(12).str(items[itemIndex][2]);
        [l sizeToFit];
        l.textColor = [UIColor grayColor];
        UILabel* pLabel =  Label.addTo(itemView).xywh(5,h-20,30,15).fnt(14).str(items[itemIndex][3]);
        [pLabel sizeToFit];
        pLabel = Label.addTo(itemView).xywh(pLabel.maxX+ 3,h-20+2,30,13).fnt(12).str(items[itemIndex][4]);
        pLabel.textColor = [UIColor grayColor];
        [pLabel sizeToFit];
        pLabel = Label.addTo(itemView).xywh(w-70,h-20+2,70,13).fnt(12).str(items[itemIndex][5]);
        pLabel.textColor = [UIColor grayColor];
        [pLabel sizeToFit];
//>>>>>>> 5880aeb8c9ef968ce27f94338078255fdb45464c
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
