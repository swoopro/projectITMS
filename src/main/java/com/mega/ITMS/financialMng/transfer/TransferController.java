package com.mega.ITMS.financialMng.transfer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/financialMng/transfer")
public class TransferController {

//	@Autowired
//	TransferDAO dao;
	
	@RequestMapping("/page3.do")
	private ModelAndView transfer(ModelAndView mav){
		mav.setViewName("financial/transfer/transfer_manage");
		return mav;
		
	}
	
	@RequestMapping("transfer_update")
	private ModelAndView transfer_update(ModelAndView mav){
		mav.setViewName("financial/transfer/transfer_update");
		return mav;
		
	}
}
