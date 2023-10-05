# How to create SCycDB diamond database
git clone https://github.com/qichao1984/MCycDB
cd MCycDB
cat  MCycDB_2021.z* >  MCycDB_2021_cat.zip
unzip MCycDB_2021_cat.zip
grep -c '>' MCycDB_2021.faa

# Sanity check
grep '>' MCycDB_2021.faa | grep -v 'homolog' | grep '\[' | awk -F'>' '{print $2}' | awk '{print $1}' | sort > fasta_headers.txt
awk '{print $1}' < id2gene.map | sort > map_headers.txt
diff fasta_headers.txt map_headers.txt
# There are differences, but the id2gene.map file seems to be right according to the README file
# This is because there are false positives in the fasta file not annotated as homologs
wc -l map_headers.txt
grep '>' MCycDB_2021.faa | grep -v 'homolog' | grep  -v '\[' | head

# Make diamond database
diamond makedb --in MCycDB_2021.faa -d MCycDB_2021 -p 10

# Remove everything except the database
mkdir diamond
mv MCycDB_2021.dmnd diamond/
mv MCycDB_2021.faa diamond/
mv id2gene.map diamond/
rm *
mv diamond/* .
rmdir diamond