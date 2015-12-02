#!/usr/bin/perl 
use warnings; 

open(LISTFILE, "listfile.txt") || die "Error: $!"; 
while(<LISTFILE>) { 
chomp; 
if (/(\w+@\w+.\w+)/) { 
	open (EMAILS, ">>emails.txt") || die "Error: $!"; 
	print EMAILS $1 . "\n"; 
} 
elsif (/(\d+)/) { 
	open (NUMBERS, ">>numbers.txt") || die "Error: $!"; 
	print NUMBERS $1 . "\n"; 
} 
elsif (/([a-z]+)/i) { 
	open (NAMES, ">>names.txt") || die "Error: $!"; 
	print NAMES $1 . "\n"; 
} 
else { 
	print "Wrong format for one of your list items!\n"; 
} 
} 

close LISTFILE; 

exit;
