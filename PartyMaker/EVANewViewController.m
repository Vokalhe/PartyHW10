//
//  EVANewViewController.m
//  PartyMaker
//
//  Created by 2 on 11.02.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "EVANewViewController.h"
#import "NSString+TimeOfSlider.h"
#import "EVAParty.h"
@interface EVANewViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonChooseDate;
@property (weak, nonatomic) IBOutlet UITextField *yourPartyName;
@property (weak, nonatomic) IBOutlet UIButton *buttonChooseLocation;
@property (weak, nonatomic) IBOutlet UISlider *sliderSrart;
@property (weak, nonatomic) IBOutlet UISlider *sliderEnd;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeStart;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeEnd;
@property (weak, nonatomic) IBOutlet UIScrollView *viewScroll;
@property (weak, nonatomic) IBOutlet UITextView *textDescription;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
 @property (nonatomic) UIToolbar *toolBar;
@property (nonatomic) UIDatePicker *datePicker;
 @property (nonatomic) UIView* moving;
@property (nonatomic) NSDate* pickerDate;
@property (nonatomic) UITextView *viewDescription;

@end
/*
 
 
 

 @property (nonatomic) UIView* line;

 
 @property (nonatomic) UIButton *buttonCancel;
 @property (nonatomic) UIButton *buttonSave;
 */
@implementation EVANewViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    
        [super viewDidAppear:animated];
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(keyboardWillShow:)
         name:UIKeyboardWillShowNotification
         object:nil];
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector: @selector(keyboardWillHide:)
         name:UIKeyboardWillHideNotification
         object:nil];
        
    

}
#pragma mark - Button CHOOSE DATE!
- (IBAction)actionChooseDate:(UIButton *)sender {
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame: CGRectMake(0, 345.5, 320, 158.5)];
    datePicker.backgroundColor = [UIColor whiteColor];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 309.5, 320, 36)];
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.backgroundColor = [UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1];
    UIBarButtonItem* editCancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(Cancel)];
    UIBarButtonItem* editDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(Done)];
    UIBarButtonItem* editSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];;
    editCancel.tintColor = [UIColor whiteColor];
    editDone.tintColor = [UIColor whiteColor];
    toolbar.items = @[editCancel, editSpace, editDone];
    self.datePicker = datePicker;
    self.toolBar = toolbar;
    [self.view addSubview:datePicker];
    [self.view addSubview:toolbar];
    
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 27);
    }];

}
-(void) Cancel{
    [self.toolBar removeFromSuperview];
    [self.datePicker removeFromSuperview];
    
}
-(void) Done{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"MM.dd.yyyy"];
    [self.buttonChooseDate setTitle: [dateFormatter stringFromDate:self.datePicker.date] forState:UIControlStateNormal];
    self.pickerDate = self.datePicker.date;
    [self Cancel];
}

#pragma mark - textField NAME!
- (IBAction)actionYourPartyName:(UITextField *)sender {
    [self.yourPartyName setReturnKeyType:UIReturnKeyDone];
}
- (BOOL) textFieldShouldReturn:(UITextField*) textField;{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 76);
    }];
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - sliders Time!
- (IBAction)actionSliderStart:(UISlider *)sender {
    self.labelTimeStart.text = @"00:00";
    [self.sliderSrart addTarget:self action:@selector(startsSliderChanged) forControlEvents:UIControlEventValueChanged];
    [self.sliderSrart addTarget:self action:@selector(startsSliderTouched) forControlEvents:UIControlEventValueChanged];
}
- (IBAction)actionSliderEnd:(UISlider *)sender {
    self.labelTimeEnd.text = @"00:30";
    [self.sliderEnd addTarget:self action:@selector(endSliderChanged) forControlEvents:UIControlEventValueChanged];
    [self.sliderEnd addTarget:self action:@selector(endSliderTouched) forControlEvents:UIControlEventValueChanged];
}
- (void) startsSliderChanged{
    int valueInMinutes = self.sliderSrart.value * 1409;
    
    
    if (self.sliderSrart.value - self.sliderEnd.value > 0){
        self.sliderEnd.value = self.sliderSrart.value;
        self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes]];
        self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes + 30]];
        
    }
    else{
        self.sliderSrart.value = self.sliderEnd.value;
        self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes]];
        self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes + 30]];
        
    }
}
- (void) endSliderChanged{
    int valueInMinutes = self.sliderEnd.value * 1439;
    if (self.sliderSrart.value - self.sliderEnd.value > 0){
        self.sliderSrart.value = self.sliderEnd.value;
        self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes]];
        self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes - 30]];
        
    }
    else {
        
        self.sliderSrart.value = self.sliderEnd.value;
        self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes - 30]];
        self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%i", valueInMinutes]];
        
    }
    
}
- (void) startsSliderTouched{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 123.5);
    }];
}

- (void) endSliderTouched{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 164.5);
    }];
}



#pragma mark - IMAGE!
- (void) newScrollViews{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(120, 191.5, 190, 100)];
    scrollView.backgroundColor = [UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(190*6, 100);
    scrollView.layer.cornerRadius = 3.0f;
    //scrollView.delegate = self;
    for (int i = 0; i < 6; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"PartyLogo_Small_%d", i]];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(190*i, 0, 190, 80)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView setImage:image];
        [scrollView addSubview:imageView];
    }
    self.viewScroll = scrollView;
    [self.view addSubview:scrollView];
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(120, 273, 190, 20)];
    pageControl.numberOfPages = 6;
    pageControl.backgroundColor = [UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1];
    [pageControl addTarget:self
                    action:@selector(actionPageControl)
          forControlEvents:UIControlEventValueChanged];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
}
- (IBAction)actionPageControl:(UIPageControl *)sender {
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 241);
    }];
    CGPoint contentOffset = CGPointMake(self.viewScroll.frame.size.width * self.pageControl.currentPage, 0);
    [self.viewScroll setContentOffset:contentOffset animated:YES];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 241);
    }];
    NSInteger currentPage = self.viewScroll.contentOffset.x/self.viewScroll.frame.size.width;
    [self.pageControl setCurrentPage:currentPage];
    
}
#pragma mark - Description!!!
-(void) newDescription{
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 375, 50)];
    toolbar.barStyle = UIBarStyleBlackOpaque;
    toolbar.backgroundColor = [UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1];
    
    UIBarButtonItem *itemCancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                   style:UIBarButtonItemStylePlain target:self action:@selector(buttonCancelOnDescription)];
    UIBarButtonItem *itemDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                 style:UIBarButtonItemStyleDone target:self action:@selector(buttonDoneOnDescription)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:nil action:nil];
    itemDone.tintColor = itemCancel.tintColor = [UIColor whiteColor];
    toolbar.items = @[itemCancel, flexibleSpace, itemDone];
    [toolbar sizeToFit];
    self.viewDescription.inputAccessoryView = toolbar;
    
}
- (void) buttonCancelOnDescription{
    self.viewDescription.text = self.textDescription.text;
    [self.viewDescription resignFirstResponder];
}


- (void) buttonDoneOnDescription{
    
    [self.viewDescription resignFirstResponder];
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 359.5);
    }];
    return YES;
}

- (BOOL) textViewShouldEndEditing:(UITextView *)textView{
    self.textDescription.text = self.viewDescription.text;
    return YES;
    
}
-(void)keyboardWillShow:(NSNotification*)notification{
    if(self.viewDescription.isFirstResponder){
        CGRect keyboardRect =
        [[[notification userInfo]
          objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        float duration =
        [[[notification userInfo]
          objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        [UIView animateWithDuration:duration animations:^{
            CGRect viewFrame = self.view.frame;
            viewFrame.origin.y -= keyboardRect.size.height;
            self.view.frame = viewFrame;
        }];
    } else{
        return;
    }
}
-(void)keyboardWillHide:(NSNotification*)notification{
    float duration = [[[notification userInfo]
                       objectForKey:UIKeyboardAnimationDurationUserInfoKey]
                      floatValue];
    
    [UIView animateWithDuration:duration animations:^{
        CGRect viewFrame = self.view.frame;
        viewFrame.origin.y = 64;
        self.view.frame = viewFrame;
    }];
}

#pragma mark - Last buttons, Cancel and Save!
- (IBAction)actionChooseLocation:(UIButton *)sender {
    NSLog(@"Ukrine");
}
#pragma mark - BIG Line!!!

-(void) newLineRight{
UIView *moving = [[UIView alloc] initWithFrame:CGRectMake(15, 27, 14, 14)];
moving.center = CGPointMake(15, 27);
moving.layer.cornerRadius = 7.5f;
moving.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
[moving.layer setBorderWidth: 2];
[moving.layer setBorderColor:[UIColor colorWithRed:107/255.f green:107/255.f blue:108/255.f alpha:1].CGColor];
self.moving = moving;
[self.view addSubview:moving];
    


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

