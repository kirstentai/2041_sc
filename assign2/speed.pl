#!/usr/bin/perl -w



#variables
my $command;
my $n_option;
if (@ARGV == 1) {
	$command = $ARGV[0];
	$n_option = 0;
} elsif (@ARGV == 2 && $ARGV[0] eq "-n") {
	$n_option = 1;
	$command = $ARGV[1];
} else {
	die "usage: speed [-i] [-n] [-f <script-file> | <sed-command>] [<files> ...]";
}
my $op;
my $addr;

my $line_num;
my $regex;
my $reg_line_bool = "";

my $patt;
my $rep;
my $global;

my @in;
if ($command =~ /[q|p|d]$/) {
	$op = chop($command);
	$addr = $command;
#	print "op: $op. address: $addr\n";
} elsif ($command =~ /(\/*[\w\d.\s]*\/*)(s\/)([\+\{\^\$\[\(\w\d\.\s\]\)\}]+)(\/)([\w\d\.\s]*)(\/)(g*)/) {
	$addr = "$1";
	$patt = "$3";
	$rep = "$5";
	$global = "$7";
	$op = "s";
#	print "op: $op. addr: $addr. pattern: $patt. rep: $rep. glob: $global\n";
} else {
	die "speed: command line: invalid command\n";
}
get_addr($addr);

if ($n_option == 1 && $op !~ /p/) {
	exit;
}
#read input into array
while ($line = <STDIN>) {
	chomp ($line);
	push @in, $line; 
}


do_command();	
	

sub do_command {
#	my $operator = $_[0];
	if ($op =~ /[q|d|s]/) {
		printer();
	} elsif ($op =~/p/ ) { 
		print_func();
	} else {	
		die "speed: command line: invalid command\n";
	}
}
	
			

#assign to address or line number
sub get_addr {
	my $address = $_[0];
	if ($address eq '') {
		$line_num = 0;
		$regex = "";
#		print "ln:$line_num\n";
	} elsif ($address =~ /^(\/)[\^\$\+\{\}\[\(\w\.\s\d\]\)]+(\/)$/) {
		$address =~ s/\///g;
		$regex = $address;
		$line_num = 0;
		$reg_line_bool = 0;
#		print "regex: $regex\n";
	} elsif ($address =~ /^\d+$/) {
		$line_num = $address;
		$regex = "";
		$reg_line_bool = 1;
#		print "line number: $address\n";
	} else {
		die "speed: command line: invalid command\n";
	}
}
sub sed {
	my $element = $_[0];
	my $pattern = $_[1];
	my $replace = $_[2];
#	my $glob = $_[3];
#	my $n_line = $_[4];
#	my $default;	
#	my $i = 0;
#	if ($n_line == 0 ) {
#		$default = 1;
#	} else {
#		$default = 0;
#	}

#	foreach my $element (@array) {
	if ($global eq "g") {
		$element =~ s/$pattern/$replace/g;
	} else {
		$element =~ s/$pattern/$replace/;
	}
	return $element;
#	$i++;
#	}

}

#print "testing printer\n";
#printer (@in, 2);
 
sub printer {
	my $default = "";
	my $quit = 0; #bool value if quit is used
	my $del = 0; #bool value if delete is used
	my $sedit = 0; #bool value if sed is used
	my $i = 0;
	
	#if no line number and no bool value = empty address
	if ($line_num == 0 && $reg_line_bool eq "") {
		$default = 1;
	} else {
		# if either line number or valid regex
		$default = 0;
	}
	
	# switch if "q" is used
	if ($op eq "q") {
		$quit = 1;
	} elsif ($op eq "d") {
		$del = 1;
	} elsif ($op eq "s") {
		$sedit = 1;
	}
	# no specified line number or regex	
	if ($default == 1) {
		foreach my $element (@in) {
			if ($sedit == 1) {
				$element = sed($element, $patt, $rep);
				print "$element\n";
			}	
			if ($quit == 1) {
				print "$element\n";
				exit;
			} elsif ($del == 1 || $del == 1 && $line_num == 1) {
				next;	
			} else {
				print_twice($element) unless($sedit == 1);
			}
		}

	}
	if ($default == 0) {
		foreach my $element (@in) {
			if ($sedit == 1 && $i == $line_num - 1 ) {
			#	next;
			} else {
				print "$element\n" unless($del == 1 && $i == $line_num - 1 || $del == 1 && $element =~ /$regex/);
			}
			#if line number is given
			if ($reg_line_bool == 1 && $i == $line_num - 1 ) {
				exit if ($quit == 1);
				if ($sedit == 1) {
					$element = sed($element, $patt, $rep);
			#		print $element;
					$i++;
				}
				print "$element\n" and next if ($del == 0);
			#	}
			} elsif ($reg_line_bool == 0 && $element =~ /$regex/) {
				exit if ($quit == 1);
				if ($sedit == 1) {
					$element = sed($element, $patt, $rep);
					print $element;
					$i++;
				}
				print "$element\n" and next if ($del == 0);
				
			}
			$i++;
			
		}
	}	
	
}

sub print_func {
#	my @array = $_[0];
	my $default;
	my $i = 0;
	if ($line_num == 0 && $reg_line_bool eq "") {
                $default = 1;
        } else {
                # if either line number or valid regex
                $default = 0;
        }
	if ($default == 1) {
                foreach my $element (@in) {
			print_twice($element);
                }
        }

	if ($default == 0) {
		foreach my $element (@in) {
			print "$element\n" if ($n_option == 0);
                        
                        #if line number is given
                        if ($reg_line_bool == 1 && $i == $line_num - 1 ) {
                                print "$element\n";
                      
                        } elsif ($reg_line_bool == 0 && $element =~ /$regex/) {
                                print "$element\n";
                        }
                        $i++;

                }
	}
}
	
sub print_twice {
	my $line = $_[0];
	print "$line\n";
	print "$line\n";
}

