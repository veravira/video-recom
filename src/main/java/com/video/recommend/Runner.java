package com.video.recommend;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

public class Runner {
	public static void main(String [] args)
	{
		Runner r = new Runner();
		r.testSomething();
	}
	
	private void testSomething()
	{
		String topic = "test";
		String url_prefix = "http://gdata.youtube.com/feeds/api/videos?part=title&id=";
		String url_suffix = "";
        // expect price
        String first = "Velzwi-TUno";
        try {
            String uri = url_prefix+first+url_suffix;
            HttpClient httpclient = new DefaultHttpClient();
            HttpGet httpget = new HttpGet(uri);
            HttpResponse response = httpclient.execute(httpget);
            System.out.println(response.getStatusLine().toString());
            HttpEntity entity = response.getEntity();
            topic = (String)response.getParams().getParameter("title");
            System.out.println("### = " + topic);
            topic = entity.getContentType().getValue();
            System.out.println("### = " + topic);
            System.out.println(EntityUtils.toString(entity));
        }
        catch(Exception exc) {
        	System.out.println("uuuu");
        }
        
	}
}
