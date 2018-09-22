#!/usr/bin/perl -w
$URL = "https://www.handbook.unsw.edu.au/";
   
   	
open URL, "wget -q -O- '$URL'|" or die "cannot does\n";

my $beforeString = "";
my %courses;
$queryBool = 0;
for $string (@line) {
  #amount of uoc codes required for degree
  $UOC =~ /Students must complete ([0-9]*)/g;
  #gets the url
  if($string =~ /<div data-bucket=\"1\" class=\"m-single-course-wrapper\">/) {
  	#start of line, get start of url of course
    $string = <line>;
  	$string =~ /<a href\=(.*)/g;
  	$querystart = $1;

    #get rest of url in the next line
    $string = <line>;
    $string =~ /(.*?)"/g;
    $querystart .= $1;
    
    $queryBool = 1;

  }
  if($queryBool && $string =~ /<span class\=\"align-left\">(.*?)<\/span>/g) {
    $courseName = $1;
  }
  if($queryBool && $string =~ /<p class="text-color-blue-400 no-margin">(.*?)<\/p>/) {
    $courseDesc = $1;
    $queryBool = 0;
    $courses{$courseName} = $querystart;
  }

  $beforeString = $string;
}
print "$_ $courses{$_}\n" for (keys %courses);