#!usr/bin/perl

#exercise 1
#p37练一练
#输出1000以内的所有奇数到一个数组(@ji_shu)中，然后以每行打印一个数字的形式把它们输出出来，
#并将其中是3的倍数的奇数在同一行输出两遍。
#==================================
@ji_shu = ();
$numCnt = 0;
$num = 0;
while ($num < 1000)
{
    if ($num%2 == 1)
    {
        print "$num ";
        $ji_shu[$numCnt] = $num;
        $numCnt++;
    }

    $num++;
}

for ($i = 0; $i < $numCnt; $i++)
{
    if ($ji_shu[$i]%3 == 0)
    {
        print "$ji_shu[$i] ";
    }
    print "$ji_shu[$i]\n";
}
