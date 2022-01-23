package com.navernews.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.navernews.web.util.RSSUtil;
import com.sun.syndication.io.FeedException;

@Controller
@RequestMapping("/views")
public class NaverController {
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	@GetMapping("/20220101-naver")
	public ModelAndView naverTestPage() throws IllegalArgumentException, FeedException, IOException, JSONException {
		
		ModelAndView mv = new ModelAndView();
		
		List<String> uriList = new ArrayList<>();
		uriList.add("https://news.sbs.co.kr/news/SectionRssFeed.do?sectionId=01&plink=RSSREADER"); //SBS
		uriList.add("https://www.chosun.com/arc/outboundfeeds/rss/?outputType=xml"); //조선일보
		uriList.add("https://news.sbs.co.kr/news/SectionRssFeed.do?sectionId=01&plink=RSSREADER"); //SBS
		
		uriList.add("https://news.sbs.co.kr/news/SectionRssFeed.do?sectionId=01&plink=RSSREADER"); //SBS
		uriList.add("https://www.chosun.com/arc/outboundfeeds/rss/?outputType=xml"); //조선일보
		uriList.add("https://news.sbs.co.kr/news/SectionRssFeed.do?sectionId=01&plink=RSSREADER"); //SBS
		
		uriList.add("https://news.sbs.co.kr/news/SectionRssFeed.do?sectionId=01&plink=RSSREADER"); //SBS
		uriList.add("https://www.chosun.com/arc/outboundfeeds/rss/?outputType=xml"); //조선일보
		uriList.add("https://news.sbs.co.kr/news/SectionRssFeed.do?sectionId=01&plink=RSSREADER"); //SBS
		
		/* card */
		List<Object> titleImgList = new ArrayList<>();
		for(int i=0; i<=8; i++) {
			RSSUtil rss = new RSSUtil();
			JSONObject jsonOb = rss.getRSSData(uriList.get(i));
			
			JSONObject titleAndImgObj = new JSONObject();
			titleAndImgObj.put("title", jsonOb.getString("title"));
			titleAndImgObj.put("img", jsonOb.getString("img"));
			titleAndImgObj.put("contents", jsonOb.get("contents"));
			titleImgList.add(titleAndImgObj);
		}
		mv.addObject("titleImg", titleImgList);
		/* card end */	
		
		/* day list */
		Date date = new Date();
		SimpleDateFormat sdformat = new SimpleDateFormat("MM월 dd일 (E)");
		Calendar cal = Calendar.getInstance();
		List<String> dayList = new ArrayList<>();
		for(int i=0; i>-5; i--) {
			cal.setTime(date);
			cal.add(Calendar.DATE, i);
			String today = sdformat.format(cal.getTime());
			dayList.add(today);
		}
		mv.addObject("dayList", dayList);
		/* day list end*/
		
		return mv;
	}
	
}
