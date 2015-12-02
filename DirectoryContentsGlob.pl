#!/usr/bin/perl 
use warnings; 

sub searchdir { 
	@file = glob "*"; 
	@files = (grep {/@_/} @file); 
	foreach $files (@files) { 
		if (-d $files) { 
			print "\"$files\" is a directory containing\n"; 
			opendir (DIR, $files); 
			@contents = readdir(DIR); 
			for $contents (@contents) { 
				print $files; 
			print "\n\n"; 
} 
} 
		else { 
			print $files . "\n"; 
} 
} 
} 

searchdir ("number"); 

exit; 
