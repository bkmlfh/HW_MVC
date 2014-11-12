//
//  ViewController.m
//  Hw_mvc
//
//  Created by Admin on 12.11.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSData *color = [UIColor whiteColor];
    color = [[NSUserDefaults standardUserDefaults] objectForKey:@"color"];

    NSNumber *location=[[NSUserDefaults standardUserDefaults] objectForKey:@"slider"];
    location = location ? location: @0;
    self.Slider.value = location.floatValue;
    
    NSNumber *button = [[NSUserDefaults standardUserDefaults]objectForKey:@"segment"];
   button = button ? button :@0;
    
   NSNumber *boolean = [[NSUserDefaults standardUserDefaults] objectForKey:@"switch"];
    boolean = boolean ? boolean :@0;
    
    NSString *str= [[NSUserDefaults standardUserDefaults] objectForKey:@"text"];
    self.Text.text = str;
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Switcher:(id)sender {
    int s = self.Switch.isOn;
    [[NSUserDefaults standardUserDefaults] setObject:@(s) forKey:@"boolean"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)SegmentControl:(id)sender {
    int i = self.SegmentedControl.selectedSegmentIndex;
    [[NSUserDefaults standardUserDefaults] setObject:@(i) forKey:@"segment"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)Slider:(id)sender {
    float p = self.Slider.value;
    [[NSUserDefaults standardUserDefaults] setObject:@(p) forKey:@"slider"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}

- (IBAction)TextField:(id)sender {
    NSString *str = self.Text.text;
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"text"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)Button:(id)sender {
    UIColor *color = [self randColor];
    self.Button.backgroundColor = color;
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:color] forKey:@"color"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (UIColor *)randColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); // 0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}







@end
