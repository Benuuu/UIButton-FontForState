//
//  UIButton+FontForState.h
//  FontForState
//
//  Created by Benjamin Wu on 11/15/13.
//  Copyright (c) 2013 Intrepid Pursuits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (FontForState)

- (UIFont *)fontForState:(UIControlState)state;
- (void)setFont:(UIFont *)font forState:(UIControlState)state;

@end
