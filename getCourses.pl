#!/usr/bin/perl -w
$URL = "https://www.handbook.unsw.edu.au/undergraduate/programs/2019/4803?browseByFaculty=FacultyOfArtDesign&";
   
   	
open URL, "wget -q -O- '$URL'|" or die "cannot does\n";

my $beforeString = "";
my %courses;
my $line;
$queryBool = 0;
for $string (<URL>) {
  #amount of uoc codes required for degree
  #$UOC =~ /Students must complete ([0-9]*)/g;
  #gets the url
  if($string =~ /<div data-bucket=\"1\" class=\"m-single-course-wrapper\">/) {
  	#start of line, get start of url of course
       # print "$string FIOEJGIOEJGFOWEF\n";

    ##$string = <URL>;
  	#$string =~ /<a href\=(.*)/g;
  	#$querystart = $1;

    #get rest of url in the next line
    #$string = <URL>;
    #$string =~ /(.*?)"/g;
    #$querystart .= $1;
    
    $queryBool = 1;

  }
  if($queryBool == 1 && $string =~ /<a href\=(.*)/g) {
    $querystart = $1;

  }
  elsif($queryBool && $string =~ /<span class\=\"align-left\">(.*?)<\/span>/g) {
    $courseName = $1;
  }
  elsif($queryBool && $string =~ /<p class="text-color-blue-400 no-margin">(.*?)<\/p>/) {
    $courseDesc = $1;
    $queryBool = 0;
    $courses{$courseName}{'url'} = $querystart;
    $courses{$courseName}{'desc'} = $courseDesc;

    my $protfile = "course_list.txt";
    open (FH, $protfile);
    while (my $file = <FH>) {
      #print "$file";
      if($file =~ /($courseName).*?Prerequisite(.*?)\"/){#/$ARGV[0].*\(Prerequisite\: (.*)\)\"/){
        $line = $2;
        #print "$line";
        #while($line =~ /([A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9])/g){
        # print "$1\n";
        #}
      }
    }
    print "$line";

    $courses{$courseName}{'prereqs'}=$line;



  }

  $beforeString = $string;
}
print "$_ $courses{$_}{'url'} $courses{$_}{'desc'} $courses{$_}{'prereqs'}\n" for (keys %courses);