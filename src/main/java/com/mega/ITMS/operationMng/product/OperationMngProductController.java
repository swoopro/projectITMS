package com.mega.ITMS.operationMng.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mega.ITMS.operationMng.customer.OperationMngCustomerDTO;
import com.mega.ITMS.operationMng.customer.OperationMngCustomerJoinDTO;

@RequestMapping("operation/product")
@Controller
public class OperationMngProductController {
	
	@Autowired
	OperationMngProductDAOImpl omPdDAO;

// 페이지 연결 메서드	
	
	// 제품 관리 목록(getProductReadAll, selectAll)
	@RequestMapping("productRead")
	public void productRead(Model model, HttpSession session) {
		session.setAttribute("com_id", 1);
		System.out.println("제품 관리 페이지");
		List<OperationMngProductDTO> list = omPdDAO.getProductReadAll(session.getAttribute("com_id"));
		model.addAttribute("list", list);
	}
	
	// 제품 이력 목록(getProductReadAllHistory, selectAll) + 내림차순/오름차순
	
	// ajax 통신 시 따로 result를 출력할 jsp파일을 생성하지 않고 현재 컨트롤러에서 모달창으로 전달할 데이터들을 담아준 list를
	// ajax result로 바로 쏴주기 위해 @ResponseBody 사용 
	@ResponseBody
	@RequestMapping("priceHistory") // result 출력 파일을 생성하지 않기 때문에 ajax url의 요청 주소와 동일하게만 해주면 됨
	public List<OperationMngProductDTO> productReadHistory(OperationMngProductDTO omPdDTO, HttpSession session, int filter) {
		// code를 받아주기 위한 OperationMngProductDTO
		// com_id를 session으로 받아주기 위한 HttpSession
		// 여기서는 ajax의 result로 list에 담아준 데이터들을 보내주기 때문에 Model 객체가 입력값으로 필요하지 않음
		
		session.setAttribute("com_id", 1);
		omPdDTO.setCom_id((Integer) session.getAttribute("com_id")); // object 타입의 session을 형변환
		System.out.println("제품 관리 페이지");
		
		List<OperationMngProductDTO> list = null; // if문 밖에서 객체 생성을 해줘야 return list가 밖에서 가능
		
		// product.jsp의 오름차순, 내림차순 버튼 클릭시 받아올 filter 값을 if문으로 분기
		if (filter == 0) {
			list = omPdDAO.getProductReadAllHistory(omPdDTO); // 내림차순 DAO
		}else {
			list = omPdDAO.getProductReadAllHistoryUp(omPdDTO); // 오름차순 DAO
		}		
		return list;		
	}
	
	// 제품 정보 등록 페이지
	@RequestMapping("productAdd")
	public void productAdd1Page() {
		System.out.println("제품 정보 등록 페이지");
	}
	
	// 제품 정보 수정(getProductRead 사용, selectOne)
	@RequestMapping("productEditDel")
	public void productEditDel1Page(OperationMngProductDTO omPdDTO, Model model, HttpSession session) {
		System.out.println(omPdDTO.getId()+"---------- id 왜 0 뜨냐 ------------");
		session.setAttribute("com_id", 1);
		omPdDTO.setCom_id((Integer) session.getAttribute("com_id"));
		System.out.println(omPdDTO.getCom_id()+"---------- com_id 1 뜨냐 ------------");
		System.out.println("제품 정보 수정/삭제 페이지");
		omPdDTO = omPdDAO.getProductRead(omPdDTO);
		System.out.println("dto에 들어오는 거ㄴ냐 이거");
		System.out.println(omPdDTO.getCode());
		System.out.println("dto에 들어오는 거ㄴ냐 이거");
		model.addAttribute("omPdDTO", omPdDTO);
	}

	
// CRUD 메서드
	
	@RequestMapping("insertPd")
	public String insertPd(OperationMngProductDTO omPdDTO, HttpSession session) {
		session.setAttribute("com_id", 1);
		omPdDTO.setCom_id((Integer) session.getAttribute("com_id"));
		omPdDAO.addProduct(omPdDTO);
		return "redirect:productRead";
	}
	
	@RequestMapping("updatePd")
	public String updatePd(OperationMngProductDTO omPdDTO) {
		omPdDAO.editProduct(omPdDTO); // 이력관리를 위해 update가 아닌 insert 메서드 사용
		return "redirect:productRead";
	}
	
	// 제품 삭제
	@RequestMapping("deletePd")
	public String deletePd(OperationMngProductDTO omPdDTO) {
		omPdDAO.delProduct(omPdDTO);
		return "redirect:productRead";
	}
}
