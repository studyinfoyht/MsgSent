//
//  ViewController.m
//  MsgSent
//
//  Created by Michael on 2018/4/19.
//  Copyright © 2018年 michaelyht. All rights reserved.
//

#import "ViewController.h"
#import "C.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    C *c = [[C alloc] init];
    [c sleepA];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
