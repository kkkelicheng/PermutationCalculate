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
    NSArray * indexArrays = [p pickPermutation:5 totalNum:11];
    NSLog(@"%@ \n组合个数：%@",indexArrays,@(indexArrays.count));
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
    }
    return 0;
}
