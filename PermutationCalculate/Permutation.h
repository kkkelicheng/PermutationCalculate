//
//  Permutation.h
//
//  Created by licheng ke on 2016/12/28.
//  Copyright © 2016年 licheng ke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Permutation : NSObject


/**
 计算出所有的排列组合方式
 例如从11个中选取5个，totalNum就是11，pickNum就是5
 
 @param pickNum  目标个数
 @param totalNum  抽取对象个数 

 @return 所有的排列组合方式
 */
- (NSArray *)pickPermutation:(int)pickNum totalNum:(int)totalNum;





/**
 计算出排列组合个数
 例如从11个中选取5个，totalNum就是11，pickNum就是5
 @param pickNum  目标个数
 @param totalNum  抽取对象个数
 
 @return 所有的排列组合的个数
 */
- (NSInteger)pickNum:(int)pickNum totalNum:(int)totalNum;



@end
