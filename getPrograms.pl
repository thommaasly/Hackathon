#! /usr/bin/perl -w

my $line;
my $URL;
my $protfile;
use warnings;
use strict;
$URL = "https://www.handbook.unsw.edu.au/FacultyOfArtDesign/browse?id=57a56ceb4f0093004aa6eb4f0310c7af";

open URL, "wget -q -O- '$URL'|" or die "cannot does\n";

#@line = <URL>;
while ($line = <URL>) {
	if ($line =~/Program \<\/h3\>/){
		$line =	<URL>;
		$line =<URL>;
		$line = <URL>;
		while ($line =~ /\<a class\=\"a-browse-tile a-browse-tile-/){
			print "$line";#url to program
			$line = <URL>;
			$line = <URL>;
			$line = <URL>;
			$line = <URL>;
			$line = <URL>;
			$line = <URL>;
			print "$line";#4803
			$line = <URL>;
			$line = <URL>;
			$line = <URL>;
		}

		print "$line";#art theory

	}
}