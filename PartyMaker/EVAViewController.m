//
//  ViewController.m
//  PartyMaker
//
//  Created by 2 on 05.02.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "EVAViewController.h"
#import "EVANewViewController.h"
@interface EVAViewController ()

@end
@implementation EVAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated{
    EVANewViewController* newView = [[EVANewViewController alloc] initWithNibName:@"EVANewViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newView];
    [self presentViewController:navigationController animated:YES completion:nil];
    
    [newView.view setBackgroundColor:[[UIColor alloc]initWithRed:46/255.f green:49/255.f blue:56/255.f alpha:1]];
    newView.title = @"CREATE PARTY";
    [newView.navigationItem setHidesBackButton:YES];
       
    [navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1]];
    self.navigationController.navigationBar.translucent = NO;
    [navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:@"MyriadPro-Bold" size:15]}];
    
    [self.navigationController pushViewController:newView animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

