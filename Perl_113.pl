#!user/bin/perl

#程序功能：统计pos.txt中出现的词和词性
#实现思想：用值为哈希的哈希封装词和对应词性

open (In, ">pos.txt") || die "can not open pos.txt to write\n";#写模式打开文件
print In "1999-07-002/m  半生/n   用/p   艰辛/a\n";
print In "1999-08-003/m  归来/V   血/n   抚养/v\n";
print In "1999-09-004/m  黄土/n   上/f   在/p\n";
close (In);

open (In,"pos.txt");
while ($Sent = <In>)
{
    #正则表达式中 \s 匹配任意空白字符，\S 匹配任意非空白字符
    #文本样例：1999-07-002/m  半生/n   用/p   艰辛/a

	chomp $Sent;                           #去掉换行符
    print "$Sent\n";
    
	@Words = $Sent =~ /(\S+)\/\S+/g;       #匹配出形如：“xxx/xxx” 的内容
	print "Words: @Words\n";

	#得到每个词的词性
	@POSs = $Sent =~ /\S+\/(\S+)/g;        #匹配出形如：“xxx/__” 的内容,_表示空格
	print "POSs: @POSs\n";

    print "------\n";

	#遍历词和词性，构造值为哈希的哈希（%hash）
	for($i = 0; $i < @Words; $i++)
	{
		if(defined $hash{$Words[$i]})      #查找当前词是否已经在%hash中
		{
			$refPOS = $hash{$Words[$i]};   #取得%hash的值，即指向子哈希的引用
			${$refPOS}{$POSs[$i]} = 1;     #给子哈希加入一个词性
		}
		else
		{
			my %posHash = ($POSs[$i], 1);  #构造一个my类型的子哈希，指向这个哈希的引用作为%hash的值
			$hash{$Words[$i]} = \%posHash; #以word为key, (pos, 1)的哈希作为value
		}
	}
}
close(In);

print "==================\n";
#遍历存放词的哈希%hash
foreach $word (sort keys %hash)
{
	print "$word\t";
	$pPOS = $hash{$word};                  #用word作为key去访问%hash，得到的value是另外一个哈希$pPOS
	foreach $pos(sort keys %{$pPOS})       #遍历哈希$pPOS
	{
		print "$pos;";
	}
	print "\n"
}
system 'pause';
