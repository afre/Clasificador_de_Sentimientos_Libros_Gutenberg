#!/usr/bin/perl

use Encode;
use utf8;
#use HTML::Entities;#Convert html encoding into utf8 plain text and vice versa
use warnings;
use strict;
binmode STDOUT, ":utf8";


#if (! defined $ARGV[0]){die "Formato de uso: \nperl sentences_extractor.pl file1\nEjemplo de uso:\nperl sentences_extractor.pl onanism.txt\n";}
main($ARGV[0]);#Calling main procedure

sub main{
	
	my ($file_name) = "LeadPencilManufactory.txt";#$_[0];
	
	
	my $fileContent = openFile($file_name);
	
	my @output1;
	
	my $output2;
	
	
	#my $output3;
	
	my $arff="\@relation feelings
	
	\@attribute palabrasPositivas integer
	\@attribute palabrasNegativas integer
	\@attribute signoAdmiracoin {yes, no}
	\@attribute conjuncionAdversativa {but, yet, still, however, albeit, although, though}
	\@attribute kind {positiva, negativa, neutra}
	
	\@data
	
	";
	
	@output1=$fileContent=~/(?<=\n)\n[A-Z_"].*\n(?:[a-zA-Z_"0-9].*\n)*/g;
	@output1=join("",@output1)=~/[A-Z"_](?!\n\n)(?:(?!(?<! ...)(?<! ..)(?<! .)\.).(?!(?<!:)\n\n|  )){4,}(?:\."|(?<! .)(?<!www\.)\.(?![a-z]{3})|!"|\?)/gs;
	$output2=join("\n\n",@output1);
	$output2=~s/(?<!\n)\n/ /g;
	
	
	
	
	
	

	#Storing the output
    writeFile("oraciones.txt",$output2);

  #}#\for
}

sub openFile{
	my ($file_name) = @_;
	my $fileContent = "";
	local $/;#read full file instead of only one line.
	if (open(FILE, "<:utf8",$file_name)){
	  $fileContent = <FILE>;
	  close (FILE);
	}else{
	  print "Can't read file \"$file_name\" [$!]\n";
	}

	return $fileContent;
}

sub writeFile
{
  my($fileName, $content) = @_;#
  #writing content into a file.
  #open FILE, ">$fileName";
  open(FILE, ">:utf8",$fileName) or die "Can't read file \"$fileName\" [$!]\n";
  print FILE $content;
  close (FILE);
}