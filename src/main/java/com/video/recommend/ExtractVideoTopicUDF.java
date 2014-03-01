package com.video.recommend;


import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;
import org.apache.pig.data.TupleFactory;



public class ExtractVideoTopicUDF extends EvalFunc<String>{
	TupleFactory mTupleFactory = TupleFactory.getInstance();
	public String exec(Tuple tuple) throws IOException {
		String topic = "test";
		String url_prefix = "http://gdata.youtube.com/feeds/api/videos/";
		String url_suffix = "?v=2&alt=json";
        // expect price
        if (tuple == null || tuple.size()<1) {
        	System.out.println("ExtractVideoTopicUDF: requires one input parameter.");        	
        }
        try {
            String first = (String)tuple.get(0);
            String uri = url_prefix+first+url_suffix;
            HttpClient httpclient = new DefaultHttpClient();
            HttpGet httpget = new HttpGet(uri);
            HttpResponse response = httpclient.execute(httpget);
            System.out.println(response.getStatusLine().toString());
            HttpEntity entity = response.getEntity();
            System.out.println();
            System.out.println(EntityUtils.toString(entity)); 
            return EntityUtils.toString(entity);
        }
        catch (Exception e) {
            throw new IOException("ExtractVideoTopicUDF: caught exception processing input.", e);
        }
    }
    		
    		
    
}

