//
//  main.m
//  PermutationCalculate
//
//  Created by licheng ke on 2016/12/28.
//  Copyright © 2016年 licheng ke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Permutation.h"

void test1()
{
    Permutation * p = [Permutation new];
    NSArray * indexArrays = [p pickPermutation:3 totalNum:5];
    NSLog(@"%@ \n---\n组合个数：%@",indexArrays,@(indexArrays.count));
}

//业务处理
void test2()
{
    //产生伪数据，将对象放入这个数组里面就行了，到时候用得到的索引取取值。
    NSMutableArray * mutableArr = [NSMutableArray array];
    for(int i = 0; i < 16; i ++){
        [mutableArr addObject:[NSString stringWithFormat:@"%c",'A' + i]];
    }
    NSArray * objects = [mutableArr copy];
    
    //产生结果
    Permutation * p = [Permutation new];
    NSArray * indexArrays = [p pickPermutation:3 totalNum:16];
    
    //业务处理过程
    for (NSString * combines in indexArrays) {
        NSArray * indexs = [combines componentsSeparatedByString:@","];
        for (NSString * indexString in indexs) {
            id obj = [objects objectAtIndex:[indexString intValue]];
            //.... do something with obj
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
        NSLog(@"\n------\n");
//        test2();
    }
    return 0;
}
