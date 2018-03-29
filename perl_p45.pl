#!usr/bin/perl

#exercise 1
#p45练一练
#自己动手建立哈希变量（%Ages），并向其中添加名叫a的28岁的成员，名叫b的29岁的成员......名叫z的53岁的成员。
#姓名作为Key，年龄作为Value，注意使用循环语句和适当的赋值方法。然后遍历%Ages并输出在屏幕上，要求每一行出现成员的姓名，
#空三个空格再出现该成员的年龄。
#==================================
%Ages = (); #初始化一个空的散列

for ($name = ord('a'), $age = 28; $name <= ord('z'); $name++, $age++)
{
    $key = chr($name);
    $Ages{$key} = $age;
}

foreach my $name (keys %Ages)
{
    print "$name   $Ages{$name}\n";
}
