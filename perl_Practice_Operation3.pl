#!/usr/bin/perl
use Data::Dump;
use Hash::Case::Preserve;
use Regexp::Grammars;
tie my %last_name,'Hash::Case::Preserve';
my %last_name = qw(fred flinstone barney rubble wilma flinstone Fred jhon Alfred hana);
@names = keys%last_name;
foreach $Name (@names){
print "$Name:$last_name{$Name}\n";
}
print "enter a first name:";
chomp(my $name = <STDIN> );
print"$name\n";
#【1】
#只查找特定的fred
=pod
if(exists$last_name{fred}){
	print"That's $name $last_name{$name}.\n";
}
else{
	print"not found!\n";
}
=cut
#【2】
=pod
key值不区分大小写，包含元素匹配:
第2-4行加载了三个模块，用于使以hash的key查找时不区分大小写，显示对应的值。
模块加载方式1、运行cmd 2、命令行输入perl　-MCPAN　-e　shell　回车 
3、cpan>install 模块名   安装模块   4、cpan>q退出
使用模块，要注意用tie %hash,'模块'
=cut
if($name=~/.*(fred).*/gi){
	print"That's $name $last_name{$name}";
}
else{
	print"not found!\n";
}
system 'pause';

