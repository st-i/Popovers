//
//  ViewController.m
//  Popovers
//
//  Created by iStef on 02.08.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import "ViewController.h"
#import "AppInfoViewController.h"

@interface ViewController () <UIPopoverPresentationControllerDelegate, UITextFieldDelegate, DateOfBirthViewControllerDelegate, EducationViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (IBAction)showAppInfo:(UIBarButtonItem *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *appInfoVC = [storyboard instantiateViewControllerWithIdentifier:@"AppInfoVC"];
    
    //AppInfoViewController *appInfoVC = [[AppInfoViewController alloc] init];
    
    appInfoVC.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:appInfoVC animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [appInfoVC popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = sender;
    popController.delegate = self;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag == 2) {
        [self specifyDateOfBirth:textField];
        return NO;
    }else if (textField.tag == 3) {
        [self specifyEducation:textField];
        return NO;
    }else{
        return YES;
    }
}

#pragma mark - Actions

- (IBAction)specifyDateOfBirth:(UITextField *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DateOfBirthViewController *dateOfBirthVC = [storyboard instantiateViewControllerWithIdentifier:@"DateOfBirthViewController"];
    
    dateOfBirthVC.delegate = self;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd/MM/yyyy"];
    
    if (sender.text.length != 0) {
        dateOfBirthVC.date = [df dateFromString:sender.text];
    }
    
    dateOfBirthVC.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:dateOfBirthVC animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [dateOfBirthVC popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    popController.sourceView = sender;
    popController.sourceRect = sender.frame;
    popController.delegate = self;
}

- (IBAction)specifyEducation:(UITextField *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EducationViewController *educationVC = [storyboard instantiateViewControllerWithIdentifier:@"EducationViewController"];
    
    educationVC.delegate = self;
    
    educationVC.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:educationVC animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [educationVC popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    popController.sourceView = sender;
    popController.sourceRect = sender.frame;
    popController.delegate = self;
}

-(void)changeValueOfDateOfBirthdayToString:(NSString *)string
{
    self.dateOfBirthTF.text = string;
}

-(void)changeValueOfEducationToString:(NSString *)string
{
    self.educationTF.text = string;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 0) {
        return [self.lastNameTF becomeFirstResponder];
    }else{
        return [textField resignFirstResponder];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
