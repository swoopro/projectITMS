<<<<<<< HEAD
<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> 민경_laptop
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
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
=======
package com.mega.ITMS.financialMng.transfer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/financialMng/transfer")
public class TransferController {

	@Autowired
	TransferDAO dao;
	
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
	
	@RequestMapping("/insertAll")
	@ResponseBody
	private void insertAll(TransferDTO transferDTO){
		System.out.println(">>>ajax ��Ʈ�ѷ� ���� ����...");
		System.out.println(">>>ajax ��Ʈ�ѷ� DTO Ȯ��..." + transferDTO);
		dao.insertAll(transferDTO);
		System.out.println("insertcontroller@@@@@@@@@@");
	}
}
>>>>>>> Stashed changes
>>>>>>> Stashed changes
=======
>>>>>>> 민경_laptop
