//
//  VCViewController.h
//  PartyMaker
//
//  Created by 2 on 05.02.16.
//  Copyright © 2016 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVAVCViewController : UIViewController
-(void) newView;
@end
/*
 #import <UIKit/UIKit.h>
 #import "PAMParty.h"
 #import "PAMCustomDatePiker.h"
 #import "PAMDataStore.h"
 
 @interface PAMNewViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate, UITextViewDelegate, PAMDatePikerDelegate>
 
 @property (weak, nonatomic) IBOutlet UIButton *chooseButton;
 @property (weak, nonatomic) IBOutlet UIButton *closeButton;
 @property (weak, nonatomic) IBOutlet UIButton *saveButton;
 @property (weak, nonatomic) IBOutlet UITextField *partyNameTextField;
 
 @property (weak, nonatomic) IBOutlet UISlider *startSlider;
 @property (weak, nonatomic) IBOutlet UISlider *endSlider;
 @property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
 @property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
 
 @property (weak, nonatomic) IBOutlet UIScrollView *typeEventScrollView;
 @property (weak, nonatomic) IBOutlet UIPageControl *typeEventPageControl;
 @property (weak, nonatomic) IBOutlet UITextView *partyDescription;
 
 @property (weak, nonatomic) IBOutlet UIView *cursorView;
 @property (weak, nonatomic) IBOutlet NSLayoutConstraint *cursorTopConstraint;
 
 @property(strong, nonatomic) NSDate *partyDate;
 
 - (IBAction)actionMoveCursor:(UIView *) sender;
 
 - (IBAction)actionChooseButton:(UIButton *)sender;
 - (IBAction)actionSaveButton:(id)sender;
 - (IBAction)actionCloseButton:(id)sender;
 
 - (IBAction)actionSlideChanged:(UISlider *)sender;
 
 - (IBAction)actionPageChange:(UIPageControl *)sender;
 
 @end
 
 
 */