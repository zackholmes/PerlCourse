#This subroutine sorts input numbers into separate arrays of odd and even numbers
#!/usr/bin/perl 
use warnings; 

#subroutine 
sub numsort { 
	my @numbers = @_; 
	for $number (@numbers) { 
		if ($number & 1) { 
			push @odds, $number;} 
		else { 
			push @evens, $number; 
} 
}
my @array = (\@odds, \@evens); 
	$ref_array = \@array; 
	$ref_array; 

} 
exit;
