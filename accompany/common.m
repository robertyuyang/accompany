//
//  common.m
//  accompany
//
//  Created by Robert Yu on 12/3/20.
//  Copyright © 2020 robert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "common.h"
@implementation UIViewController(Common)

- (void)presentboardVC:(NSString*)boardId{
UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

    UIViewController* vc= [board instantiateViewControllerWithIdentifier: boardId];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)addViewWithTag:(NSInteger)tag presentboardVC:(NSString*)boardId {
    [self.view viewWithTag:tag].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        UIViewController* vc= [board instantiateViewControllerWithIdentifier: boardId];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
               [self presentViewController:vc animated:YES completion:nil];
    });
    
}

- (void)addViewWithTag:(NSInteger)tag presentNavboardVC:(NSString*)boardId {
    [self.view viewWithTag:tag].onClick(^(){
        UIStoryboard *board = [UIStoryboard storyboardWithName: @"Main" bundle: nil];

        UIViewController* vc= [board instantiateViewControllerWithIdentifier: boardId];
        UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:vc ];
        navVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navVC animated:YES completion:nil];
    });
    
}

@end
