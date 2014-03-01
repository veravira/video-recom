#!/usr/bin/python
from org.apache.pig.scripting import *
import subprocess

def curl_put(url):
    print url;
    cmd = ['curl', '-XPUT', url]
    subprocess.check_call(cmd)

def main():
    
    output = "output"
#Pig.fs("cat apple.txt >> words/part-m-00000")
Prep = Pig.compile("""
	REGISTER '/Users/vera.kalinichenko/soft/piggybank.jar';
	REGISTER 'elasticsearch-hadoop-1.3.0.BUILD-SNAPSHOT.jar';
	REGISTER '/Users/vera.kalinichenko/projects/pig-template/target/pig-template-1.0-SNAPSHOT.jar';
	DEFINE s STRSPLIT;
	define ESStorage org.elasticsearch.hadoop.pig.ESStorage('es.resource=gwos/bars');
	define mySplit com.gamblitgaming.pig.BarRetrieverUDF();
	
	data = load 'gwos-app.log' using PigStorage('\t'); 
 	gameObjsData = filter data by ($0 MATCHES '.*GameBarObj.*');
	dump gameObjsData;
	--store gameObjsData into '$date/gameObjData';
	objs = foreach gameObjsData generate $0 as cl1;
	bars = group objs ALL; 
	counts = foreach bars generate COUNT(objs); 
	dump counts;
	g1 = foreach gameObjsData generate $0;
	g1_grp = group g1 ALL;
	g1_count = foreach g1_grp generate flatten(g1.$0), COUNT(g1);
	dump g1_count;
	describe g1_count;
	g2 = foreach g1_count generate (chararray)$0 as wagerDetails, $1 as count; 
	GG = foreach g2 generate flatten(mySplit($0, $1));
	dump GG;
	store GG into 'GG1';


"""
).bind().runSingle()



file = open('GG1/part-r-00000', 'rU')
r = file.readline()
        
while (r is not None):
    w = r    
    print "*****************************" + w;
    
    r = file.readline()
    curl_put(r);

file.close



if __name__ == '__main__':
    main()