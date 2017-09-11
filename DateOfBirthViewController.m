//
//  DateOfBirthViewController.m
//  Popovers
//
//  Created by iStef on 03.08.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import "DateOfBirthViewController.h"

@interface DateOfBirthViewController () 

@end

@implementation DateOfBirthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.date) {
        [self.dateOfBirth setDate: self.date];
    }
    
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

- (IBAction)cancelAction:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneAction:(UIBarButtonItem *)sender
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd/MM/yyyy"];
    NSString *stringDate = [df stringFromDate:self.dateOfBirth.date];
    
    [self.delegate changeValueOfDateOfBirthdayToString:stringDate];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
