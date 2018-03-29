#!usr/bin/perl

#exercise 1
#p26练一练
#请在屏幕上输出小于1000的所有奇数，分别使用while和for两种语句编写
#==================================
$num = 0;
while ($num < 1000)
{
    if ($num%2 == 1)
    {
        print "$num ";
    }

    $num++;
}

for ($num = 0; $num < 1000; $num++)
{
    if ($num%2 == 1)
    {
        print "$num ";
    }
}
