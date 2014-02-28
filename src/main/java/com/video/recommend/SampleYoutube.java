package com.video.recommend;
import com.google.api.services.youtube.YouTube;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;

public class SampleYoutube {
	/**
     * Global instance of Youtube object to make all API requests.
     */
    private static YouTube youtube;
    
    public static void main(String[] args)
    {
    	System.out.println("Just Test ...");
    	try {
    	      /*
    	       * The YouTube object is used to make all API requests. The last argument is required, but
    	       * because we don't need anything initialized when the HttpRequest is initialized, we override
    	       * the interface and provide a no-op function.
    	       */
//    	            youtube = new YouTube.Builder(Auth.HTTP_TRANSPORT, Auth.JSON_FACTORY, new HttpRequestInitializer() {
//    	                public void initialize(HttpRequest request) throws IOException {
//    	                }
//    	            }).setApplicationName("youtube-cmdline-search-sample").build();
//
//    	            // Get query term from user.
//    	            String queryTerm = "comedy";
//    	            YouTube.Search.List search = youtube.search().list("id,snippet");
    	}
    	catch (Exception exc) {
    		System.out.println("Just Test ...");
    	}
    }

}
