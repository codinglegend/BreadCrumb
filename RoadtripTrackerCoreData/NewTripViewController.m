//
//  NewTripViewController.m
//  RoadtripTrackerCoreData
//
//  Created by Alain  on 2015-06-06.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import "NewTripViewController.h"
#import "CoreDataStack.h"
#import "Trip.h"

@interface NewTripViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tripNameTextField;

@end

@implementation NewTripViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)insertTrip {
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    
    Trip *trip = [NSEntityDescription insertNewObjectForEntityForName:@"Trip" inManagedObjectContext:coreDataStack.managedObjectContext];
    
    trip.name = self.tripNameTextField.text;
    
    trip.date  = [[NSDate alloc] init];
    [coreDataStack saveContext];
    
}

- (IBAction)startButtonWasPressed:(UIButton *)sender {
    
    [self insertTrip];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)cancelButtonWasPressed:(UIButton *)sender {
    
      [self dismissViewControllerAnimated:YES completion:nil];
}

@end
