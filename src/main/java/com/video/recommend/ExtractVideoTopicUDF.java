package com.video.recommend;


import java.io.IOException;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;
import org.apache.pig.data.TupleFactory;

public class ExtractVideoTopicUDF extends EvalFunc<String>{
	TupleFactory mTupleFactory = TupleFactory.getInstance();
	public String exec(Tuple tuple) throws IOException {
		String topic = "test";
        // expect price
        if (tuple == null || tuple.size()<1) {
        	System.out.println("ExtractVideoTopicUDF: requires one input parameter.");        	
        }
        try {
            String first = (String)tuple.get(0);            
            return topic;
        }
        catch (Exception e) {
            throw new IOException("ExtractVideoTopicUDF: caught exception processing input.", e);
        }
    }
    		
    		
    
}

