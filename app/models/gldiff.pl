# gldiff.pl
#http://stackoverflow.com/questions/3338126/git-how-to-diff-the-same-file-between-two-different-commits-on-the-same-branch
# Use:
	

#Here is a perl script that prints out git diff commands for a given file as found in a git log command.

#e.g.
# git log pom.xml | perl gldiff.pl 3 pom.xml

use strict;

my $max  = shift;
my $file = shift;

die "not a number" unless $max =~ m/\d+/;
die "not a file"   unless -f $file;
$file = 'app/models/' . $file ; 

my $count;
my @lines;

while (<>) {
    chomp;
    next unless s/^commit\s+(.*)//;
    my $commit = $1;
    push @lines, sprintf "%s:%s", substr($commit,0,6),$file;
    if (@lines == 2) {
        printf "git diff %s %s\n", @lines;
        @lines = ();
    }
    last if ++$count >= $max *2;
}