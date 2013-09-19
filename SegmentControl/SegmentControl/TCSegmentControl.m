//
//  TCSegmentControl.m
//  SegmentControl
//
//  Created by alina on 9/20/13.
//  Copyright (c) 2013 alina. All rights reserved.
//

#import "TCSegmentControl.h"


#define buttonWidth  97

@implementation TCSegmentControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _selectedIndex = 0;
        _totalWidth = 0;
    }
    return self;
}

- (void)setNumberOfSegments:(NSInteger)nrSegments {

    int xBegin = 0;

    
    for (int i = 0; i < nrSegments; i++) {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i == _selectedIndex) {
            button1.backgroundColor = [UIColor redColor];
        } else {
            button1.backgroundColor = [UIColor grayColor];
        }
        
        button1.frame = CGRectMake(xBegin, 0, buttonWidth, 40);
        button1.layer.borderColor = [UIColor blueColor].CGColor;
        button1.layer.borderWidth = 1.;
        [button1 setTitle:(i==0? @"NEWS":(i==1?@"BRAND":(i==2?@"ENDORS": @"CONTRACT"))) forState:UIControlStateNormal];
        button1.tag = i;
        [button1 addTarget:self action:@selector(didSelectSegment:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:button1];
        xBegin += buttonWidth;
        _totalWidth += button1.frame.size.width;
        
    }
    _numberOfSegments = nrSegments;
}

- (void)didSelectSegment:(id)sender {
    
    CGFloat diff = _totalWidth - [UIScreen mainScreen].bounds.size.width;

    
    UIButton *button = (UIButton *)sender;
    int selectIndex = button.tag;
    CGFloat unit = (CGFloat)diff/(_numberOfSegments-1);
    
    UIButton *subView;
    CGRect frame;
    CGFloat originalXPos = 0;
    for (int i = 0; i < self.numberOfSegments; i++) {
        subView = self.subviews[i];
        
        if (i == selectIndex) {
            subView.backgroundColor = [UIColor redColor];
        } else {
            subView.backgroundColor = [UIColor grayColor];
        }
        
        originalXPos = i * buttonWidth;
        
        frame = subView.frame;
        frame.origin.x = originalXPos - unit * selectIndex;
        subView.frame = frame;
        
        if (frame.origin.x < 0 || (frame.origin.x+frame.size.width) > [UIScreen mainScreen].bounds.size.width) {
            // put a blur imagine at the end
            subView.backgroundColor = [UIColor yellowColor];
        }
    }
    _selectedIndex = selectIndex;
}

@end
