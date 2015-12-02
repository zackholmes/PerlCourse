#This Perl CGI script prints an HTML page with contents of current dir and hyperlinks to nested dirs.
#!/usr/bin/perl 
use warnings; 

use CGI; 

$cgi = CGI->new(); 

$directory = $cgi->param('directory'); 

chdir $directory; 

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

print $cgi->header(); 
print $cgi->start_html(); 
print $cgi->br(); 

for $sort_dir (@sort_dir) { 
	print "<a href=\"ex5_5.cgi?directory\=$directory.$sort_dir\">$sort_dir</a>"; 
	print $cgi->br(); 
} 

for $sort_file (@sort_file) { 
	print "$sort_file"; 
	print $cgi->br(); 
} 


print $cgi->end_html(); 

exit;
