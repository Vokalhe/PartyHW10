//
//  EVANewViewController.h
//  PartyMaker
//
//  Created by 2 on 11.02.16.
//  Copyright © 2016 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EVANewViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate, UITextViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *buttonChooseDate;
@property (weak, nonatomic) IBOutlet UITextField *yourPartyName;
@property (weak, nonatomic) IBOutlet UIButton *buttonChooseLocation;
@property (weak, nonatomic) IBOutlet UISlider *sliderSrart;
@property (weak, nonatomic) IBOutlet UISlider *sliderEnd;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeStart;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeEnd;
@property (weak, nonatomic) UIScrollView *viewScroll;
@property (weak, nonatomic) IBOutlet UITextView *textDescription;
@property (weak, nonatomic) UIPageControl *pageControl;
@property (nonatomic) UIToolbar *toolBar;
@property (nonatomic) UIDatePicker *datePicker;
@property (nonatomic) UIView* moving;
@property (nonatomic) NSDate* pickerDate;
@property (nonatomic) UITextView *viewDescription;
@property (nonatomic) BOOL isKeyBoardShowed;



- (IBAction)actionYourPartyName:(UITextField *)sender;
- (IBAction)actionSliderStart:(UISlider *)sender;
- (IBAction)actionSliderEnd:(UISlider *)sender;

- (IBAction)actionChooseLocation:(UIButton *)sender;

- (IBAction)actionChooseDate:(UIButton *)sender;
@end