# 洛谷刷题

**build for exercise in 洛谷**

## 壹 · [DP基础](https://www.luogu.com.cn/training/5011#problems)

### [P1049 [NOIP2001 普及组\] 装箱问题 ](https://www.luogu.com.cn/problem/P1049)

```c++
/**经典DP**/
#include <iostream>
#include <vector>
#include <cstdio>
#include <cmath>

using namespace std;

const int M = 25000;
const int N = 50;

int main()
{
    freopen("input.txt","r",stdin);

    int vol,n;
    int dp[M] = {0};
    int cubes[N];

    scanf("%d%d",&vol,&n);

    for(int i = 0; i < n; i++)
        scanf("%d",cubes + i);
    
    for(int i = 0; i <= vol; i++)
    {
        for(int j = 0; j < n; j++)
        {
            if(i - dp[i] >= cubes[j])
                dp[i] += cubes[j];
            else if(i - cubes[j] > 0)
                dp[i] = max(cubes[j] + dp[i - cubes[j]], dp[i]);
        }
    }

    printf("%d\n",vol - dp[vol]);

    return 0;
}
```

### [P1048 [NOIP2005 普及组\] 采药 - 洛谷 ](https://www.luogu.com.cn/problem/P1048)

```c++
/**
 * 经典背包，但是我已经不熟悉了，简单来说：
 * dp[i][j]表示前i个物品中容量为j时的最大价值，每次的更新矩阵为dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - weight[i]] + val[i])
 * max函数中第一个值表示不将第i个物体添加到背包中，第二个值表示将第i个物体添加到背包中。
 * OK,接下来将其缩小到一维矩阵中，注意此时j的遍历不能从前往后，即不能从背包容量小到背包容量大的方向遍历，由于使用的是同一个矩阵，
 * 这样遍历会导致相同的物体被多次添加到背包中，只能从后往前遍历。
 * End!
 * **/
#include <iostream>
#include <vector>
#include <cstdio>
#include <cmath>

using namespace std;

const int T = 1000;
const int M = 105;

int main()
{
    freopen("input.txt","r",stdin);

    int aviableTime,n;
    int timeTable[M],valTable[M];
    int dp[T] = {0};

    cin>>aviableTime>>n;
    
    for(int i = 1; i <= n; i++)
    {
        cin>>timeTable[i];
        cin>>valTable[i];
    }

    for(int i = 1; i <= n; i++)
    {
        for(int j = aviableTime; j >= timeTable[i] ; j--)
        {
            dp[j] = max(dp[j], dp[j - timeTable[i]] + valTable[i]);
        }
    }

    printf("%d\n", dp[aviableTime]);
    
    return 0;
}
```

