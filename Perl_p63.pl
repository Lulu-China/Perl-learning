#统计文件词频
#实现思想：读取文件每一行，然后建立一个关键字是词，词出现次数是值
#的哈希变量。同时记录总的次数，最后遍历输出关键字和值，得到每个词出现的频率和频次。
#打开进行词频统计的文件。
#!user/bin/perl
open(In,"ci-biao.txt"); #打开ci-biao.txt文件，In是指向磁盘上文件的文件句柄。
$i=0;
while($line=<In>) #循环遍历<In>里的每一行。
{
	chomp($line); #去掉每一行换行符
	if(defined $Hash{line}) #用line作为Hash的key，去访问Hash表，defined用于判断是否被定义（存在）。
	{
		$Hash{$line}++; #如果找到就对Hash表的Value加1.
	}
	else
	{
		$Hash {$line}=1; #如果未找到就将新的key（$line）插入到Hash表。
	}
	$i++; #i用于统计行数。
}
close(In); #关闭文件句柄。

#遍历，有序输出
foreach $element(sort keys %Hash) #keys 表示取Hash里所有的Key，sort用于对key进行排序。
{
	$tf=$Hash{$element}/$i; #用$element作为key去访问Hash，取到每个词在词表中出现的次数。次数除以总行数，就是频率。
	print"$element $tf $Hash{$element}\n";
}
