//
//  Coordinates.h
//  RoadtripTrackerCoreData
//
//  Created by Alain  on 2015-06-06.
//  Copyright (c) 2015 Alain . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Coordinates : NSManagedObject

@property (nonatomic) double lon;
@property (nonatomic) double lat;

@end
