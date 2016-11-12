//
//  ViewController.m
//  testNew
//
//  Created by skladmin on 2016/11/7.
//  Copyright © 2016年 skladmin. All rights reserved.
//

#import "ViewController.h"
#import "testObj.h"
#import "NSObject+AutoCopy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    testObj *obj = [[testObj alloc]init];
    testObj *objIn = [[testObj alloc]init];
    objIn.strCopy_Pro = @"100";
    obj.strCopy_Pro = @"1";
    obj.arrayIM_Pro = @[objIn,objIn,objIn];
    obj.arrayM_Pro = [[NSMutableArray alloc]initWithArray:obj.arrayIM_Pro];
    testObj *objCopy = [obj autoCopy];
    NSLog(@"\n======%@",obj);
    NSLog(@"\n------%@",objCopy);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
