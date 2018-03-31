#求两个词表的交集和并集
#!user/bin/perl
open(In,"ci_biao1.txt");
while($word = <In>)
{
	chomp($line);
	$Hash($word) = 1; #将$Hash($word)设置为1，即是将key为word，value为1的键值对插入Hash里，此处只是为了向Hash里插入1个值。所以value可以任意。
}
close(In);

print "两个词表的交集为：\n";
open(In2,"ci_biao2.txt");
while($word = <In2>)
{
	chomp($word);
	if(defined $Hash{$word})
	{
		print "$word\n"; #输出key相同的词，即为交集。
	}
	else
	{
		$Hash($word) = 1; #将不存在于ci_biao1里的词也放入Hash中，用于构造并集，这并不影响之后对交集的判断。
	}
}
close(In2);

print "两个词表的并集为：\n";
foreach $word(sort keys %Hash)
{
	print "$word\n";
}
