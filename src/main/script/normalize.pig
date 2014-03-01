-- this script is an exilirily script to combine the data results from (pricePredictor.pig) and join it to the initail set
-- To Run the script
-- pig -x local -f normalize.pig -param filename=cc.csv
-- pig -x local -f normalize.pig -param filename=comedy_c.csv

REGISTER '../../../target/recommend-1.0-SNAPSHOT-jar-with-dependencies.jar';

DEFINE topic com.video.recommend.ExtractVideoTopicUDF;

DEFINE computeGrpSize(data, col)
RETURNS dataOfSize
{	
	A = group $data by $col;
	B = foreach A generate group, COUNT($1.$0);
	C = order B by $1 desc; 
	$dataOfSize = foreach C generate $0, $1;
}

--data = load '$filename' using PigStorage('\t') as (first:chararray, second:chararray, pref:chararray);
data = load '$filename' using PigStorage(',') as (first:chararray, second:chararray, pref:chararray);
filt1 = filter data by NOT( ($0=='#NAME?' AND $2=='left') OR ($1=='#NAME?' AND $2=='right'));
--filt1 = filter data by ($0 =='#NAME?' AND $2=='left');
filt2 = distinct filt1;  

D = computeGrpSize(filt2, $0);
D100 = limit D 100;
tops = foreach D100 generate $0, topic($0);
dump tops;

-- I am going to plot D to see the distribution of that in R
--store D into 'D';