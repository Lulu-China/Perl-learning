#!usr/bin/perl

#exercise 1
#p52练一练
#此页中的fiction所在官网无法打开，所以目录不存在，于是我自己按照内容描述创建了一个
#输出给定目录中所有文件和文件内容
#==================================
use Cwd;

sub printDirAndContent
{
    my ($path) = @_; #获取目录

    opendir(path, $path) or die "can not open path $path, error: $! "; 
    my @files = readdir(path);
    close(path);

    foreach my $f (@files)
    {
        my $file = "$path\\$f";
        if (-f $file && -R $file)
        {
            print "#file: $file\n";
            open (in, $file) or die "can not open file $file, error: $! ";
            my @lines = <in>;
            foreach my $l (@lines)
            {
                print "$l\n";
            }
            close(in);
        }
    }
}

$curdir = cwd();
printDirAndContent($curdir);
