#!usr/bin/perl

#exercise 1
#p60练一练
#编写一个函数whatToDo，它需要两个参数：人名和星期几。返回值是要做的事。
#如果是周末则返回”某某在星期几看电影“；否则，返回”某某在星期几学习“
#==================================
sub whatToDo
{
    my ($name, $week) = @_; #获取函数参数
    my @weeks = ("星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日");
    my $result = "";
    
    #判断传参变量是否为空
    if (!defined $name || !defined $week)
    {
        print "'name' or 'week' can not be null!\n";
        return;
    }

    #判断传入的星期是否有效
    if (!grep /^$week$/, @weeks)
    {
        print "$week is invalid!\n";
        return;
    }

    if ($week eq "星期六" || $week eq "星期日")
    {
        $result = "$name在$week看电影\n";
    }
    else
    {
        $result = "$name在$week学习\n";
    }
    return $result;
}

print whatToDo("露露", "星期三");
print whatToDo("露露", "星期六");
