//
//  EducationViewController.m
//  Popovers
//
//  Created by iStef on 03.08.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController ()

@end

@implementation EducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.educationLevels = [NSArray arrayWithObjects:@"Secondary general education", @"Secondary professional education", @"Higher education - bachelor's degree", @"Higher education - specialty, master's degree", nil];
    //self.tableView.delegate = self;
    //self.tableView.dataSource = self;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    if (indexPath.row == 2 || indexPath.row == 3) {
        cell.textLabel.numberOfLines = 2;
    }
    
    cell.textLabel.text = self.educationLevels[indexPath.row];
    
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell isEqual:self.lastCell]) {
        if (self.lastCell.accessoryType == UITableViewCellAccessoryCheckmark) {
            self.lastCell.accessoryType = UITableViewCellAccessoryNone;
            self.stringWithEdLevel = nil;
            self.edLevelIndexPath = nil;
            [self.delegate changeValueOfEducationToString:nil];
        }else{
            self.lastCell.accessoryType = UITableViewCellAccessoryNone;
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            self.stringWithEdLevel = cell.textLabel.text;
            self.edLevelIndexPath = indexPath;
            [self.delegate changeValueOfEducationToString:cell.textLabel.text];
        }
    }else{
        self.lastCell.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.stringWithEdLevel = cell.textLabel.text;
        self.edLevelIndexPath = indexPath;
        [self.delegate changeValueOfEducationToString:cell.textLabel.text];
    }
    
    
    self.lastCell = cell;
}

- (IBAction)cancelAction:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneAction:(UIBarButtonItem *)sender
{
    //[self.delegate changeValueOfEducationToString:self.cellText];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
