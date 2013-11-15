//
//  IPViewController.m
//  FontForState
//
//  Created by Benjamin Wu on 11/15/13.
//  Copyright (c) 2013 Intrepid Pursuits. All rights reserved.
//

#import "IPViewController.h"
#import "UIButton+FontForState.h"

@interface IPViewController ()

@property (weak, nonatomic) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet UIButton *enableButton;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@end

@implementation IPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIFont *normalFont = [UIFont fontWithName:@"Arial" size:12.0];
    UIFont *selectedFont = [UIFont fontWithName:@"TimesNewRomanPSMT" size:8.0];
    UIFont *highlightedFont = [UIFont fontWithName:@"MarkerFelt-Thin" size:14.0];
    UIFont *disabledFont = [UIFont fontWithName:@"Zapfino" size:16.0];
    UIFont *selectedDisabledFont = [UIFont fontWithName:@"Verdana-Italic" size:12.0];
    
    [self.testButton setFont:normalFont forState:UIControlStateNormal];
    [self.testButton setFont:selectedFont forState:UIControlStateSelected];
    [self.testButton setFont:highlightedFont forState:UIControlStateHighlighted];
    [self.testButton setFont:disabledFont forState:UIControlStateDisabled];
    [self.testButton setFont:selectedDisabledFont forState:UIControlStateSelected|UIControlStateDisabled];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    if (sender == self.enableButton) {
        self.testButton.enabled = !self.testButton.enabled;
    } else if (sender == self.selectButton) {
        self.testButton.selected = !self.testButton.selected;
    }
}

@end
