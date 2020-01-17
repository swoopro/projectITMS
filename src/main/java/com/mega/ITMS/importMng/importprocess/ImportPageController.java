package com.mega.ITMS.importMng.importprocess;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/import/importprocess")
public class ImportPageController {
	int basic_trade;

	@Autowired
	ImportDAO dao;
	
	/* 메인화면으로 이동 */
	@RequestMapping("/importMain.do")
	public ModelAndView importMain(ModelAndView mav) {
		mav.setViewName("import/importprocess/importMain");
		int temporaryCompanyID = 1; 
		String temporaryUserID = "wltn";

		List<Import_tradeFileDTO> tlist = dao.importTradeFileSelect(temporaryCompanyID);
		List<Import_basicTradeDTO> blist= dao.importBasicTradeSelect(temporaryCompanyID);
		mav.addObject("tradeFileList", tlist);
		mav.addObject("basicTradeList", blist);
		
		return mav;
	}
	
	/* import 주문발주 */
	@RequestMapping("/importOrder.do")
	public ModelAndView importOrder(ModelAndView mav) {
		mav.setViewName("import/importprocess/importOrderAdd");
		int temporaryCompanyID = 1;
		String temporaryUserID = "wltn";
		
		
		List<Import_employeeDTO> eList = dao.importEmployeeSelectAll(temporaryCompanyID); //회사의 직원 selectAll
		Import_companyDTO comDTO = dao.importCompanySelect(temporaryCompanyID); //회사의 정보
		ArrayList<Import_businessDTO> bAList = dao.importBusinessSelectAll(temporaryCompanyID, "거래처"); //회사의 판매(거래처) select
		ArrayList<Import_businessDTO> bPList = dao.importBusinessSelectAll(temporaryCompanyID, "기타업체"); //회사의 협력(기타업체) select
		List<Import_productDTO> product = dao.importProductSelectAll(temporaryCompanyID); //회사가 등록한 제품 selectAll
		
		mav.addObject("companyDTO", comDTO);
		mav.addObject("employeeList", eList);
		mav.addObject("businessAList", bAList);
		mav.addObject("businessPList", bPList);
		mav.addObject("productList", product);
		
		
		return mav;
	}
	
	@RequestMapping("/importAJaxCustomer.do")
	@ResponseBody
	public List<Import_customerDTO> importAjaxCustomer(Import_customerDTO dto) {
		System.out.println("ajax@@@@@@"+dto.getCom_id());
		System.out.println("ajax@@@@@@"+dto.getB_id());
		
		List<Import_customerDTO> list = dao.importCustomerSelectAll(dto);
		
		return list;
	}
	
	@RequestMapping("/importAddShipping.do")
	public ModelAndView importAddShip(Import_orderShipping dto) {
		ModelAndView mav = new ModelAndView();
		int id = dao.importBasicTradeDESC();
		dto.setBasic_id(id);
		dao.importOrderShippingInsert(dto);
		
		mav.setViewName("import/importprocess/importMain");

		return mav;
	}
	
	
	/* import 메인 각 메뉴 : detail */
	@RequestMapping("/importPOdetail.do")
	public String importPOdetail(Model model, String basicID) {
		int basic_id= Integer.parseInt(basicID);
		
		int temporaryCompanyID = 1; 
		String temporaryUserID = "wltn";
		ArrayList<Import_productDTO> proList = new ArrayList<Import_productDTO>();
		
		Import_basicTradeDTO basicDTO= dao.importBasicTradeSelectPK(basic_id);
		List<Import_orderDetailDTO> detailList = dao.importOrderDetailAll(basic_id);
		Import_orderShipping shipDTO = dao.importOrderShippingOne(basic_id);
		Import_employeeDTO emDTO = dao.importEmployeeSelectID(basicDTO.getUser_id());
		Import_businessDTO bsDTO = dao.importBusinessSelectOne(basicDTO.getB_id());
		Import_businessDTO bsPartnerDTO = dao.importBusinessSelectOne(shipDTO.getCb_id());
		Import_customerDTO cusDTO = dao.importCustomerSelectOne(basicDTO.getC_id());
		Import_customerDTO cusPartnerDTO = dao.importCustomerSelectOne(shipDTO.getDcb_id());
		Import_companyDTO comDTO = dao.importCompanySelect(temporaryCompanyID); /*  */
		
		for (int i = 0; i < detailList.size(); i++) {
			Import_productDTO dto = dao.importProductSelectPID(detailList.get(i).getP_id());
			proList.add(dto);
		}
		
		model.addAttribute("basicDTO", basicDTO);
		model.addAttribute("shipDTO", shipDTO);
		model.addAttribute("emDTO", emDTO);
		model.addAttribute("bsDTO", bsDTO);
		model.addAttribute("bsPartnerDTO", bsPartnerDTO);
		model.addAttribute("cusDTO", cusDTO);
		model.addAttribute("cusPartnerDTO", cusPartnerDTO);
		model.addAttribute("comDTO", comDTO);
		model.addAttribute("detailList", detailList);
		model.addAttribute("proList", proList);
		
		return "import/importprocess/importPOdetail";
	} 
	
	/* import 메인 각 메뉴 : print */
	@RequestMapping("/importPOprint.do")
	public String importPOprint(Model model, String basicID) {
		int basic_id= Integer.parseInt(basicID);
		
		int temporaryCompanyID = 1; 
		String temporaryUserID = "wltn"; 
		ArrayList<Import_productDTO> proList = new ArrayList<Import_productDTO>();
		
		Import_basicTradeDTO basicDTO= dao.importBasicTradeSelectPK(basic_id);
		List<Import_orderDetailDTO> detailList = dao.importOrderDetailAll(basic_id);
		Import_orderShipping shipDTO = dao.importOrderShippingOne(basic_id);
		Import_employeeDTO emDTO = dao.importEmployeeSelectID(basicDTO.getUser_id());
		Import_businessDTO bsDTO = dao.importBusinessSelectOne(basicDTO.getB_id());
		Import_businessDTO bsPartnerDTO = dao.importBusinessSelectOne(shipDTO.getCb_id());
		Import_customerDTO cusDTO = dao.importCustomerSelectOne(basicDTO.getC_id());
		Import_customerDTO cusPartnerDTO = dao.importCustomerSelectOne(shipDTO.getDcb_id());
		Import_companyDTO comDTO = dao.importCompanySelect(temporaryCompanyID); /* �ּ�,tel */
		
		for (int i = 0; i < detailList.size(); i++) {
			Import_productDTO dto = dao.importProductSelectPID(detailList.get(i).getP_id());
			proList.add(dto);
		}
		
		model.addAttribute("basicDTO", basicDTO);
		model.addAttribute("shipDTO", shipDTO);
		model.addAttribute("emDTO", emDTO);
		model.addAttribute("bsDTO", bsDTO);
		model.addAttribute("bsPartnerDTO", bsPartnerDTO);
		model.addAttribute("cusDTO", cusDTO);
		model.addAttribute("cusPartnerDTO", cusPartnerDTO);
		model.addAttribute("comDTO", comDTO);
		model.addAttribute("detailList", detailList);
		model.addAttribute("proList", proList);
		
		return "import/importprocess/importPOprint";
	} 
	
	/* import 메인 각 메뉴 : edit */
	@RequestMapping("/importPOedit.do")
	public String importPOedit(Model model, String basicID) {
		int basic_id= Integer.parseInt(basicID);
		System.out.println(">>>import ���ο��� ���Ǵ� �޴��� : detail");
		
		int temporaryCompanyID = 1; //
		ArrayList<Import_productDTO> proList = new ArrayList<Import_productDTO>();
		
		Import_basicTradeDTO basicDTO= dao.importBasicTradeSelectPK(basic_id);
		List<Import_orderDetailDTO> detailList = dao.importOrderDetailAll(basic_id);
		Import_orderShipping shipDTO = dao.importOrderShippingOne(basic_id);
		Import_employeeDTO emDTO = dao.importEmployeeSelectID(basicDTO.getUser_id()); //eList2 에서 고객담당아이디 c_id로 하는게 효율적일거 같음
		Import_businessDTO bsDTO = dao.importBusinessSelectOne(basicDTO.getB_id());
		Import_businessDTO bsPartnerDTO = dao.importBusinessSelectOne(shipDTO.getCb_id()); //bPList2에서 ship의 cb_id로 하는게 효율적일거 같음
		Import_customerDTO cusDTO = dao.importCustomerSelectOne(basicDTO.getC_id());
		Import_customerDTO cusPartnerDTO = dao.importCustomerSelectOne(shipDTO.getDcb_id());
		Import_companyDTO comDTO = dao.importCompanySelect(temporaryCompanyID); /* �ּ�,tel */
		
		List<Import_employeeDTO> eList2 = dao.importEmployeeSelectAll(temporaryCompanyID); //회사의 직원 selectAll
		ArrayList<Import_businessDTO> bAList2 = dao.importBusinessSelectAll(temporaryCompanyID, "거래처"); //회사의 판매(거래처) select
		ArrayList<Import_businessDTO> bPList2 = dao.importBusinessSelectAll(temporaryCompanyID, "기타업체"); //회사의 협력(기타업체) select
		List<Import_productDTO> product2 = dao.importProductSelectAll(temporaryCompanyID); //회사가 등록한 제품 selectAll

		
		for (int i = 0; i < detailList.size(); i++) {
			Import_productDTO dto = dao.importProductSelectPID(detailList.get(i).getP_id());
			proList.add(dto);
		}
		
		model.addAttribute("eList2", eList2);
		model.addAttribute("bAList2", bAList2);
		model.addAttribute("bPList", bPList2);
		model.addAttribute("product2", product2);
		model.addAttribute("basicDTO", basicDTO);
		model.addAttribute("shipDTO", shipDTO);
		model.addAttribute("emDTO", emDTO);
		model.addAttribute("bsDTO", bsDTO);
		model.addAttribute("bsPartnerDTO", bsPartnerDTO);
		model.addAttribute("cusDTO", cusDTO);
		model.addAttribute("cusPartnerDTO", cusPartnerDTO);
		model.addAttribute("comDTO", comDTO);
		model.addAttribute("detailList", detailList);
		model.addAttribute("proList", proList);
		
		return "import/importprocess/importPOedit";
	} 


	
	@RequestMapping("/importAddOrderAjax.do")
	@ResponseBody
	public String importAddOrderAjax(Import_basicTradeDTO dto) {
		dao.importBasictradeInsert(dto);
		this.basic_trade = dao.importBasicTradeDESC();
		Import_tradeFileDTO tfDTO = new Import_tradeFileDTO();
		tfDTO.setBasic_id(this.basic_trade);
		tfDTO.setFile_name("non-nameValue");
		tfDTO.setType_file(1);
		dao.importTradeFileInsert(tfDTO);
		System.out.println(">>>Import_basicTradeDTO" + dto);
		
		return "retunValue";
	}
	
	@RequestMapping("/importProductInsert.do")
	public ModelAndView importProductInsert(Import_orderDetailDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("import/importprocess/importMain");
		dto.setBasic_id(this.basic_trade);
		dao.importProductInsert(dto);
		
		return mav;
	}
}
