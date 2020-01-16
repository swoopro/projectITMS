package com.mega.ITMS.operationMng.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("operation/customer")
@Controller
class OperationMngCustomerController {

	@Autowired
	OperationMngCustomerDAOImpl omCsDAO;
	
// 페이지 연결 메서드
	
	// 거래처 관리 페이지
	@RequestMapping("customerRead")
	public void customerPage(Model model, HttpSession session) {
		session.setAttribute("com_id", 1);
		System.out.println("거래처 관리 페이지");
		List<OperationMngCustomerJoinDTO> list = omCsDAO.getCustomerBusinessReadAll(session.getAttribute("com_id"));
		model.addAttribute("list", list);
	}
	
	// 거래처 등록 페이지
	@RequestMapping("customerAdd1")
	public void customerAdd1Page() {
		System.out.println("거래처 정보 등록 페이지");
	}
	
	// 담당자 등록 페이지
	@RequestMapping("customerAdd2")
	public void customerAdd2Page() {
		System.out.println("담당자 정보 등록 페이지");
	}
	
	// 거래처 수정/삭제 페이지
	@RequestMapping("customerEditDel1")
	public void customerEditDel1Page(OperationMngBusinessDTO omBnDTO, Model model, HttpSession session) {
		// customerRead.jsp에서 넘겨 받은 아이디를 받기 위한 DTO,
		// select결과를 customerEditDel1.jsp로 보내주기 위한 Model,
		// select시 where 조건을 위해 필요한 HttpSession
		
//		System.out.println(omBnDTO.getId());
		session.setAttribute("com_id", 1); // 병수씨한테 session을 받아오기 전에 임의로 1 입력
//		System.out.println((Integer) session.getAttribute("com_id"));
		omBnDTO.setCom_id((Integer) session.getAttribute("com_id")); // DTO에 session값 com_id 담아주기(feat. Object session이라 형변환)
//		System.out.println(session.getAttribute("com_id"));
		System.out.println("거래처 정보 수정/삭제 페이지");
		omBnDTO = omCsDAO.getBusinessRead(omBnDTO); // customerRead.jsp에서 받아온 id값을 DTO에 담아주었기 때문에 새로 객체 생성하면 안됨 
//		System.out.println(omBnDTO);
		model.addAttribute("omBnDTO", omBnDTO); // ("select결과 페이지에서 써줄 이름", 넘겨줄 데이터)
	}
	
	// 담당자 수정/삭제 페이지
	@RequestMapping("customerEditDel2")
	public void customerEditDel2Page(OperationMngCustomerDTO omCsDTO, Model model, HttpSession session) {
		// customerRead.jsp에서 넘겨 받은 아이디를 받기 위한 DTO,
		// select결과를 customerEditDel1.jsp로 보내주기 위한 Model,
		// select시 where 조건을 위해 필요한 HttpSession
		
		session.setAttribute("com_id", 1); // 병수씨한테 session을 받아오기 전에 임의로 1 입력
		omCsDTO.setCom_id((Integer) session.getAttribute("com_id")); // DTO에 session값 com_id 담아주기(feat. Object session이라 형변환)
		System.out.println("담당자 정보 수정/삭제 페이지");
		omCsDTO = omCsDAO.getCustomerRead(omCsDTO); // customerRead.jsp에서 받아온 id값을 DTO에 담아주었기 때문에 새로 객체 생성하면 안됨
		model.addAttribute("omCsDTO", omCsDTO); // ("select결과 페이지에서 써줄 이름", 넘겨줄 데이터)
	}
	
// CRUD 메서드
	
	
	// 거래처 관리 메뉴//
	
	// 거래처 등록
	
	@RequestMapping("insertBn")
	public String insertBn(OperationMngBusinessDTO omBnDTO) {
		omCsDAO.addBusiness(omBnDTO);
		return "redirect:customerRead";
		// insert기능을 수행하면서 완료시 customerRead 컨트롤러에 들려서
		// selectAll을 해주고 customerRead페이지로 이동하도록 redirect
	}
	
	// 거래처 수정
	@RequestMapping("updateBn")
	public String updateBn(OperationMngBusinessDTO omBnDTO) {
		omCsDAO.editBusiness(omBnDTO);
		return "redirect:customerRead";
	}
	
	// 거래처 삭제
	@RequestMapping("deleteBn")
	public String deleteBn(OperationMngBusinessDTO omBnDTO) {
		omCsDAO.delBusiness(omBnDTO);
		return "redirect:customerRead";
	}
	
	// 거래처 목록
	
	// 거래처 목록 검색
	@ResponseBody
	@RequestMapping("searchBnCs")
	public List<OperationMngCustomerJoinDTO> searchBnCs(OperationMngCustomerJoinDTO omCsJoinDTO, Model model, HttpSession session, int dropdown, String search) {
		
		session.setAttribute("com_id", 1);
		omCsJoinDTO.setA_com_id((Integer) session.getAttribute("com_id"));
		System.out.println("거래처 관리 검색 페이지");
		System.out.println("드롭다운------------------------" + dropdown);
		System.out.println("검색어------------------------" + search);
		
		List<OperationMngCustomerJoinDTO> list = null;
		
		if (dropdown == 0) {
			omCsJoinDTO.setA_name(search);
			list = omCsDAO.getCustomerBusinessReadAllSearchZero(omCsJoinDTO);
		} else {
			omCsJoinDTO.setB_name(search);
			list = omCsDAO.getCustomerBusinessReadAllSearchOne(omCsJoinDTO);
		}
		return list;
	}
	
	// 담당자 //
	
	// 담당자 등록
	@RequestMapping("insertCs")
	public void insertCs(OperationMngCustomerDTO omCsDTO) {
		omCsDAO.addCustomer(omCsDTO);
	}
	
	// 담당자 수정
	@RequestMapping("updateCs")
	public String updateCs(OperationMngCustomerDTO omCsDTO) {
		omCsDAO.editCustomer(omCsDTO);
		return "redirect:customerRead";
	}
	// 담당자 삭제
	@RequestMapping("deleteCs")
	public String deleteCs(OperationMngCustomerDTO omCsDTO) {
		omCsDAO.delCustomer(omCsDTO);
		return "redirect:customerRead";
	}
	
	







}

