//
//  Die.h
//  DieHard
//
//  Created by S on 10/8/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol DieDelegate
- (void)dieRollWithValue:(int)value;
- (void)dieFellOffTheTable;
@end


@interface Die : NSObject
- (void) roll;
@property id <DieDelegate> delegate;
@end
