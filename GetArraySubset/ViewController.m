//
//  ViewController.m
//  GetArraySubset
//
//  Created by cs on 2018/8/1.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    NSArray *array = @[@"a"];
    //    NSArray *array = @[@"a",@"b"];
    //    NSArray *array = @[@"a",@"b",@"c"];
    //    NSArray *array = @[@"a",@"b",@"c",@"d"];
    NSArray *array = @[@"a",@"b",@"c",@"d",@"e"];
    NSMutableArray *numbers = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        [numbers addObject:[NSNumber numberWithInt:0]];
    }
    
    [self subElements:array numbers:numbers index:0];
}

/**
 求数组所有子集
 
 @param array 原始数组
 @param numbers 数字数组 - 用于标识使用
 @param index 索引
 */
- (void)subElements:(NSArray *)array numbers:(NSMutableArray *)numbers index:(int)index {
    NSLog(@"index = %d, numbers = %@",index,[self getArrStr:numbers]);
    if (index == array.count) {
        NSMutableString *strM = [NSMutableString string];
        for (int i = 0; i < array.count; i++) {
            NSNumber *number = numbers[i];
            if (number.intValue == 1) {
                [strM appendString:array[i]];
            }
        }
        NSLog(@"%@",strM);
         return;
    }
    numbers[index] = [NSNumber numberWithInt:0];
    [self subElements:array numbers:numbers index:index + 1];
    numbers[index] = [NSNumber numberWithInt:1];
    [self subElements:array numbers:numbers index:index + 1];
}

- (NSString *)getArrStr:(NSArray *)array {
    if (array.count == 0) {
        return @"";
    }
    NSMutableString *strM = [NSMutableString string];
    for (int i = 0; i < array.count; i++) {
        if ([array[i] isKindOfClass:[NSString class]]) {
            [strM appendString:array[i]];
        } else if ([array[i] isKindOfClass:[NSNumber class]]) {
            [strM appendString:[NSString stringWithFormat:@"%@",array[i]]];
        }
    }
    return strM;
}

@end
