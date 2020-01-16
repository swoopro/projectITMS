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
	
	@RequestMapping("/importMain.do")
	public ModelAndView importMain(ModelAndView mav) {
		mav.setViewName("import/importprocess/importMain");
		int temporaryCompanyID = 1; // ���� ��� �ӽ��� ȸ����̵� �ο�
		String temporaryUserID = "wltn"; // ���� ��� �ӽ��� ����ھ��̵� �ο�

		List<Import_tradeFileDTO> tlist = dao.importTradeFileSelect(temporaryCompanyID);
		List<Import_basicTradeDTO> blist= dao.importBasicTradeSelect(temporaryCompanyID);
		mav.addObject("tradeFileList", tlist);
		mav.addObject("basicTradeList", blist);
		
		return mav;
	}
	
	/* import ���� ��� */
	@RequestMapping("/importOrder.do")
	public ModelAndView importOrder(ModelAndView mav) {
		mav.setViewName("import/importprocess/importOrderAdd");
		int temporaryCompanyID = 1; // ���� ��� �ӽ��� ȸ����̵� �ο�
		String temporaryUserID = "wltn"; // ���� ��� �ӽ��� ����ھ��̵� �ο�
		
		
		List<Import_employeeDTO> eList = dao.importEmployeeSelectAll(temporaryCompanyID);
		Import_companyDTO comDTO = dao.importCompanySelect(temporaryCompanyID);
		ArrayList<Import_businessDTO> bAList = dao.importBusinessSelectAll(temporaryCompanyID, "�ŷ�ó");
		ArrayList<Import_businessDTO> bPList = dao.importBusinessSelectAll(temporaryCompanyID, "��Ÿ��ü");
		List<Import_productDTO> product = dao.importProductSelectAll(temporaryCompanyID);
		
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
		System.out.println(">>>importAddShip ��Ʈ�ѷ� ����...");
		int id = dao.importBasicTradeDESC();
		dto.setBasic_id(id);
		dao.importOrderShippingInsert(dto);
		
		mav.setViewName("import/importprocess/importMain");

		return mav;
	}
	
	
	/* import ���ο��� ���Ǵ� �޴��� : detail */
	@RequestMapping("/importPOdetail.do")
	public String importPOdetail(Model model, String basicID) {
		int basic_id= Integer.parseInt(basicID);
		System.out.println(">>>import ���ο��� ���Ǵ� �޴��� : detail");
		
		int temporaryCompanyID = 1; // ���� ��� �ӽ��� ȸ����̵� �ο�
		String temporaryUserID = "wltn"; // ���� ��� �ӽ��� ����ھ��̵� �ο�
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
		/*
		 * model.addAttribute("eList", eList); model.addAttribute("comDTO", comDTO);
		 * model.addAttribute("", ); model.addAttribute("", );
		 */
		
		return "import/importprocess/importPOdetail";
	} 
	
	/* import ���ο��� ���Ǵ� �޴��� : print */
	@RequestMapping("/importPOprint.do")
	public String importPOprint(Model model, String basicID) {
		int basic_id= Integer.parseInt(basicID);
		System.out.println(">>>import ���ο��� ���Ǵ� �޴��� : detail");
		
		int temporaryCompanyID = 1; // ���� ��� �ӽ��� ȸ����̵� �ο�
		String temporaryUserID = "wltn"; // ���� ��� �ӽ��� ����ھ��̵� �ο�
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
	
	/* import ���ο��� ���Ǵ� �޴��� : edit */
	@RequestMapping("/importPOedit.do")
	public String importPOedit(Model model, String basicID) {
		int basic_id= Integer.parseInt(basicID);
		System.out.println(">>>import ���ο��� ���Ǵ� �޴��� : detail");
		
		int temporaryCompanyID = 1; // ���� ��� �ӽ��� ȸ����̵� �ο�
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
		
		return "�ȳ�??";
	}
	
	@RequestMapping("/importProductInsert.do")
	public ModelAndView importProductInsert(Import_orderDetailDTO dto) {
		System.out.println("��Ʈ�ѷ����� �Ծ��...");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("import/importprocess/importMain");
		dto.setBasic_id(this.basic_trade);
		dao.importProductInsert(dto);
		
		return mav;
	}
}
