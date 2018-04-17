#!bin/perl
#【1】获取数组中的成员及对数组中的数字进行排序
@array = (1,8,2,4,5);
($first,$second) = @array;
print("the first number：$first\n");
print("the second mumber：$second\n");
($first,$second,@subarray) = @array;
print"$first $second\n";
print"======================\n";
foreach $ele(@subarray)
{
	print "$ele\n";
}
print "===============\n";
@newarray = sort @array;
foreach $ele(sort {$b<=>$a} @newarray)
{
	print $ele." ";
}
print"\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n";
#【2】增加数组成员，或者数组中间加入分隔符，并遍历输出新数组。
@array = ("I","am","a","teacher");
foreach (@array)
{
	print $_." ";
}
print"\n====================\n";
$lastword = pop(@array);
print "$lastword\n";
print"\n====================\n";
unshift(@array,"However,");
push (@array,$lastword);
foreach(@array)
{
	print $_." ";
}
print"\n====================\n";
@array = join("->",@array);
foreach(@array)
{
	print"$_";
}
print"\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n";
#【3】对英文句子进行分词，将分出的词放入数组中，并将其顺序输出；将分词所得数组中重复的符号去重，并输出。
$string = "Actually , I don't want to help him , however I am a teacher so I have to do something for him .";
@strarray = split(" ",$string);
foreach $ele (sort @strarray) #字符串不能用$a<=>$b排序，只适用于数值
{
	print$ele." ";
}
print "\n===================\n";
#去掉数组中重复的词和标点符号
%hash;
@strarray = grep{++$hash{$_}<2}@strarray; #grep 保存符合条件的元素.
@strarray = join(" ",@strarray);
foreach $symbol(@strarray)
{
	print "$symbol";
}
system'pause';
