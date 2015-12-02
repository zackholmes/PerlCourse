#!/usr/bin/perl
use warnings; 

use DBI; 

#connect to the database
$driver = "DBI:mysql:test";
$user = "zack";
$dbh = DBI->connect($driver, $user) || die DBI->errstr();
$table = "formletter_db";

#store input values
$template = $ARGV[0];
$query_email = $ARGV[1];

#open form letter template, extract text, close file
open (TEMPLATE, "$template") || die "Error $!";
$/ = undef;
$letter = <TEMPLATE>;
close (TEMPLATE);

#check existence of filter. If exists, verify existence of email address. If exists, execute and query values
if (!$query_email){
	$stmt = "select last_name, first_name, middle_initial, email, number_items, price_items, salutation from $table";
}
else {
	$stmt = "select exists(select 1 from $table where email='$query_email')";
	$sth = $dbh->prepare($stmt);
	$sth->execute() || die "Error: " . DBI->errstr();
		if ($sth->fetchrow_array){
			$stmt = "select last_name, first_name, middle_initial, email, number_items, price_items, salutation from $table where email='$query_email'";
			$sth = $dbh->prepare($stmt);
			$sth->execute() || die "Error: " . DBI->errstr();
}
		else {
			print "That email address does not exist in the database";
			exit;
}
}


#replace <keywords> with $values from database
while (my $rec = $sth->fetchrow_hashref()) {
	open (COMPLETE, ">>formletter_$rec->{email}.txt") || die "Error $!";
	$total = $rec->{price_items} * $rec->{number_items};
	$output = $letter =~ s/<first_name>/$rec->{first_name}/rg;
	$output =~ s/<last_name>/$rec->{last_name}/g;
	$output =~ s/<middle_initial>/$rec->{middle_initial}/g;
	$output =~ s/<email>/$rec->{email}/g;
	$output =~ s/<number_items>/$rec->{number_items}/g;
	$output =~ s/<price_items>/\$$rec->{price_items}/g;
	$output =~ s/<salutation>/$rec->{salutation}/g;
	$output =~ s/<total>/\$$total/g;
	print COMPLETE $output;
}

close (COMPLETE);

exit; 


