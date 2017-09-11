//
//  EducationViewController.h
//  Popovers
//
//  Created by iStef on 03.08.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@protocol EducationViewControllerDelegate <NSObject>

@required
-(void)changeValueOfEducationToString:(NSString *)string;

@end

@interface EducationViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableViewCell *lastCell;
@property (strong, nonatomic) NSString *stringWithEdLevel;
@property (strong, nonatomic) NSIndexPath *edLevelIndexPath;

- (IBAction)cancelAction:(UIBarButtonItem *)sender;
- (IBAction)doneAction:(UIBarButtonItem *)sender;

@property (weak, nonatomic) id <EducationViewControllerDelegate> delegate;

@property (strong, nonatomic) NSArray *educationLevels;


@end
