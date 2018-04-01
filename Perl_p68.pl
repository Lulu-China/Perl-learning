#!user/bin/perl
#汉语分词
$MaxLen = 0;
%MapDict = ();

ReadDict("word.txt");
print"please input a sentence:(press\"exit\"or \"q\"to quit!)\n=>";
while(1)
{
	$sent = <STDIN>#获取用户输入
	chomp($sent);
	if($sent eq 'exit' or $sent eq 'q')
	{
		exit;
	}
	$result = Segment($sent);
	print "$result\n=>"
}
sub ReadDict
{
	my($Dict) = @_;
	open(In,"$Dict");
	$MaxLen = 0;
	while($Line = <In>)#遍历文件
	{
		chomp($Line);
		$MapDict{$Line} = length($line); #%var_hash = {}; 定义了一个空的散列。$MapDict没有被定义，那么第一次使用时被定义，用{}当作散列来使用，MapDict就是一个散列。
		if(length($Line)>$MaxLenen)
		{
			$MaxLen = $length($Line);
		}
	}
	close(In);
}
sub Segment()
{
	my($aSentence) = @_;#获取函数参数
	my $Segment = "";
	my $Remained = $aSentence;
	while(length($Remained) > 0)
	{
		$Match = 0;
		for($i = $MaxLen; $i > 1; $i--)
		{
			$MatchString = substr($Remained, 0, $i);
			if(defined $MapDict($MatchString))
			{
				$Match=1;
				last;
			}
		}
		if ($Match == 0)
		{
			if (ord($Remanined) & 0x80)#ox80十六进制=100000二进制。通过判断第8位是否为1来判定是否为全角，区分半角和全角，全角占2个字节，半角1个字节。
			{
				$i=2;#全角取两个字节
			}
			else
			{
				$i=1;#半角取1个字节
			}	
		}
		#warning：如果match不等于0，那么$MatchString已经存在，没有必要重新构造。
		$MatchString = substr($Remained,0,$i);#通过被分出词的长度$i来从remained里提取分出的词。
		$Segment.=$MatchString."\/";#a.=b就相当于a等于a跟b的连接。$MatchString.先跟/连接，然后再与左边连接。/输出结果
		$Remanined =substr($Remanined,$i,length($Remained)-$i); #去掉remained开头被匹配的字符串，比如“爱”被匹配到，将remained改变为“是恒久忍耐，又有恩赐。”
	}
	return $Segment;
}
