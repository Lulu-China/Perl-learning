#!user/bin/perl

open (In, ">HSK5.txt") || die "can not open pos.txt to write\n";#写模式打开文件
print In "1.阿姨(āyí)\n";
print In "2.爱(ài)\n";
close (In);

open (In, ">HSK6.txt") || die "can not open pos.txt to write\n";#写模式打开文件
print In "1.阿姨(āyí)\n";
print In "2.爱不释手(àibùshìshǒu)\n";
close (In);

#读取词表信息
sub ReadDict 
{
	my ($file) = @_;
	open(In, $file);
	while($Sent = <In>)
	{
		chomp $Sent;
		#print "$Sent\n";

		@word = $Sent =~ /\d+\.(\W+)\(\S+/g;  
		print "Words: @word\t";

		@pinyin = $Sent =~ /\d+\.\W+(\(\S+)/g; 
		print "Pinyin:@pinyin\n";
		#构造合适的数据结构，进行数据合并和存储
     
	   if (!defined $hash{$word[0]})
        {
            $hash{$word[0]} = $pinyin[0];
        }
		
}		
close (In);
}
#输出合并后的词表

%hash=();
ReadDict("HSK5.txt");
ReadDict("HSK6.txt");
print "\nResult:\n";
foreach my $word (sort keys %hash)
{
    print "$word -> $hash{$word}\n";
}

system 'pause';
