package com.navernews.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.configurationprocessor.json.JSONArray;
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
	
	@SuppressWarnings("unchecked")
	@GetMapping("/20220101-naver")
	public ModelAndView naverTestPage() throws IllegalArgumentException, FeedException, IOException, JSONException {
		
		ModelAndView mv = new ModelAndView();
		
		List<Object> titleImgList = new ArrayList<>();
		
		RSSUtil rss = new RSSUtil();
		JSONObject jsonOb = rss.getRSSData("https://news.sbs.co.kr/news/SectionRssFeed.do?sectionId=01&plink=RSSREADER");
		
		/* card */
		for(int i=0; i<=8; i++) {
			JSONObject titleAndImgObj = new JSONObject();
			titleAndImgObj.put("title", jsonOb.getString("title")); //jsonOb.getString("title")
			titleAndImgObj.put("img", jsonOb.getString("img"));
			titleImgList.add(titleAndImgObj);
		}
		/* card end */	
		
		mv.addObject("titleImg", titleImgList);
		mv.addObject("listContents", jsonOb.get("contents")); // 만약 다른 RSS 까지 불러온다면 jsonOb.get("contents") 를 다시 JSONObject 에 넣어서 그 key로 다른 뉴스사 가져오기
		
		return mv;
	}
	
}
