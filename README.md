# PermutationCalculate
排列组合的计算，计算所有组合方式

### 计算出所有的组合方式

例如：从5个中选出3个所有的组合
```
    Permutation * p = [Permutation new];
    NSArray * indexArrays = [p pickPermutation:3 totalNum:5];
```


```

"0,1,2",
"0,1,3",
"0,1,4",
"0,2,3",
"0,2,4",
"0,3,4",
"1,2,3",
"1,2,4",
"1,3,4",
"2,3,4"

```

### 计算出不同排列组合的情况数
```
    NSInteger count = [p pickNum:pickNum totalNum:totalNum];
```



