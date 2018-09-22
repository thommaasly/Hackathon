#!/usr/bin/perl -w
$URL = "https://www.handbook.unsw.edu.au/";


open URL, "wget -q -O- '$URL'|" or die "cannot does\n";
my $line;
#@line = <URL>;
#$facFound = 0;
#@faculties;
my $beforeString = "";
my %facToURL;
while ($line = <URL>) {

	chomp $line;
	if($line eq "              \<h4\>Faculty \<span class\=\"sr-only\"\>Sub Menu\<\/span\>\<\/h4\>"){
		#print "$line\n";
		$line = <URL>;
		$line = <URL>;
		$line = <URL>;
		$line = <URL>;
		$line = <URL>;
		while($line = <URL>){
			if($line =~ /hamburger-menu-item/){
				exit;
			}
			if ($line =~ /href\=\"(.*?)\"/){
				print "$1\n";
			}

		}
		
	}
}

	#if($string =~ /<h4>Faculty/) {
	#	$facFound = 1;
	#}
	#if ($facFound && $string =~ /<h4>(.*)<\/h4>"/) {
	#		$faculty = $1;
	#		push @faculties, $faculty;
	#}
	#if ($string =~ /"Subject Area<\/h4>"/) {
#		$facFound = 0;
#	}
	#chomp $string;
	#if($string eq "              \<h4\>Faculty \<span class\=\"sr-only\"\>Sub Menu\<\/span\>\<\/h4\>"){
		#print "$string";
		#$string = <URL>;
		#print "$string";
	#	while($string =~ /\<h4\>(.*)\<\/h4\>/g){
#			print "$1\n";
#			$faculty = $1;
			#print "$beforeString";
#			if ($beforeString =~ /href\=\"(.*?)(\"|\r)/){
#				print "$1\n";
#				$facToURL{$faculty} = $1;  
#			}
#		}
#		$beforeString = $string;
	#}
#}

#for $a (@faculties) {
#	print($a)
#}
