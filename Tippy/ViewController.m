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
@property (weak, nonatomic) IBOutlet UILabel *tip;
@property (weak, nonatomic) IBOutlet UILabel *total;

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
    self.billField.text = @"";
    self.tipLabel.text = @"$0.00";
    self.totalLabel.text = @"$0.00";
    
    self.view.backgroundColor = [UIColor blackColor];
}
- (IBAction)onEditBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.tip.frame = CGRectMake(self.tip.frame.origin.x, self.tip.frame.origin.y - 50, self.tip.frame.size.width, self.tip.frame.size.height);
    }];
    [UIView animateWithDuration:0.2 animations:^{
        self.total.frame = CGRectMake(self.total.frame.origin.x, self.total.frame.origin.y - 125, self.total.frame.size.width, self.total.frame.size.height);
    }];
    [UIView animateWithDuration:0.2 animations:^{
        self.tipLabel.frame = CGRectMake(self.tipLabel.frame.origin.x, self.tipLabel.frame.origin.y - 50, self.tipLabel.frame.size.width, self.tipLabel.frame.size.height);
    }];
    [UIView animateWithDuration:0.2 animations:^{
        self.totalLabel.frame = CGRectMake(self.totalLabel.frame.origin.x, self.totalLabel.frame.origin.y - 125, self.totalLabel.frame.size.width, self.totalLabel.frame.size.height);
    }];
}
- (IBAction)onEditEnd:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.tip.frame = CGRectMake(self.tip.frame.origin.x, self.tip.frame.origin.y + 50, self.tip.frame.size.width, self.tip.frame.size.height);
    }];
    [UIView animateWithDuration:0.2 animations:^{
        self.total.frame = CGRectMake(self.total.frame.origin.x, self.total.frame.origin.y + 125, self.total.frame.size.width, self.total.frame.size.height);
    }];
    [UIView animateWithDuration:0.2 animations:^{
        self.tipLabel.frame = CGRectMake(self.tipLabel.frame.origin.x, self.tipLabel.frame.origin.y + 50, self.tipLabel.frame.size.width, self.tipLabel.frame.size.height);
    }];
    [UIView animateWithDuration:0.2 animations:^{
        self.totalLabel.frame = CGRectMake(self.totalLabel.frame.origin.x, self.totalLabel.frame.origin.y + 125, self.totalLabel.frame.size.width, self.totalLabel.frame.size.height);
    }];
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
