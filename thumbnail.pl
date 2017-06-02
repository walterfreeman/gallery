use File::stat;

$sizex=shift;
$sizey=shift;
@files=@ARGV;

# construct new name


foreach $file (@files)
{
$newname=$file;
$newname=~s/.jpg$//;
$newname=~s/.JPG$//;
$newname=~s/$/-thumb$sizey.jpg/;

print "\nconsidering file $file:\n";

unless (-e $file)
{
  print "File $file does not exist\n";
  next;
}

if ($file =~ /thumb/)
{
  print "This is a thumbnail\n";
  next;
}


if (-C $newname > -C $file)
{
  print "thumbnail is older\n";
}
else
{
  print "thumbnail is newer\n";
}

if (!(-e $newname) || -C $newname > -C $file)
  {
    print "Thumbnail needs updating\n";
    $command="convert $file  -gamma .45455  -resize $sizex"."x$sizey -gamma 2.2 -quality 92 $newname";
    print "running command $command\n";
    system($command); 
  }
}
