package com.navernews.web.util;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jdom.Element;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.MediaTypeFactory;

import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

//import com.rometools.modules.mediarss.MediaEntryModule;
//import com.rometools.rome.feed.synd.SyndFeed
//import com.rometools.rome.feed.synd.SyndEntry
//import com.rometools.rome.feed.synd.SyndContent
//import com.rometools.modules.mediarss.MediaEntryModule
//import com.rometools.rome.feed.module.Module
//import com.rometools.modules.mediarss.types.Thumbnail

public class RSSUtil {

	@SuppressWarnings("unchecked")
	public JSONObject getRSSData(String uri) throws IllegalArgumentException, FeedException, IOException, JSONException{
		
		JSONObject jo = new JSONObject();
		
		ArrayList<String> newsCompanyArr = new ArrayList<>(Arrays.asList("SBS","조선일보","SBS"));
		
		SyndFeedInput input = new SyndFeedInput();
		URL feedSource = new URL(uri);
        SyndFeed syndFeed = input.build(new XmlReader(feedSource));
        
		List<SyndEntry> entries = syndFeed.getEntries();
        
		
		for (String company : newsCompanyArr) {
			if(syndFeed.getTitle().toString().contains(company))
				jo.put("title", company);
		}
		
		String img = syndFeed.getImage().getUrl().toString();
        jo.put("img", img);
        
        SyndEntry entry = null;
        
        ArrayList<Object> contentsList = new ArrayList<>();
           
        for(int i = 0; i < 5; i++) {
            
        	entry = entries.get(i);
            //System.out.println(entry.getEnclosures().iterator().next());
        	JSONObject contents = new JSONObject();

        	contents.put("number", i+"");
        	contents.put("author", entry.getAuthor().toString());
            //System.out.println("getLink==>"+entry.getLink());
            contents.put("title", entry.getTitle().toString());
            contents.put("uri", entry.getUri().toString());
            //System.out.println("getCategories==>"+entry.getCategories());
            //System.out.println("getClass==>"+entry.getClass());
            
            //SyndEnclosure syndEnclosure = (SyndEnclosure) entry.getEnclosures().iterator().next();
            //contents.put("imgUrl", syndEnclosure.getUrl().toString());
            
            //System.out.println(entry.getForeignMarkup().get(0));
            //System.out.println("entry==>"+((SyndContent) entry.getContents()).getValue().toString());
            
            //System.out.println("123"+((SyndContent) entry.getContents().iterator().next()).getValue());
            
           
//            
//            for (Element obj : (ArrayList<Element>) entry.getForeignMarkup()) {
//            	if(obj.getName() == "content") {
//            		//contents.put("imgUrl", obj.getNamespaceURI());
//            	}
//            	System.out.println(obj.getAttributeValue("url"));
//            }
//          
            
            String contentsStr = ((SyndContent) entry.getContents().iterator().next()).getValue();
            Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
            Matcher matcher = pattern.matcher(contentsStr);
            int count = 0;
            while(matcher.find()){
            	String imgStrWithJpg = matcher.group(1);
            	if(imgStrWithJpg.contains(".jpg")||imgStrWithJpg.contains(".png")||imgStrWithJpg.contains(".PNG")||imgStrWithJpg.contains(".JPG")) {
            		contents.put("imgUrl", imgStrWithJpg);
            		count++;
            	}
            	if(count == 1) {
            		break;
            	}
            }
            System.out.println(contents.get("imgUrl"));
            if(contents.get("imgUrl") == null || contents.get("imgUrl") == "") {
            	contents.put("imgUrl", img);
            }
           
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
