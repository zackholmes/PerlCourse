#This is a simple DBI script to insert data into a pre-existing database.
#!/usr/bin/perl 
use warnings; 

use DBI; 

$driver = "DBI:mysql:test"; 
$user = "user"; 
$dbh = DBI->connect($driver, $user) || die DBI->errstr(); 

open (ENTRIES, "addressbookdata.txt") || die "Error $!"; 

while (<ENTRIES>) { 
	chomp; 
	my @temp_store = split /:/, $_; 
	$stmt = "insert into AddressBook (id, name, type, phone1, phone2,	phone2type, pizza, sushi, taco) values ($temp_store[0], '$temp_store[1]', $temp_store[2], $temp_store[3], $temp_store[4],$temp_store[5],$temp_store[6], $temp_store[7], $temp_store[8])"; 
	$dbh->do($stmt); 
} 

close ENTRIES; 

$dbh->disconnect(); 

exit;
