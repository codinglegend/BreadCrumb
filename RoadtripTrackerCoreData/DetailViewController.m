//
//  DetailViewController.m
//  RoadtripTrackerCoreData
//
//  Created by Alain  on 2015-06-06.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import "DetailViewController.h"
#import "CoreDataStack.h"
#import "Coordinates.h"

@interface DetailViewController (){
    
    BOOL initialLocationSet;
}

@property (nonatomic) CLLocationManager* locationManager;
@property (nonatomic) CLLocation* currentLocation;
@property (nonatomic) NSMutableArray *locationArray;

@end

@implementation DetailViewController

#pragma mark - End Trip Button

- (IBAction)endTripWasPressed:(UIBarButtonItem *)sender {
    //[self.locationManager stopUpdatingLocation]; // did not work
    [self addCoordinatesToCoreData];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
    
//    self.mapView.delegate = self; // not sure if needed
    
    initialLocationSet = false;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    self.locationArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - add coordinates

- (void)addCoordinatesToCoreData {
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    
    Coordinates *coordinate = [NSEntityDescription insertNewObjectForEntityForName:@"Coordinates" inManagedObjectContext:coreDataStack.managedObjectContext];
    
    
    coordinate.lat = self.currentLocation.coordinate.latitude; // = user location latitude
    coordinate.lon = self.currentLocation.coordinate.longitude; // = user location longitude
    

    [coreDataStack saveContext];
    
}


#pragma mark - Location Manager

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation *location = [locations firstObject];
    
    if (!initialLocationSet){
        
        MKCoordinateRegion startingRegion;
        CLLocationCoordinate2D loc = location.coordinate;
        startingRegion.center = loc;
        startingRegion.span.latitudeDelta = 0.02;
        startingRegion.span.longitudeDelta = 0.02;
        [self.mapView setRegion:startingRegion];
        
        //This is still valid but won't zoom in
        //[self.mapView setCenterCoordinate:location.coordinate];
        initialLocationSet = true;
        
    }
    
    [self.locationArray addObject:location];
}

- (void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    //Here you would want to re-request startupdatinglocation
    // if given authorization
    //[_locationManager startUpdatingLocation];
    
}

@end
