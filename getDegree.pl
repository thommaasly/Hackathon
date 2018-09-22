#!/usr/bin/perl -w
$URL = "https://www.handbook.unsw.edu.au/";
   
   	
open URL, "wget -q -O- '$URL'|" or die "cannot does\n";

@line = <URL>;
$facFound = 0;
#@faculties;
my $beforeString = "";
my %facToURL;
for $string (@line) {
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
  while($string =~ /\<h4\>(.*)\<\/h4\>/g){
    print "$1\n";
    $faculty = $1;
    #print "$beforeString";
    if ($beforeString =~ /href\=\"(.*?)\"/){
      print "$1\n";
      $facToURL{$faculty} = $1;  
    }
  }
    $beforeString = $string;
}

#for $a (@faculties) {
#	print($a)
#}
