//
//  NewTripViewController.m
//  RoadtripTrackerCoreData
//
//  Created by Alain  on 2015-06-06.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import "NewTripViewController.h"

@interface NewTripViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tripNameTextField;

@end

@implementation NewTripViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)startButtonWasPressed:(UIButton *)sender {
}

- (IBAction)cancelButtonWasPressed:(UIButton *)sender {
    
      [self dismissViewControllerAnimated:YES completion:nil];
}

@end
