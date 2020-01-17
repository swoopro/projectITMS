package com.mega.ITMS.importMng.importprocess;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/import/importprocess")
public class ImportPageController {
    int basic_trade;

    @Autowired
    ImportDAO dao;

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


    @RequestMapping("/importOrder.do")
    public ModelAndView importOrder(ModelAndView mav) {
        mav.setViewName("import/importprocess/importOrderAdd");
        int temporaryCompanyID = 1;
        String temporaryUserID = "wltn";

        Import_businessDTO dto = new Import_businessDTO();

        List<Import_employeeDTO> eList = dao.importEmployeeSelectAll(temporaryCompanyID);
        Import_companyDTO comDTO = dao.importCompanySelect(temporaryCompanyID);
        ArrayList<Import_businessDTO> bAList = dao.importBusinessSelectAll(temporaryCompanyID, "거래처");
        ArrayList<Import_businessDTO> bPList = dao.importBusinessSelectAll(temporaryCompanyID, "기타업체");
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
         List<Import_customerDTO> list = dao.importCustomerSelectAll(dto);
        return list;
    }



    @RequestMapping("/importPOdetail.do")
    public ModelAndView importPOdetail(String no, String id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("import/importprocess/importPIview");

        mav.addObject("no", no);
        mav.addObject("id", id);

        return mav;
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

        return "ŸÈ³ç??";
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