# Download
wget https://card.mcmaster.ca/download/0/broadstreet-v3.2.8.tar.bz2
# Unpack
tar -xvf broadstreet-v3.2.8.tar.bz2
# Make diamond database of nucleotide_fasta_protein_homolog_model.fasta
diamond makedb --in protein_fasta_protein_homolog_model.fasta.fasta -d CARD -p 10