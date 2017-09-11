//
//  DateOfBirthViewController.h
//  Popovers
//
//  Created by iStef on 03.08.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@protocol DateOfBirthViewControllerDelegate <NSObject>
@required
-(void)changeValueOfDateOfBirthdayToString:(NSString *)string;
@end


@interface DateOfBirthViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *dateOfBirth;
- (IBAction)cancelAction:(UIBarButtonItem *)sender;
- (IBAction)doneAction:(UIBarButtonItem *)sender;

@property (strong, nonatomic) NSDate *date;

@property (weak, nonatomic) id <DateOfBirthViewControllerDelegate> delegate;


@end
