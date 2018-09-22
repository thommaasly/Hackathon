#!/usr/bin/perl -w
$URL = "https://www.handbook.unsw.edu.au/";
   
   	
open URL, "wget -q -O- '$URL'|" or die "cannot does\n";

my $beforeString = "";
my %facToURL;
$queryBool = 0;
for $string (@line) {
  #amount of uoc codes required for degree
  $UOC =~ /Students must complete ([0-9]*)/g;
  #end of the url part
  if($string =~ /<div data-bucket=\"1\" class=\"m-single-course-wrapper\">/) {
  	$queryBool = 1;
  }
  if($queryBool && $beforeString =~ ) {
  	$string =~ /<a href\=(.*)/g;
  	$querystart = $1;

  } else if ($queryBool && $beforeString =~ )


  while($string =~ /\<h4\>(.*)\<\/h4\>/g){
    print "$1\n";
    $faculty = $1;
    if ($beforeString =~ /href\=\"(.*?)\"/){
      print "$1\n"
      $facToURL{$faculty} = $1;  
    }
  }
    $beforeString = $string;
}