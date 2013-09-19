//
//  TCViewController.m
//  SegmentControl
//
//  Created by alina on 9/20/13.
//  Copyright (c) 2013 alina. All rights reserved.
//

#import "TCViewController.h"

@interface TCViewController ()

@end

@implementation TCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.segmentControl = [[TCSegmentControl alloc] initWithFrame:CGRectMake(0, 70, 320, 40)];
    self.segmentControl.numberOfSegments = 4;

    
    
    [self.view addSubview:self.segmentControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
