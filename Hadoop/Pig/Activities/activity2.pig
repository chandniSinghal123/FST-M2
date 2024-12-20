inputFile = LOAD 'hdfs:///user/Chandni/input.txt' AS (line:chararray);
--Tokeize each word in the file (Map)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
-- Combine the words from the above stage
grpd = GROUP words BY word;
-- Count the occurence of each word (Reduce)

totalCount = FOREACH grpd GENERATE $0 AS WORD, COUNT($1) AS no_of_words;
rmf hdfs:///user/Chandni/PigOutput1;
-- Store the result in HDFS
STORE totalCount INTO 'hdfs:///user/Chandni/PigOutput1';
