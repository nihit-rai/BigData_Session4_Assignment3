lines = LOAD 'wordCountData.txt' AS (row:chararray);
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(row)) as word;
word_group = GROUP words BY word;
word_count = FOREACH word_group GENERATE group, COUNT(words);
STORE word_count INTO ' Assignment4_3' USING PigStorage (',');