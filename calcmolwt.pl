#!/opt/local/bin/perl

#use MongoDB;
#use MongoDB::OID;
#use Data::Dumper ;

#TODO: Use Data Dumper
#require "periodictable.pl" ;

#print Dumper($VAR1);

#my $client = MongoDB::MongoClient->new;
#my $db = $client->get_database( 'periodic' );
#my $table = $db->get_collection( 'table' );

#my $all_elements = $table->find ;

#Atomic weight table, indexed by symbol
my $TableAtWt = {
          'ne' => '20.1797',
          'sc' => '44.955912',
          'db' => '262',
          'hg' => '200.59',
          'ru' => '101.07',
          'ag' => '107.8682',
          'y' => '88.90585',
          'nb' => '92.90638',
          'fe' => '55.845',
          'cr' => '51.9961',
          'sg' => '266',
          'po' => '210',
          'ta' => '180.94788',
          'rh' => '102.9055',
          'co' => '58.933195',
          'hs' => '277',
          'zr' => '91.224',
          'br' => '79.904',
          'uuq' => '289',
          'al' => '26.9815386',
          'tc' => '98',
          'bk' => '247',
          'b' => '10.811',
          'cs' => '132.9054519',
          'mo' => '95.96',
          'pr' => '140.90765',
          'lr' => '262',
          'ge' => '72.64',
          'w' => '183.84',
          'np' => '237',
          'tm' => '168.93421',
          'mt' => '268',
          'ti' => '47.867',
          'la' => '138.90547',
          'ga' => '69.723',
          'bh' => '264',
          'cu' => '63.546',
          'eu' => '151.964',
          'ni' => '58.6934',
          'uut' => '284',
          'sb' => '121.76',
          'ac' => '227',
          'ca' => '40.078',
          'pb' => '207.2',
          'se' => '78.96',
          'yb' => '173.054',
          'uup' => '288',
          'uub' => '285',
          'ds' => '271',
          'lu' => '174.9668',
          'na' => '22.98976928',
          'pt' => '192.084',
          'ba' => '137.327',
          'zn' => '65.38',
          'es' => '252',
          'no' => '259',
          'kr' => '83.798',
          'rb' => '85.4678',
          'os' => '190.23',
          'ho' => '164.93032',
          'rf' => '261',
          'tb' => '158.92535',
          'u' => '238.02891',
          'fr' => '223',
          'k' => '39.0983',
          'ra' => '226',
          'in' => '114.818',
          'th' => '232.03806',
          'sr' => '87.62',
          'si' => '28.0855',
          'tl' => '204.3833',
          'er' => '167.259',
          'cf' => '251',
          're' => '186.207',
          'nd' => '144.242',
          'v' => '50.9415',
          'uuo' => '294',
          's' => '32.065',
          'c' => '12.0107',
          'pd' => '106.42',
          'ir' => '192.217',
          'be' => '9.012182',
          'pm' => '145',
          'li' => '6.941',
          'sn' => '118.71',
          'md' => '258',
          'fm' => '257',
          'cl' => '35.453',
          'ce' => '140.116',
          'rg' => '272',
          'pa' => '231.03588',
          'au' => '196.966569',
          'dy' => '162.5001',
          'h' => '1.00794',
          'am' => '243',
          'at' => '210',
          'bi' => '208.980401',
          'f' => '18.9994',
          'i' => '126.90447',
          'n' => '14.0067',
          'cd' => '112.411',
          'he' => '4.002602',
          'te' => '127.6',
          'pu' => '244',
          'rn' => '220',
          'cm' => '247',
          'ar' => '39.948',
          'sm' => '150.36',
          'mn' => '54.938045',
          'hf' => '178.49',
          'p' => '30.973762',
          'gd' => '157.25',
          'uuh' => '292',
          'as' => '74.9216',
          'xe' => '131.293',
          'o' => '15.9994',
          'mg' => '24.305'
        };

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
	    

    
