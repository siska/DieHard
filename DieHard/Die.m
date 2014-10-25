//
//  Die.m
//  DieHard
//
//  Created by S on 10/8/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "Die.h"

@implementation Die

- (void) roll
{

    //ste 2 - we created a new class for die and implemented a roll method - it won't work yet because we haven't set up a delegate or actually called this method yet
    //this is dispatch after snippet
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"This happens second");
        int randomNumber = arc4random_uniform(6)+1; //we changed this in step 4 - the (6)+1 means we get values from 0-5 and then we add 1

        if (randomNumber > 4)
        {
            NSLog(@"I'm the die telling the Viewcontroller the die fell off the table");
            [self.delegate dieFellOffTheTable];
        }
        else
        {
        NSLog(@"I'm the die telling the delegate that the roll is %d", randomNumber);
        [self.delegate dieRollWithValue:randomNumber]; //step 4 - we implement this to correspond to the dieRollWithValue method that we implemented in the Die.h file
        }
    });
 //when you see the hat in the thing above, it means the code will be executed later - we the order goes to around line 23 and then it'll go back to the arc4random after a second
    NSLog(@"This will print first");
}

@end
