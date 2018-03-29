#!usr/bin/perl

#exercise 1
#p22练一练
#随机输入a,b值，如果a大于b，则输出“看电影”；反之，则输出“学习”
#==================================
print"输入第一个数吧:";
chomp($a=<STDIN>);
print"现在输入第二个数吧:";
chomp($b=<STDIN>);
if($a>$b){
	print"看电影\n";
}
else{
	print"学习\n";
}
system 'pause';

=pod 
在写这个程序的时候我遇到了一个cmd无法识别的问题，当我在代码中使用中文时，cmd运行显示乱码，
我尝试在Notepad++中使用“编码——转为UTF8格式”但是没有成功，后来我发现cmd那个黑窗口显示内容是以ANSI格式呈现的
所以我的文件也得是ANSI格式的，两个一致了才能显示正确，调整后，程序就能正常运行了。
=cut 
