$file=shift;

@lines=split /\n/, `exiftool $file`;

foreach $line (@lines)
{
  @w=split /:/,$line;
  $w[0] =~ s/^ *//;
  $w[0] =~ s/ *$//;

  $w[1] =~ s/^ *//;
  $w[1] =~ s/ *$//;

  if ($w[0] eq "Exposure Time") {$etimet="$w[1]s";}
  if ($w[0] eq "F Number") {$fstopt="f/$w[1]";}
  if ($w[0] eq "ISO") {$isot="\@ ISO $w[1]"; $iso=$w[1];}
  if ($w[0] eq "Focal Length" && !($w[1] =~ /equivalent/)) {$fl=1*$w[1]; $flt="$fl"."mm";}
  if ($w[0] eq "Approximate Focus Distance") {$fd="Distance to subject: $w[1] m";}
  if ($w[0] eq "Exposure 2012") {$exp=$w[1];}
  if ($w[0] eq "Crop Top") {$top="$w[1]";}
  if ($w[0] eq "Crop Left") {$left="$w[1]";}
  if ($w[0] eq "Crop Bottom") {$bot="$w[1]";}
  if ($w[0] eq "Crop Right") {$right="$w[1]";}
  $cropamt=100*($top-$bot)*($left-$right);
  if ($cropamt < 80 && $cropamt > 0) {$croptext=sprintf "&emsp; Cropped to %d%% of original.",$cropamt;}
}

$expf=2**$exp;
$eiso=$expf*$iso;

if ($expf > 1.3) {$pusht = sprintf ", pushed to ISO %d",$eiso;}
if ($expf < 0.75) {$pusht = sprintf ", pulled to ISO %d",$eiso;}

print "$flt $fstopt $etimet $isot$pusht.$croptext";
#print "$fd\n";
