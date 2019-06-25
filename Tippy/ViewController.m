//
//  ViewController.m
//  Tippy
//
//  Created by yujinkim on 6/25/19.
//  Copyright © 2019 yujinkim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Tip Calculator";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    
    NSLog(@"%f", doubleValue);
    if (doubleValue == 0.15) {
        self.tipControl.selectedSegmentIndex = 0;
    }
    else if (doubleValue == 0.18)
    {
        self.tipControl.selectedSegmentIndex = 1;
    }
    else{
        self.tipControl.selectedSegmentIndex = 2;
    }
    // If doubleValue == 0.18, set segmentedControl.index = 1
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"Tip Calculator";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    if (doubleValue == 0.15) {
        self.tipControl.selectedSegmentIndex = 0;
    }
    else if (doubleValue == 0.18)
    {
        self.tipControl.selectedSegmentIndex = 1;
    }
    else{
        self.tipControl.selectedSegmentIndex = 2;
    }
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.18), @(0.20)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

@end
