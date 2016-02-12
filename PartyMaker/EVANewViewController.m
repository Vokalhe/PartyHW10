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

@end

@implementation EVANewViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *repeat = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:
                                UIBarButtonItemStylePlain target:self action:@selector
                                (buttonCancel)];
    self.navigationItem.leftBarButtonItem = repeat;
    [repeat  setTintColor:[UIColor blackColor]];
    
    [self newScrollViews];
    [self newDescription];
    [self newLineRight];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button CHOOSE DATE!
- (IBAction)actionChooseDate:(UIButton *)sender {
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame: CGRectMake(0, 409.5, 320, 158.5)];
    datePicker.backgroundColor = [UIColor whiteColor];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 373.5, 320, 36)];
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
        self.moving.center = CGPointMake(15, 91);
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
    
    //[self.yourPartyName setReturnKeyType:UIReturnKeyDone];
    [self.view endEditing:YES];
    
}
- (BOOL) textFieldShouldReturn:(UITextField*) textField;{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 140);
    }];
    self.yourPartyName = textField;
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - sliders Time!

- (IBAction)actionSliderStart:(UISlider *)sender {
    //self.labelTimeStart.text = @"00:00";
    [self.sliderSrart addTarget:self action:@selector(startsSliderChanged) forControlEvents:UIControlEventValueChanged];
    [self.sliderSrart addTarget:self action:@selector(startsSliderTouched) forControlEvents:UIControlEventValueChanged];
}
- (IBAction)actionSliderEnd:(UISlider *)sender {
  //  self.labelTimeEnd.text = @"00:30";
    [self.sliderEnd addTarget:self action:@selector(endSliderChanged) forControlEvents:UIControlEventValueChanged];
    [self.sliderEnd addTarget:self action:@selector(endSliderTouched) forControlEvents:UIControlEventValueChanged];
}
- (void) startsSliderChanged{
    
    if (self.sliderSrart.value > self.sliderEnd.value - 30){
        self.sliderEnd.value = self.sliderSrart.value + 30;
        self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%f", self.sliderEnd.value] ];
        self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%f", self.sliderSrart.value]];
    }
        else{
            self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%f", self.sliderEnd.value]];
            self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%f", self.sliderSrart.value] ];
        }
        
    }

- (void) endSliderChanged{

    if (self.sliderEnd.value > self.sliderSrart.value + 30){
        
        self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%f", self.sliderEnd.value]];
        self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%f", self.sliderSrart.value]];
    }
    else{
        self.sliderSrart.value = self.sliderEnd.value - 30;
        self.labelTimeEnd.text = [NSString convertAll:[NSString stringWithFormat:@"%f", self.sliderEnd.value]];
        self.labelTimeStart.text = [NSString convertAll:[NSString stringWithFormat:@"%f", self.sliderSrart.value]];
    }
    
}
- (void) startsSliderTouched{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 187.5);
    }];
}

- (void) endSliderTouched{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 228.5);
    }];
}



#pragma mark - IMAGE!
- (void) newScrollViews{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(120, 255.5, 190, 100)];
    scrollView.backgroundColor = [UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(190*6, 100);
    scrollView.layer.cornerRadius = 3.0f;
    
    for (int i = 0; i < 6; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"PartyLogo_Small_%d", i]];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(190*i, 10, 190, 60)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView setImage:image];
        [scrollView addSubview:imageView];
    }
    scrollView.delegate = self;
    self.viewScroll = scrollView;
    [self.view addSubview:scrollView];
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(120, 337, 190, 20)];
    
    
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:(255/255) green:255/255 blue:255/255 alpha:1];
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:29/255 green:31/255 blue:36/255 alpha:1];
    pageControl.numberOfPages = 6;
    pageControl.backgroundColor = [UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1];
    [pageControl addTarget:self
                    action:@selector(onPageControlValueChanged:)
          forControlEvents:UIControlEventValueChanged];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 304);
    }];
}
- (void) onPageControlValueChanged:(UIPageControl *)sender {
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 304);
    }];
    CGPoint contentOffset = CGPointMake(self.viewScroll.frame.size.width * self.pageControl.currentPage, 0);
    [self.viewScroll setContentOffset:contentOffset animated:YES];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 304);
    }];
    NSInteger currentPage = self.viewScroll.contentOffset.x/self.viewScroll.frame.size.width;
    [self.pageControl setCurrentPage:currentPage];
    
}
#pragma mark - Description!!!
-(void) newDescription{/////
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetMaxX(self.view.bounds), 50)];
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
    self.textDescription.inputAccessoryView = toolbar;
    
}
- (void) buttonCancelOnDescription{
    self.textDescription.text = self.textDescription.text;
    [self.textDescription resignFirstResponder];
}


- (void) buttonDoneOnDescription{
    
    [self.textDescription resignFirstResponder];
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView{
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 447);
    }];
    return YES;
}


- (BOOL) textViewShouldEndEditing:(UITextView *)textView{
    self.textDescription.text = self.textDescription.text;
    return YES;
    
}
-(void)keyboardWillShow:(NSNotification*)notification{
    if (!self.isKeyBoardShowed){
    if(self.textDescription.isFirstResponder){
        CGRect keyboardRect =
        [[[notification userInfo]
          objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        float duration =
        [[[notification userInfo]
          objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        [UIView animateWithDuration:duration animations:^{
            CGRect viewFrame = self.view.frame;
            viewFrame.origin.y -= keyboardRect.size.height - 45;
            self.view.frame = viewFrame;
        }];
    } else{
        return;
    }
        self.isKeyBoardShowed = YES;
    }
}
-(void)keyboardWillHide:(NSNotification*)notification{
    float duration = [[[notification userInfo]
                       objectForKey:UIKeyboardAnimationDurationUserInfoKey]
                      floatValue];
    self.isKeyBoardShowed = NO;
    [UIView animateWithDuration:duration animations:^{
        CGRect viewFrame = self.view.frame;
        viewFrame.origin.y = 0;
        self.view.frame = viewFrame;
    }];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWillShow:)
     name:UIKeyboardDidShowNotification
     object:nil];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector: @selector(keyboardWillHide:)
     name:UIKeyboardWillHideNotification
     object:nil];
}
#pragma mark - Last buttons, Cancel and Save!
- (IBAction)actionChooseLocation:(UIButton *)sender {
    NSLog(@"Ukraine");
    [UIView animateWithDuration:0.3f animations:^{
        self.moving.center = CGPointMake(15, 543);
    }];
}

#pragma mark - BIG Line!!!

-(void) newLineRight{
    UIView *moving = [[UIView alloc] initWithFrame:CGRectMake(15, 91, 14, 14)];
    moving.center = CGPointMake(15, 91);
    moving.layer.cornerRadius = 7.5f;
    moving.backgroundColor = [UIColor colorWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1];
    [moving.layer setBorderWidth: 2];
    [moving.layer setBorderColor:[UIColor colorWithRed:107/255.f green:107/255.f blue:108/255.f alpha:1].CGColor];
    self.moving = moving;
    [self.view addSubview:moving];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Cancel!

-(void) buttonCancel{
    
   [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end




