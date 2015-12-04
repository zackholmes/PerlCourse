#This script accepts common formats of dates and converts them to MONTH DAY, YEAR. 
#!/usr/bin/perl


$input = "07/07/84";

#Extract and assign values for month, day, and year
$_ = $input;
if (/([A-Z][a-z]{2}) (\d\d?),? (\d\d\d?\d?)/) {
	$month = $1;
	$day = $2;
	$year = $3;
}
elsif (/(\d\d?)\/(\d\d?)\/(\d{2})$/) {
	$month = $1;
	$day = $2;
	$year = $3;
}
elsif (/(\d{2}) ([A-Z][a-z]{2}) (\d{4})/) {
	$month = $2;
	$day = $1;
	$year = $3;
}
else {
	print "I do not accept dates in that format. Please try a standard format.\n";
}

#Convert month value to full month
if ($month eq "Jan" || $month == 1 || $month == 01) {
	$month = January;
}
elsif ($month eq "Feb" || $month == 2 || $month == 02) {
	$month = February;
}
elsif ($month eq "Mar" || $month == 3 || $month == 03) {
	$month = March;
}
elsif ($month eq "Apr" || $month == 4 || $month == 04) {
	$month = April;
}
elsif ($month eq "May" || $month == 5 || $month == 05) {
	$month = May;
}
elsif ($month eq "Jun" || $month == 6 || $month == 06) {
	$month = June;
}
elsif ($month eq "Jul" || $month == 7 || $month == 07) {
	$month = July;
}
elsif ($month eq "Aug" || $month == 8 || $month == '08') {
	$month = August;
}
elsif ($month eq "Sep" || $month == 9 || $month == '09') {
	$month = September;
}
elsif ($month eq "Oct" || $month == 10) {
	$month = October;
}
elsif ($month eq "Nov" || $month == 11) {
	$month = November;
}
elsif ($month eq "Dec" || $month == 12) {
	$month = December;
}
else {
	print "You have entered an invalid month format\n";
	print $month;
}


#Convert onlys days with preceding 0s
$_ = $day;
if (/0(\d{1})/) {
	$day = $1;
}


#Convert 2 digit years
$_ = $year;
if (/^\d{2}$/) {
	$year = $year + 2000;
}

print $month . " " . $day . ", " . $year . "\n";

exit;
