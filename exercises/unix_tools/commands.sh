# Count words in a text
tr -sc 'A-Za-z' '\n' < ../data/nyt_200811.txt | sort | uniq -c | head -n 10

# Extended counting exercises
# Downcase everything
tr -sc 'A-Za-z' '\n' < ../data/nyt_200811.txt | tr 'A-Z' 'a-z' | sort | uniq -c | head -n 10
tr -sc 'A-Za-z' '\n' < ../data/nyt_200811.txt | tr '[:upper:]' '[:lower:]' | sort | uniq -c | head -n 10

# Common different sequences of vowels
tr -sc 'A-Za-z' '\n' < ../data/nyt_200811.txt | tr '[:upper:]' '[:lower:]' | tr -sc 'aeiou' '\n' | sort | uniq -c | head -n 10

# Counting and sorting exercises
tr -sc 'A-Za-z' '\n' < ../data/nyt_200811.txt | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head -n 50

# Find the words in the NYT that end in "zz"
tr -sc 'A-Za-z' '\n' < ../data/nyt_200811.txt | tr '[:upper:]' '[:lower:]' | rev | sort | uniq -c | rev | tail -n 10
tr -sc 'A-Za-z' '\n' < ../data/nyt_200811.txt | tr '[:upper:]' '[:lower:]' | sort | uniq -c | grep 'zz$'

# Bigrams
tr -sc 'A-Za-z' '\n' < ../data/nyt_200811.txt > ../data/nyt.words
tail -n +2 nyt.words > ../data/nyt.nextwords
paste nyt.words nyt.nextwords > ../data/nyt.bigrams
head -n 5 ../data/nyt.bigrams

# Top 10 most common bigrams
tr '[:upper:]' '[:lower:]' < ../data/nyt.bigrams | sort | uniq -c | sort -nr | head -n 10

# Trigrams
tail -n +3 ../data/nyt.words > ../data/nyt.nextnextwords
paste ../data/nyt.words ../data/nyt.nextwords ../data/nyt.nextnextwords > ../data/nyt.trigrams
cat ../data/nyt.trigrams | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -rn | head -n 10

# grep and wc
# TODO