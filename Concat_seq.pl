#!/usr/bin/perl

use Bio::SeqIO;

foreach(@ARGV){
	
	chomp($_);
	
	$in = Bio::SeqIO->new(-file=>"$_", -format=>"fasta");
	
	while($seq = $in->next_seq()){
	
			$id = $seq->id();
			$seq_seq = $seq->seq;
			
			$hash_aln{$id} .= $seq_seq;
			
		
	}
	
	
}

@keys = keys(%hash_aln);
@keys = sort{$a cmp $b} @keys;

foreach(@keys){
	
	chomp($_);
	
	print "\>$_\n$hash_aln{$_}\n\n";	
	
	
}





