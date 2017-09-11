//
//  ViewController.h
//  Popovers
//
//  Created by iStef on 02.08.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateOfBirthViewController.h"
#import "EducationViewController.h"

@interface ViewController : UITableViewController <UITableViewDelegate>

- (IBAction)showAppInfo:(UIBarButtonItem *)sender;
- (IBAction)specifyDateOfBirth:(UITextField *)sender;
- (IBAction)specifyEducation:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthTF;
@property (weak, nonatomic) IBOutlet UITextField *educationTF;




@end

