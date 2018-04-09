#!user/bin/perl
my @age;
my @name;

#生成文件
open(In,"age.txt")|| die "can not open age.txt to write\n";
print In, "19,康忠建";
print In, "18,尹丙宪";
print In, "17,郭桐宇";
print In, "16,姜瑞妍";
close(In);

#打开文件
open (In,"age.txt");
while (<In>)
{
	chomp;
	($n,$a)=/[^,]+/g;
	#构造人名数组
	push (@name,$n);

	#构造年龄数组
	push (@age,$a);
	print "$n $a\n";
}
close(In);
print "==================\n";
for($num=0;$num<@age;$num++)
{
	print ${name}[$num]."\t".${age}[$num]."\n";
}

print "==================\n";
#获取@age、@name的引用，将这些数组引用作为@array的成员，使@array成为一个二维数组
@array = (\@age,\@name);
#获得对@age的引用
$refArray1=$array[0];
#获得对@name的引用
$refArray2=$array[1];
for ($num=0;$num<@age;$num++)
{
	print ${array}[0][$num]."\t".${array}[1][$num]."\n";     #方法一：直接访问二维数组
	print ${$refArray1}[$num]."\t".${$refArray2}[$num]."\n"; #方法二：通过软引用方式访问二维数组，$refArray1表示一维数组地址，$xxx[$i]访问一维数组@xxx
	print $refArray1->[$num]."\t".$refArray2->[$num]."\n";   #方法三：以指针的方式访问数组
}
system 'pause';
