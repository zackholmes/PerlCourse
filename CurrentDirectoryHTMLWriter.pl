#non-CGI method for writing HTML page with contents of current directory 
#!/usr/bin/perl
use warnings;

#declare items
@directories = ();
@files = ();
$i = 0;
$j = 0;

#get contents of cwd
foreach $file (glob "*") {
   if (-d $file) {
	$directories[$i] = $file;
	$i++;
}
   else {
	$files[$j] = $file;
	$j++;
}
}

#sort lists alphabetically, (lc is independent of case)
@sort_dir = sort {lc($a) cmp lc($b)} @directories;
@sort_file = sort {lc($a) cmp lc($b)} @files; 

#print html file
open (HTML, ">>html.html") || die "Error; $!";
print HTML "<HTML>
<HEAD></HEAD>
<BODY>";

for $sort_dir (@sort_dir) {
	print HTML "<b>$sort_dir</b><br>\n";
}

for $sort_file (@sort_file) {
	print HTML "$sort_file<br>\n";
}

print HTML "</BODY>
</HTML>";

close HTML;

exit;
