//
//  TestNavigationViewController.h
//  TestTech
//
//  Created by HelloBoy on 2018/3/29.
//  Copyright © 2018年 HelloBoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestNavigationViewController : UINavigationController
- (void)addFullScreenPopBlackListItem:(UIViewController *)viewController;
- (void)removeFromFullScreenPopBlackList:(UIViewController *)viewController;
@end
