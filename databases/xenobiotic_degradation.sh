# Download xenobiotic degradation database
wget https://plasticdb.org/static/PlasticDB.fasta
# Make diamond database
diamond makedb --in PlasticDB.fasta -d PlasticDB
