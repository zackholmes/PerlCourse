package Converter; 
	sub englishMeasures { 
		print "inches\nfeet\nyards\nmiles\n"; 
} 
	sub metricMeasures { 
		print "mm\ncm\nm\nkm\n"; 
} 
	sub convert { 
		($units, $metric, $english) = @_; 
		#normalize input to meters 
		$_ = $metric; 
		if ($metric eq "mm") { 
			$units = $units/1000; 
} 
		elsif ($metric eq "cm") { 
			$units = $units/100; 
} 
		elsif ($metric eq "km") { 
			$units = $unit*1000; 
} 
		elsif ($metric eq "m") { 
} 
		else { 
			print "You've entered an unsuported metric unit! Try mm, cm, m, or km. For example \"convert(55, cm, yards)\"\n"; 
			return; 
} 
		if ($english eq "inches") { 
			$units = $units*39.3701; 
} 
		elsif ($english eq "feet") { 
			$units = $units*3.28084; 
} 
		elsif ($english eq "yards") { 
			$units = $units*1.09361; 
} 
		elsif ($english eq "miles") { 
			$units = $units*0.000621371; 
} 
		else { 
			print "You've entered an unsuported English unit! Try inches, feet, yards, or miles. For example \"convert(55, cm, yards)\"\n"; 
			return; 
} 
print "$units $english\n"; 
} 
1;

