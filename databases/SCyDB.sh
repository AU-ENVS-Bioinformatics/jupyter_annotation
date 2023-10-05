# How to create SCycDB diamond database
git clone https://github.com/qichao1984/SCycDB
cd SCycDB
cat  SCycDB_2020Mar.z* >  SCycDB_2020Mar_cat.zip
unzip SCycDB_2020Mar_cat.zip
grep -c '>' SCycDB_2020Mar.faa

# Sanity check
grep '>' SCycDB_2020Mar.faa | grep -v 'homolog' | awk -F'>' '{print $2}' | awk '{print $1}' | sort > fasta_headers.txt
awk '{print $1}' < id2gene.2020Mar.map | sort > map_headers.txt
diff fasta_headers.txt map_headers.txt

# Make diamond database
diamond makedb --in SCycDB_2020Mar.faa -d SCycDB_2020Mar -p 10

# Remove everything except the database
mkdir diamond
mv SCycDB_2020Mar.dmnd diamond/
mv SCycDB_2020Mar.faa diamond/
mv id2gene.2020Mar.map diamond/
rm *
mv diamond/* .
rmdir diamond