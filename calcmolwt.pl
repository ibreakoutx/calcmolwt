#!/opt/local/bin/perl

#use MongoDB;
#use MongoDB::OID;
#use Data::Dumper ;

#TODO: Use Data Dumper
require "periodictable.pl" ;

#print Dumper($VAR1);

#my $client = MongoDB::MongoClient->new;
#my $db = $client->get_database( 'periodic' );
#my $table = $db->get_collection( 'table' );

#my $all_elements = $table->find ;

#Atomic weight table, indexed by symbol
my $TableAtWt = $VAR1 ;

#while (my $element = $all_elements->next) {
#    $TableAtWt->{lc($element->{'symbol'})} = $element->{'wt'} ;
#    print $element->{'symbol'}."-->".$element->{'wt'}."\n";
#}

#open(FH,">periodictable.pl") or die "Cannot open periodictable.pl";
#print FH Dumper(\%TableAtWt) ;
#print FH "jklsljfs";
#close(FH);

my $input ;
my $i;
my @formula;
my $molwt ;
my $done  = 0;

while(1) {
    
    #Get Symbol
    for ($i=0;$i<2;$i++) {
	print "Element = ";
	$input = <STDIN> ;
	chomp($input);
	if ( $input eq "" ) {
	    if ($i == 1 ) {
		$done = 1;
		$i = 2;
	    } else {
		print "Hit return again to display mol wt\n";
	    }
	} else {
	    $i = 2;
	    if ( exists $TableAtWt->{lc($input)} ) {
		push(@formula, $input) ;
		my $atwt = $TableAtWt->{lc($input)} ;
		print "Num (default 1) = ";
		$input = <STDIN> ;
		chomp($input);
		if ( $input eq "" ) {
		    $num = 1;
		}
		else {
		    $num = $input ;
		    push @formula, $num;
		}
		push(@formula," ") ;
		$molwt += $atwt*$num ;
	    }
	    #Non existent element
	    else {
		print "No element exists with symbol: ".$input."\n";
	    }
	}
    }#for

    if ($done == 1) {
	print "-----------------------------------------\n";
	print "Mol wt of [ ".join("",@formula)." ] = ".$molwt."\n" ;
	print "-----------------------------------------\n";
	#Prepare for the next calc
	$done = 0;
	$molwt = 0;
	@formula=();
    }
}#while
	    

    
