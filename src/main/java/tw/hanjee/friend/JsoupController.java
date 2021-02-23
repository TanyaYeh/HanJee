package tw.hanjee.friend;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JsoupController {

	@RequestMapping
	public String show(Model model) throws IOException {

		Document doc = Jsoup
				.connect("https://www.msn.com/zh-tw/lifestyle/horoscope")
				.timeout(60000).maxBodySize(60000000).get();
		
		Elements a = doc.select("#main > div.skyline.headline-template.loaded.no-axb.layout-large > div > div > div.horoscope");
		
		
//		System.out.println(doc);
//		String title = doc.title();
//		System.out.println(title);
		
//		Element content = doc.getElementById("content");
//		Elements links = content.getElementsByTag("p");
//
//		for (Element link : links) {
//			System.out.println(link.attr("href"));
//			System.out.println(link.text());
//		}
			model.addAttribute("a", "a");

			return "friend/JSoup";
		

	}
}
