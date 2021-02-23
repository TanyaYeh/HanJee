package tw.hanjee.friend.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.org.apache.xpath.internal.operations.Div;

//@Controller
public class TestJsoupPage {

	Session session;
	
//	@RequestMapping("")
	public static void main(String[] args) throws IOException {
		String[] conArray = { "%E7%89%A1%E7%BE%8A%E5%BA%A7/ar-BBNYkY5", "%E7%8D%85%E5%AD%90%E5%BA%A7/ar-BBNYhd6",
				"%E9%9B%99%E5%AD%90%E5%BA%A7/ar-BBNYcrB", "%E5%B7%A8%E8%9F%B9%E5%BA%A7/ar-BBNYhd5",
				"%E8%99%95%E5%A5%B3%E5%BA%A7/ar-BBNY6BJ", "%E5%A4%A9%E7%A7%A4%E5%BA%A7/ar-BBNYhd4",
				"%E5%A4%A9%E8%A0%8D%E5%BA%A7/ar-BBNY6BI", "%E5%B0%84%E6%89%8B%E5%BA%A7/ar-BBNYcrA",
				"%E6%91%A9%E7%BE%AF%E5%BA%A7/ar-BBNYjGC", "%E6%B0%B4%E7%93%B6%E5%BA%A7/ar-BBNYjGI" };
		
		List<String> list = new ArrayList<String>();

		Document doc = Jsoup
				.connect("https://www.msn.com/zh-tw/lifestyle/horoscope/"+conArray[0])
				.timeout(60000).maxBodySize(60000000).get();

		Element content = doc.getElementById("content");
		Elements links = content.getElementsByTag("p");

		for (Element link : links) {
//			System.out.println(link.text());
			list.add(link.text());

		}
		ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(list);
        System.out.println(jsonString);
		
	}

}
