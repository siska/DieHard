//
//  ViewController.m
//  DieHard
//
//  Created by S on 10/8/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <DieDelegate>
@property (weak, nonatomic) IBOutlet UILabel *dieLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.die = [[Die alloc] init];
    //step 3 - we added this line to create an object of Die in viewDidLoad so it's only created once and then assigned back to the die property so it's always kept
    self.die.delegate = self; //step 4 - this is telling the Die class that it's delegate is the View Controller - like when in Storyboard we drag the delegate into ViewController
}

//step 1 - we added the IBOutlet and then this action item - we'll likely call the method in the die.m file
- (IBAction)onRollButtonPressed:(id)sender
{
    [self.die roll];
    //step 3 - we initiated the roll method from the Die class on the self.die that we instantiated in viewDidLoad
}

- (void)dieFellOffTheTable
{
    self.dieLabel.text = @"😥";
    NSLog(@"ViewController being told the die fell off the table");
}

-(void)dieRollWithValue:(int)value //this is the  method that we created ourselves in Die.h and then told what it does in Die.m
{
    self.dieLabel.text = @(value).description; //step 4 - the cool way he said we could get the NSString from the int - value passes the random number back that we got from the dieRollWithValue and then this is making value an NSNumber which has a description property that returns always an NSString
    NSLog(@"Viewcontroller - die told me to roll %d", value);
}
@end
