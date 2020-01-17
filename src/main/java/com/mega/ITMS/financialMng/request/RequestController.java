package com.mega.ITMS.financialMng.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/financialMng/request")

@Controller
public class RequestController {

	@Autowired
	RequestDAO dao;
	
	@RequestMapping("/page1.do")
	private ModelAndView pay(ModelAndView mav){
		//List<RequestDTO> list = dao.selectAll();
		mav.setViewName("financial/request/pay_request");
		//mav.addObject("list",list);
		return mav;
		
	}

	@RequestMapping("/page2.do")
	private ModelAndView receive(ModelAndView mav){
		mav.setViewName("financial/request/receive_request");
		return mav;
	}
	
	@RequestMapping("pay_save")
	private ModelAndView save(ModelAndView mav){
		mav.setViewName("financial/request/pay_save");
		return mav;
	}
	
	@RequestMapping("pay_update")
	private ModelAndView update(ModelAndView mav){
		mav.setViewName("financial/request/pay_update");
		return mav;
	}
	
	@RequestMapping("pay_update2")
	private ModelAndView update2(ModelAndView mav){
		mav.setViewName("financial/request/pay_update2");
		return mav;
	}
	
	@RequestMapping("pay_account_detail")
	private ModelAndView detail(ModelAndView mav){
		mav.setViewName("financial/request/pay_account_detail");
		return mav;
	}
	
	@RequestMapping("receive_save")
	private ModelAndView receive_save(ModelAndView mav){
		mav.setViewName("financial/request/receive_save");
		return mav;
	}
	@RequestMapping("receive_sender_detail")
	private ModelAndView receive_detail(ModelAndView mav){
		mav.setViewName("financial/request/receive_sender_detail");
		return mav;
	}
	@RequestMapping("receive_update")
	private ModelAndView receive_update(ModelAndView mav){
		mav.setViewName("financial/request/receive_update");
		return mav;
	}
	@RequestMapping("receive_update2")
	private ModelAndView receive_update2(ModelAndView mav){
		mav.setViewName("financial/request/receive_update2");
		return mav;
	}
	
	@RequestMapping("pay_check")
	@ResponseBody
	public void pay_check(RequestDTO requestDTO){
		try {
			System.out.println("���������@@@@@@@@@" + requestDTO.getId());
			
		} catch (Exception e) {
			System.out.println("DTO ����");
		}
		dao.update(requestDTO);
	}

}
