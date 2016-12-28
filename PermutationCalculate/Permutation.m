
//
//  Permutation.m
//
//  Created by licheng ke on 2016/12/28.
//  Copyright © 2016年 licheng ke. All rights reserved.
//

#import "Permutation.h"

@interface Permutation ()
@property (nonatomic,strong) NSArray<NSString *> * toHexMap;
@property (nonatomic,strong) NSDictionary <NSString *,NSString *> * toDecMap;
@end

@implementation Permutation


/*
 *  0-9 10个数字
 *  A-Z 26个英文数字
 */
static const int LCPickMax = 36;


#pragma mark - 调用接口

- (NSArray *)pickPermutation:(int)pickNum totalNum:(int)totalNum
{
    NSAssert(pickNum <= totalNum, @"选择数不能比总数大");
    
    NSArray * result = [self localArrayIndex:0 andLength:totalNum countIndex:0 count:pickNum];
    
 // comment two lines for Increase speed
    NSInteger count = [self pickNum:pickNum totalNum:totalNum];
    NSLog(@"%@选%@预期个数：%@",@(totalNum),@(pickNum),@(count));
    
    return result;
}

- (NSInteger)pickNum:(int)pickNum totalNum:(int)totalNum
{
    if (pickNum > totalNum) {
        return 0;
    }
    else{
        NSInteger num1 = [self factorialWithStartNumber:totalNum - pickNum + 1 endNumber:totalNum];
        NSInteger num2 = [self factorialWithStartNumber:1 endNumber:pickNum];
        return  num1/num2;
    }
}


#pragma mark - 核心计算公式
/**
 
 核心计算公式
 
跑位    o1  o2  o3  o4
对象    A   B   C   D   E F G H I J
序号    0   1   2   3   4 5 6 7 8 9
 
 o1 到 o4 是代表目标数值
 目标长度是4，o1是最高位。
 当前跑序点的位置分别为 0 - 3
 
 A 到 J 是代表对象 长度是 10
 
 @param location 最高位的起点
 @param length   对象长度
 @param index    当前跑序点的位置
 @param count    目的长度
 
 @return 0 - 1
 */

- (NSArray * )localArrayIndex:(int)location
                    andLength:(int)length
                   countIndex:(int)index
                        count:(int)count
{
    if (length > self.toHexMap.count) {
        NSLog(@"对象长度过长");
        return nil;
    }
    
    NSMutableArray * arr = [NSMutableArray array];
    int rightPadding = count - 1 - index;
    if (rightPadding == 0) {
        for (; location < length ; location ++) {
            [arr addObject:[NSString stringWithFormat:@"%@",self.toHexMap[location]]];
        }
    }
    else {
        for (; location < length - rightPadding; location ++) {
            NSArray * subs = [self localArrayIndex:location + 1 andLength:length countIndex:index + 1 count:count];
            for (NSString * string in subs) {
                [arr addObject:[NSString stringWithFormat:@"%@%@",self.toHexMap[location],string]];
            }
        }
    }
    return [arr copy];
    
}



#pragma mark - 辅助转换&数学计算

/*
 *  0-9 A-Z 数组
 */
- (NSArray<NSString *> *)toHexMap
{
    if (!_toHexMap) {
        NSMutableArray * arr = [NSMutableArray array];
        for (int i = 0; i < LCPickMax; i ++) {
            NSString * charString = nil;
            if (i >= 10) {
                char c = 'A' + i - 10;
                charString = [NSString stringWithFormat:@"%c",c];
            }
            else {
                charString = [NSString stringWithFormat:@"%@",@(i)];
            }
            [arr addObject:charString];
        }
        _toHexMap = arr.copy;
    }
    return _toHexMap;
}


/*
 *  对应关系 {@"0":@"0" ,...., @"A":@(10)....@"Z":@(35)};
 */
- (NSDictionary<NSString * , NSString *> *)toDecMap
{
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    if (!_toDecMap) {
        for (int x = 0; x < LCPickMax; x ++) {
            NSString * keyString = @"";
            if (x < 10) {
                keyString = [NSString stringWithFormat:@"%@",@(x)];
            }
            else{
                char c = 'A' + x - 10;
                keyString = [NSString stringWithFormat:@"%c",c];
            }
            [dict setObject:@(x) forKey:keyString];
        }
        _toDecMap = dict.copy;
    }
    return _toDecMap;
}


/**
 阶乘
 
 @param startNumber 起始数
 @param endNumber   结束数

 @return 阶乘结果
 */
- (NSInteger)factorialWithStartNumber:(NSInteger)startNumber
                            endNumber:(NSInteger)endNumber
{
    NSInteger result = 1;
    for (; startNumber <= endNumber; startNumber ++) {
        result = result * startNumber;
    }
    return  result;
}



@end

