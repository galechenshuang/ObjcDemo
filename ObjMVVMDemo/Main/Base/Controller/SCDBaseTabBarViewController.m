//
//  SCDBaseTabBarViewController.m
//  ObjMVVMDemo
//
//  Created by Simpletour on 2018/3/24.
//  Copyright © 2018年 Simpletour. All rights reserved.
//

#import "SCDBaseTabBarViewController.h"
#import "SCDHomePageViewController.h"
#import "SCDBaseNavigationViewController.h"
#import "SCDMePageViewController.h"
#import "SCDMessageViewController.h"
#import "SCDOrderViewController.h"

@interface SCDBaseTabBarViewController ()

@property (nonatomic,strong) SCDHomePageViewController *homeVC;
@property (nonatomic,strong) SCDMePageViewController *meVC;
@property (nonatomic,strong) SCDMessageViewController *msgVC;
@property (nonatomic,strong) SCDOrderViewController *orderVC;
@end

@implementation SCDBaseTabBarViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.tabBar.barTintColor = [UIColor whiteColor];
    [self addBaseVC];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)addBaseVC{
    
    self.homeVC = [[SCDHomePageViewController alloc]init];
    self.homeVC.title = @"首页";
    SCDBaseNavigationViewController *homeView = [[SCDBaseNavigationViewController alloc] initWithRootViewController:self.homeVC];
    
    self.orderVC = [[SCDOrderViewController alloc]init];
    self.orderVC.title = @"线路";
    SCDBaseNavigationViewController *orderView = [[SCDBaseNavigationViewController alloc] initWithRootViewController:self.orderVC];

    self.msgVC = [[SCDMessageViewController alloc]init];
    self.msgVC.title = @"行程";
    SCDBaseNavigationViewController *msgView = [[SCDBaseNavigationViewController alloc] initWithRootViewController:self.msgVC];

    self.meVC = [[SCDMePageViewController alloc] init];
    self.meVC.title = @"我的";
    SCDBaseNavigationViewController *meView = [[SCDBaseNavigationViewController alloc] initWithRootViewController:self.meVC];
    
    NSArray *viewTabArr = [NSArray arrayWithObjects:homeView,orderView,msgView,meView, nil];
    self.viewControllers = viewTabArr;
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
