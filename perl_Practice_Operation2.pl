#基于词典的分词
#!/bin/perl
print "Begin Loading Dictionary.../n";
open(In, "词典.txt");          #读取辞典
$MaxLen = 0;   #统计词条之最大长度

while ($Line = <In>) {
 chomp $Line;
 $Line =~ s/\s*$//; #去除每行词条结束后之空白符
 $Dict{$Line} = length($Line); #建立hash，以词条内容为索引
 if (length($Line) > $MaxLen) 
 {
    $MaxLen = length($Line);
 }
}
close(In);     #关闭辞典文件
print "End Loading Dictionary .../n";

#正文部分开始
open(FH,"a.txt");
open(DD,">result.txt");
select(DD);#使用该函数返回值，就可以调用相应的I/O函数(read,write)，并且明确知道该函数不会阻塞。
while (<FH>) { 
#$Base = <STDIN>; #从终端接收输入
#if ($Base =~ m/q/i) { #输入q或i则退出程序 # 表示如果在 $Base 中发现 "q或i" 字符，则返回 "1" 否则返回 "0"。
#   exit;
#}
$Result = Forward_Segment($_); #调用正向最大匹配子程序
print "$Result/n"; #输出分词结果
#print "=>"; #等待下一次输入
}

sub Forward_Segment #正向最大匹配子程序定义
{
my ($Input) = @_; #输入传递给$Input
my $Segemted = (); #定义分词结果变量，初始化为空
my $Remained = $Input; #分词过程中之剩余字串，初始化为原字串

$Remained =~ s/\/n$//; #去除输入字串末尾之“/n”符号

while (length($Remained) > 0) { #当剩余字串长度为0时，循环结束
   $Match = 0; #定义匹配标志，为1则为汉字匹配，为0则为辞典外之字符匹配
#   $CurLen = length($Remained); #剩余字串长度
   for ($i = $MaxLen; $i >= 2; $i -= 2) {   #UTF-8之汉字编码为3字节
    $MatchString = substr($Remained, 0, $i); #调用substr()函数,截取字符，开始时，取整个剩余字串为操作字串
    if (defined $Dict{$MatchString}) { #若在辞典中有对应词条
     $Segemted .= $MatchString; #操作字串匹配成功，输入到$Segemted中
     $Segemted .= ' '; #用来分割词语之标志
     $Remained = substr($Remained, $i, length($Remained)-$i); #去除匹配成功之字串
     $Match = 1; #标志为汉字匹配
     last; #跳出for循环
    }
      #若没有对应词条，则进入for循环下一轮，去除一个汉字
   }
  
   if ($Match == 0) { #辞典外之字符匹配
    if (ord($Remained) & 0x80) #ord($str)&0x80来判断汉字  
    { #取剩余字串之ASCII码并判断其所表示字符之长度
      $Len = 2; 
      $Segemted .= substr($Remained, 0, $Len); #将其写入$Segemted中
     $Segemted .= ' '; #分割符
     $Remained = substr($Remained, $Len, length($Remained) - $Len); #去除该字符
    } else {
      $Len = 1;
      $Segemted .= substr($Remained, 0, $Len); #将其写入$Segemted中
     $Segemted .= '  '; #分割符
     $Remained = substr($Remained, $Len, length($Remained) - $Len); #去除该字符
    }
   }
}
 $Segemted=~s/([^0-9.*])/ $1/g;
 $Segemted=~s/([0-9.*])/$1/g;
return $Segemted; #将$Segemted作为结果返回
}
close FH;
close DD;
