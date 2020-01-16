package com.mega.ITMS;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import com.mega.ITMS.report.monthly.MonthlyDao;
import com.mega.ITMS.report.monthly.SumMonthlyDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
//	@Autowired
//	MonthlyDao monthlyDao;
//
//	@RequestMapping(value = "/pdf", method = RequestMethod.GET)
//	public String pdf(Model model) throws Exception {
//		List<SumMonthlyDto> list=monthlyDao.list();
//
//		//뷰에게 전달할 데이터 저장
//		model.addAttribute("list", list);
//
//		//출력할 뷰 이름 리턴
//		return "pdf";
//	}
}
