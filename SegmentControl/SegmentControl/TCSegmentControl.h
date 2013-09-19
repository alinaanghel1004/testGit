//
//  TCSegmentControl.h
//  SegmentControl
//
//  Created by alina on 9/20/13.
//  Copyright (c) 2013 alina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCSegmentControl : UIControl

@property (nonatomic) NSInteger numberOfSegments;
@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic) CGFloat totalWidth;

@end
