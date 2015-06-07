//
//  DetailViewController.h
//  RoadtripTrackerCoreData
//
//  Created by Alain  on 2015-06-06.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

