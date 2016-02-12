//
//  ViewController.m
//  PartyMaker
//
//  Created by 2 on 05.02.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "EVAViewController.h"
#import "EVANewViewController.h"
//#import "EVAVCViewController.h"
@interface EVAViewController ()

@end

@implementation EVAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated{
    //исправить навигейшен, тул бар, что бы не сьехало + клава
   // NSArray *nibContent = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([EVANewViewController class]) owner:nil options:nil];
  //  EVANewViewController *newVC = nibContent[0];
    
   // UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newVC];
  //  [navigationController pushViewController:newVC animated:YES];
    
    EVANewViewController* newView = [[EVANewViewController alloc] initWithNibName:@"EVANewViewController" bundle:nil];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newView];
 [self presentViewController:navigationController animated:YES completion:nil];
    
    
   
    //newView.view = [[UIView alloc]initWithFrame:self.view.frame];
    [newView.view setBackgroundColor:[[UIColor alloc]initWithRed:46/255.f green:49/255.f blue:56/255.f alpha:1]];
    newView.title = @"CREATE PARTY";
    [newView.navigationItem setHidesBackButton:YES];
    //Create UINavigationController with root vc
    
    //Create log controllers array
    [navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1]];
    self.navigationController.navigationBar.translucent = NO;
    [navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:@"MyriadPro-Bold" size:15]}];
    
    [self.navigationController pushViewController:newView animated:YES];

   //[self pushViewController:navigationController animated:YES];
}
/*-(void)viewDidAppear:(BOOL)animated{
    //Create first VC
    EVAVCViewController *first = [EVAVCViewController new];
    first.view = [[UIView alloc]initWithFrame:self.view.frame];
    [first.view setBackgroundColor:[[UIColor alloc]initWithRed:46/255.f green:49/255.f blue:56/255.f alpha:1]];
    first.title = @"First";
    
    UIBarButtonItem *newView = [[UIBarButtonItem alloc] initWithTitle:@"+" style:
                                UIBarButtonItemStylePlain target:first action:@selector
                                                              (newView)];
    first.navigationItem.rightBarButtonItem = newView;
    
    //Create UINavigationController with root vc
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:first];
    [navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    //Create present UINavigationController
    [self presentViewController:navigationController animated:YES completion:nil];
    
    //Create log controllers array
    NSLog(@"%@", navigationController.viewControllers);
    
    [navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1]];
    [navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    
    [newView  setTintColor:[UIColor whiteColor]];//+
    // [[UINavigationBar appearance] setBackgroundColor: [UIColor redColor]];
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
//    [self.navigationController :first animated:YES];
   
}*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
