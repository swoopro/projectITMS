<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
>>>>>>> Stashed changes
package com.mega.ITMS.financialMng.request;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mega.ITMS.financialMng.transfer.TransferDAO;
import com.mega.ITMS.financialMng.transfer.TransferDTO;

@RequestMapping("/financialMng/request")

@Controller
public class RequestController {

	@Autowired
	RequestDAO dao;
	
	@Autowired
	TransferDAO transferdao;
	
	@RequestMapping("/page1.do")
	private ModelAndView pay(ModelAndView mav){
		List<RequestDTO> list = dao.selectAll();
		mav.setViewName("financial/request/pay_request");
		mav.addObject("list",list);
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
	
	@ResponseBody
	@RequestMapping("pay_check")
	public List<RequestDTO> pay_check(RequestDTO requestDTO, HttpSession session){
		session.setAttribute("id", "temporaryID");
		requestDTO.setResponse_id((String)session.getAttribute("id"));
		dao.update(requestDTO);
		List<RequestDTO> list = dao.selectAll();
		System.out.println(list.get(0).getReceive_date() + "----------------");
		return list;
	}
	
	@ResponseBody
	@RequestMapping("payend")
	public TransferDTO payend(TransferDTO transferDTO){
		transferdao.insert(transferDTO);
		transferDTO = transferdao.selectpayend(transferDTO);
		return transferDTO;
	}
}
<<<<<<< Updated upstream
=======
=======
package com.mega.ITMS.financialMng.request;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mega.ITMS.financialMng.transfer.TransferDAO;
import com.mega.ITMS.financialMng.transfer.TransferDTO;

@RequestMapping("/financialMng/request")

@Controller
public class RequestController {

	@Autowired
	RequestDAO dao;
	
	@Autowired
	TransferDAO transferdao;
	
	@RequestMapping("/page1.do")
	private ModelAndView pay(ModelAndView mav){
		List<RequestDTO> list = dao.selectAll();
		mav.setViewName("financial/request/pay_request");
		mav.addObject("list",list);
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
	
	@ResponseBody
	@RequestMapping("pay_check")
	public List<RequestDTO> pay_check(RequestDTO requestDTO, HttpSession session){
		session.setAttribute("id", "asd"); // ��ġ������
		requestDTO.setResponse_id((String)session.getAttribute("id"));
		dao.update(requestDTO);
		List<RequestDTO> list = dao.selectAll();
		System.out.println(list.get(0).getReceive_date() + "----------------");
		return list;
	}
	
	@ResponseBody
	@RequestMapping("payend")
	public TransferDTO payend(TransferDTO transferDTO){
		transferdao.insert(transferDTO);
		transferDTO = transferdao.selectpayend(transferDTO);
		return transferDTO;
	}
}
>>>>>>> Stashed changes
>>>>>>> Stashed changes
