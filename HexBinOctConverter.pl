#This Perl CGI script converts numbers decimal numbers into Hex, Octal, or Binary
#!/usr/bin/perl 
use warnings; 

use CGI; 

$cgi = CGI->new(); 

$number = $cgi->param('number'); 
$type = $cgi->param('type'); 


print $cgi->header(); 
print $cgi->start_html(); 
print $cgi->br(); 

if ($type eq "hexadecimal"){ 
	$num = sprintf ("0x%X",$number); 
	print "$num \n"; 
} 
elsif ($type eq "octal"){ 
	$num = sprintf ("%o", $number); 
	print "$num \n"; 
} 
elsif ($type eq "binary"){ 
	$num = sprintf ("%b", $number); 
	print "$num \n"; 
} 
elsif ($type eq ""){ 
	print "Please enter a type. Example: \"type=octal\""; 
} 
else { 
	print "Not a valid type. Try binary, octal, or hexadecimal"; 
} 

print $cgi->end_html(); 

exit; 
