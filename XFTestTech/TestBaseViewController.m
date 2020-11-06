//
//  TestBaseViewController.m
//  XFTestTech
//
//  Created by HelloBoy on 2019/2/20.
//  Copyright © 2019 HelloBoy. All rights reserved.
//

#import "TestBaseViewController.h"
#import "XFTestTech.h"
@interface TestBaseViewController ()
@property (nonatomic, strong) NSString* unique_ID;

@property (nonatomic, strong) UIButton *leftBackBtn;

@end

@implementation TestBaseViewController

#pragma mark - 屏幕旋转
- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

#pragma mark - 状态栏
- (BOOL)prefersStatusBarHidden {
    return self.statusBarHide;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.statusBarStyle;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _statusBarHide = NO;
        _statusBarStyle = UIStatusBarStyleDefault;
        _navigationBarHide = NO;
        _bottomLineHide = NO;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.unique_ID = [NSString stringWithFormat:@"%lf", [[NSDate date] timeIntervalSince1970]];
        NSLog(@"+【init】uid:%@, %@", self.unique_ID, self);
    }
    return self;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"+【delloc】uid:%@, %@", self.unique_ID, self);
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = XFColor(0x007dff, 1.0f);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIApplication sharedApplication].idleTimerDisabled = YES;///阻止锁屏代码
    //NSLog(@"******* %@ [retainCount:%ld]【viewDidAppear】", self.unique_ID, CFGetRetainCount((__bridge CFTypeRef)(self)));
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //NSLog(@"******* %@ [retainCount:%ld]【viewDidDisappear】", self.unique_ID, CFGetRetainCount((__bridge CFTypeRef)(self)));
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.translucent = NO;

    self.view.backgroundColor = XFColor(0xf9f9f9, 1.0f);
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:self action:@selector(leftBackBtnClick:)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowX:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideX:)
                                                 name:UIKeyboardWillHideNotification object:nil];

}

- (void)leftBackBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)setupRightFinishedBtnTitle:(NSString *)title Action:(SEL)action {
    NSString *newTitle = @"完成";
    if ([title xf_NotNull]) newTitle = title;
    CGRect titleRect = [newTitle boundingRectWithSize:CGSizeMake(XFWidth, XFHeight)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:XFFont(17)}
                                              context:nil];
    
    CGRect frame = CGRectMake(0, 0, titleRect.size.width+5, 30);
    UIButton *rightFinishedBtn = [UIButton XF_ButtonWithColor:[UIColor clearColor] Image:nil Title:newTitle Font:XFFont(17) TitleColor:XFColor(0x0076ff, 1.0f) Target:self Action:action Frame:frame];
    [rightFinishedBtn setTitleColor:XFColor(0x0076ff, 0.5f) forState:UIControlStateHighlighted];
    self.rightBtn_base = rightFinishedBtn;
//    [self xf_SetNavigationRightItems:@[rightFinishedBtn]];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightFinishedBtn];
    self.navigationItem.rightBarButtonItem = rightItem;

    return rightFinishedBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardToHeight:(CGFloat)height {
    ///
}


- (void)keyboardWillShowX:(NSNotification*)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = CGSizeMake(0, [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height);
    
    [UIView beginAnimations:@"changeTableViewContentInset" context:NULL];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:7];
    //if ([ESAlertView getAlertWindowShowStatus]) {
    //    [self.view endEditing:YES];
    //    [self keyboardToHeight:0];
    //}
    //else {
    //    [self keyboardToHeight:kbSize.height];
    //}
    [self keyboardToHeight:kbSize.height];
    [UIView commitAnimations];
    //CGRect aRect = self.view.frame;
    //aRect.size.height -= kbSize.height;
    //if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
    //    CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y-kbSize.height);
    //    [scrollView setContentOffset:scrollPoint animated:YES];
    //}
}

- (void)keyboardWillHideX:(NSNotification*)aNotification {
    //UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    [UIView beginAnimations:@"changeTableViewContentInset" context:NULL];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationCurve:7];
    [self keyboardToHeight:0];
    [UIView commitAnimations];
    
}

@end
