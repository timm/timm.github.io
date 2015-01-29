set -x

rm -rf all.html clean.txt abstracts.txt words.txt frequencies.txt go-file.txt commonwords.txt

echo $*

for f in `find . -name "$*"`
do  
    echo $f
    pdftohtml -stdout $f >> all.html
done
lynx -dump all.html >> all.txt
perl -lpe s/[^[:print:]]+//g all.txt >> clean.txt
sed -n '/ABSTRACT/,/INTRODUCTION/p' < clean.txt | \
grep -v -w INTRODUCTION > abstracts.txt
curl -o stopwords.txt http://skipperkongen.dk/files/english-stopwords-short.txt
grep -v -w ABSTRACT < abstracts.txt | \
sed 's/[^a-zA-Z]/ /g' | \
tr '[:upper:]' '[:lower:]' | \
tr ' ' '
' | \
sed '/^$/d' | \
sed '/^[a-z]$/d' | \
grep -v -w -f stopwords.txt | \
sort > words.txt

uniq -c < words.txt | sort -r -n > frequencies.txt

head -n500 < frequencies.txt | cut -f3 -d' ' > go-file.txt

cat words.txt | grep -w -f go-file.txt > commonwords.txt
