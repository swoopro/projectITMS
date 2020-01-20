package com.mega.ITMS.financialMng.transfer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mega.ITMS.financialMng.request.RequestDAO;
import com.mega.ITMS.financialMng.request.RequestDTO;

@Controller
@RequestMapping("/financialMng/transfer")
public class TransferController {

	@Autowired
	TransferDAO dao;
	
	@RequestMapping("/page3.do")
	private ModelAndView transfer(ModelAndView mav, HttpSession session){
		List<TransferDTO> list = dao.selectAll();
		
		session.setAttribute("com_id", 2138615419);
		
		List<RequestDTO> request_list = dao.selectRequest((Integer)session.getAttribute("com_id"));
		mav.setViewName("financial/transfer/transfer_manage");
		mav.addObject("list", list);
		mav.addObject("request_list", request_list);
		return mav;
		
	}
	
	@RequestMapping("transfer_update")
	private ModelAndView transfer_update(ModelAndView mav){
		mav.setViewName("financial/transfer/transfer_update");
		return mav;
		
	}
	
	@RequestMapping("/insertAll")
	@ResponseBody
	private void insertAll(TransferDTO transferDTO){
		dao.insertAll(transferDTO);
	}
}
