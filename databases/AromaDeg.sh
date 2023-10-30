# Iterate through all fasta in the current dir and create HMM

ls *.fasta | while read fasta; do
    hmmfile=$(echo $fasta | sed 's/.fasta/.hmm/g')
    hmmbuild $hmmfile $fasta
done
