-- this script is an exilirily script to combine the data results from (pricePredictor.pig) and join it to the initail set
-- To Run the script
-- pig -x local -f best_pair.pig -param filename=cc.csv
 
data = load '$filename' using PigStorage('\t') as (first:chararray, second:chararray, side:chararray);

dump data;