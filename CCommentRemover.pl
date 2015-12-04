#Write a script to list the 10 most used words that are longer than 3 characters in a text file. Print out the words and the number of occurrences. Make sure it is listed in order of frequency. 

#!/usr/bin/perl 
use warnings; 

open (CCODE, "ccode.txt") || die "Error: $!"; 
$/ = undef; 
$slurped = <CCODE>; 
close CCODE; 
$slurped =~ s/\/\*.*\*\///s; 

open (CCODE, ">ccode.txt") || die "Error: $!"; 
print CCODE $slurped; 

close CCODE; 

exit;
