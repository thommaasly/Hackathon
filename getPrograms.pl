#! /usr/bin/perl -w

my $line;
my $URL;
my $protfile;
my $url;
use warnings;
use strict;
$URL = "https://www.handbook.unsw.edu.au/FacultyOfArtDesign/browse?id=57a56ceb4f0093004aa6eb4f0310c7af";

open URL, "wget -q -O- '$URL'|" or die "cannot does\n";

#@line = <URL>;
while ($line = <URL>) {
	#if ($line =~/Program \<\/h3\>/){
	#	$line =	<URL>;
	#	$line =<URL>;
	#	$line = <URL>;
		if ($line =~ /\<a class\=\"a-browse-tile a-browse-tile-.*(programs)/){
			#print "$line";#url to program
			$line =~ /href\=\"(.*)/;
			$url=$1;
			#print "$1\n";
			$line = <URL>;
			$url.=$line;
			print "$url";
			$line = <URL>;
			$line = <URL>;
			$line = <URL>;
			$line = <URL>;
			$line = <URL>;
			#print "$line";#4803
			$line =~ /([0-9][0-9][0-9][0-9])/;
			print "$1\n";
			$line = <URL>;
			$line = <URL>;
			$line = <URL>;
		}

		#print "$line";#art theory

	#}
}