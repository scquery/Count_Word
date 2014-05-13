#!/usr/bin/perl
use strict;
my $file=shift;
open FH,"$file" or die $!;
my @myfile=<FH>;
close FH;
my %summary;
foreach my $line (@myfile){
my @array=split(/\s+/,$line);;
foreach my $word (@array){
if($word=~m/\b(\w+)\b/)
{
  if(!exists$summary{$word})
    {
     $summary{$word}=1;
    }
   else
    {
     $summary{$word}+=1;
     }

}
}            
             }
output(\%summary);
sub output{
my $hashref=shift;
foreach my $temp ( sort {$hashref->{$b}<=>$hashref->{$a}} keys %$hashref)
{
print "$temp : $hashref->{$temp};\n";
}
my $totalword;
foreach my $temp1 (keys %$hashref)
{
$totalword+=$hashref->{$temp1};
}
print "In the text,there are $totalword number word;\n";
}

