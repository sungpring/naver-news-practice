package com.navernews.web.util;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

public class RSSUtil {

	@SuppressWarnings("unchecked")
	public JSONObject getRSSData(String uri) throws IllegalArgumentException, FeedException, IOException, JSONException{
		
		JSONObject jo = new JSONObject();
		
		List<String> tagList = new ArrayList<>();
		ArrayList<String> newsCompanyArr = new ArrayList<>(Arrays.asList("SBS","연합뉴스"));
		
		SyndFeedInput input = new SyndFeedInput();
		URL feedSource = new URL(uri);
        SyndFeed syndFeed = input.build(new XmlReader(feedSource));
        
		List<SyndEntry> entries = syndFeed.getEntries();
        
		newsCompanyArr.forEach(company -> {
			if(syndFeed.getTitle().toString().contains(company))
				try {
					jo.put("title", company);
				} catch (JSONException e) {
					e.printStackTrace();
				}
		});
        jo.put("img", syndFeed.getImage().getUrl().toString());
        
        SyndEntry entry = null;
        
        ArrayList<Object> contentsList = new ArrayList<>();
           
        for(int i = 0; i < 5; i++) {
            
        	entry = entries.get(i);
            
        	JSONObject contents = new JSONObject();
        	
        	contents.put("number", i+"");
        	contents.put("author", entry.getAuthor().toString());
            //System.out.println("getLink==>"+entry.getLink());
            contents.put("title", entry.getTitle().toString());
            contents.put("uri", entry.getUri().toString());
            //System.out.println("getCategories==>"+entry.getCategories());
            //System.out.println("getClass==>"+entry.getClass());
			
			//System.out.println("getContents==>"+((SyndContent)entry.getContents().get(0)).getValue());
            contents.put("description", entry.getDescription().getValue().toString());
            Date updatedAt = entry.getUpdatedDate();
            if(updatedAt == null) updatedAt = entry.getPublishedDate();
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(updatedAt);
            
            Calendar calNow = Calendar.getInstance();
            Date dateNow = new Date();
            calNow.setTime(dateNow);
            
            contents.put("publishedDate", calNow.getTime().getHours()-cal.getTime().getHours());
			 
            contentsList.add(contents);
        }
        
        jo.put("contents", contentsList);
		
		return jo;
	}
}
