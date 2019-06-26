//
//  SettingsViewController.m
//  Tippy
//
//  Created by yujinkim on 6/25/19.
//  Copyright © 2019 yujinkim. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultControl;
@property (weak, nonatomic) IBOutlet UISwitch *modeControl;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    if (doubleValue == 0.15) {
        self.defaultControl.selectedSegmentIndex = 0;
    }
    else if (doubleValue == 0.18)
    {
        self.defaultControl.selectedSegmentIndex = 1;
    }
    else{
        self.defaultControl.selectedSegmentIndex = 2;
    }
   
}
- (IBAction)defaultChanged:(id)sender {
    NSArray *defaultPercentages = @[@(0.15), @(0.18), @(0.20)];
        double defaultPercentage = [defaultPercentages[self.defaultControl.selectedSegmentIndex] doubleValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:defaultPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
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
