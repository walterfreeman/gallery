@files=@ARGV;
$num=@ARGV;


for ($i=0;$i<$num;$i++)
{
print "$i / $num\n";
for ($j=-3; $j<=3;$j++)
{
  $n=$j+$i;
  if ($n<0) {$n+=$num;}
  if ($n>=$num) {$n-=$num;}
  $th[$j+3]=$files[$n];
  $link[$j+3]="image$n.html";
}

$exif=`perl get_exif.pl $files[$i]`;

$page= <<"EOF"; 
<html>

<body style="background-color:black;">
  

<div style="width: 79%; height: 3%; margin: 0 auto; position: fixed; left: 12%; top: 80%; background-color: black;"> 
<p style="text-align: center; color: #888888;"> 
<i>$exif</i>
</p>
</div>

<!-- main image -->
<div style="width: 79%; height: 78%; margin: 0 auto; position: fixed; left: 12%; top: 1%; background-color: black;">
<img src="$files[$i]" style="display: block; margin: 0 auto; max-width: 100%; max-height: 100%;">
</div>

<!-- thumbnails -->



<div style="width: 10%; height: 12%; margin: 0 auto; position: fixed; bottom: 2%; left: 12%; background-color: black;"> 
<a href="$link[0]">
<img src="$th[0]" style="display: block; margin: 0 auto; max-width: 100%; max-height: 100%;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"> </div>
</a>
<div style="width: 10%; height: 12%; margin: 0 auto; position: fixed; bottom: 2%; left: 23%; background-color: black;">
<a href="$link[1]">
<img src="$th[1]" style="display: block; margin: 0 auto; max-width: 100%; max-height: 100%;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"> </div>
</a>
<div style="width: 10%; height: 12%; margin: 0 auto; position: fixed; bottom: 2%; left: 34%; background-color: black;">
<a href="$link[2]">
<img src="$th[2]" style="display: block; margin: 0 auto; max-width: 100%; max-height: 100%;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"> </div>
</a>
<div style="width: 13%; height: 14%; margin: 0 auto; position: fixed; bottom: 1%; left: 45%; background-color: black;">
<a href="$link[3]">
<img src="$th[3]" style="display: block; margin: 0 auto; max-width: 100%; max-height: 100%;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"> </div>
</a>
<div style="width: 10%; height: 12%; margin: 0 auto; position: fixed; bottom: 2%; left: 59%; background-color: black;">
<a href="$link[4]">
<img src="$th[4]" style="display: block; margin: 0 auto; max-width: 100%; max-height: 100%;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"> </div>
</a>
<div style="width: 10%; height: 12%; margin: 0 auto; position: fixed; bottom: 2%; left: 70%; background-color: black;"> 
<a href="$link[5]">
<img src="$th[5]" style="display: block; margin: 0 auto; max-width: 100%; max-height: 100%;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"> </div>
</a>
<div style="width: 10%; height: 12%; margin: 0 auto; position: fixed; bottom: 2%; left: 81%; background-color: black;"> 
<a href="$link[6]">
<img src="$th[6]" style="display: block; margin: 0 auto; max-width: 100%; max-height: 100%;position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"> </div>
</a>
</body>
</html>
EOF

open Page,">image$i.html";
print Page "$page";
close Page;

}
