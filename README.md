# PermutationCalculate
排列组合的计算，计算所有组合方式

###计算出所有的组合方式

例如：从5个中选出3个所有的组合
```
    Permutation * p = [Permutation new];
    NSArray * indexArrays = [p pickPermutation:3 totalNum:5];
```
结果是以一系列字符串组成的，最多支持的对应关系有36位，从0-9，A-Z，所以最多支持从36个对象中选择。

```
    012,
    013,
    014,
    023,
    024,
    034,
    123,
    124,
    134,
    234
```

###计算出不同排列组合的情况数
```
    NSInteger count = [p pickNum:pickNum totalNum:totalNum];
```



