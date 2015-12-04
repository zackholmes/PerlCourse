#Write a script to list the 10 most used words that are longer than 3 characters #in a text file. Print out the words and the number of occurrences. Make sure it #is listed in order of frequency. 

#!/usr/bin/perl 
use warnings; 

open (FILE, "input.txt") || die "Error: $!"; 

%count = (); 

while ($line = <FILE>) { 
	chomp $line; 
	foreach $str (split /\s+/, $line) { 
		$_ = $str; 
		if (/[,.!?"']?(\w+)[,.!?"']?/){ 
			if (length($1) > 3) { 
				$str = $1; 
			$count{$str}++; 
} 
} 
} 
} 

$i = 0; 
foreach $str (sort { $count{$b} <=> $count{$a} } keys %count) { 
	if ($i <10) { 
		print $str . " " . $count{$str} . "\n"; 
		$i++; 
} 
}	 

close FILE; 
exit;
