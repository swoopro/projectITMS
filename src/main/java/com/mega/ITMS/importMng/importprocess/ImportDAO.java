package com.mega.ITMS.importMng.importprocess;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImportDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	public Import_companyDTO importCompanySelect(int id) {
		Import_companyDTO dto = myBatis.selectOne("import.selectCompany", id);
		
		return dto;
	}
	
	public List<Import_employeeDTO> importEmployeeSelectAll(int id) {
		List<Import_employeeDTO> list = myBatis.selectList("import.selectAllEmployee", id);
		
		return list;
	}
	
	public ArrayList<Import_businessDTO> importBusinessSelectAll(int id, String type) {
		List<Import_businessDTO> list = myBatis.selectList("import.selectAllBusiness", id);
		ArrayList<Import_businessDTO> Alist = new ArrayList<Import_businessDTO>();
		for (int i = 0; i <list.size(); i++) {
			if(type.equals(list.get(i).getType())){
				Alist.add(list.get(i));
			}
			
		}
		
		return Alist;
	}
	
	public List<Import_customerDTO> importCustomerSelectAll(Import_customerDTO customerDTO) {
		List<Import_customerDTO> list = myBatis.selectList("import.selectAllCustomer", customerDTO);
		
		return list;

	}
	
	public List<Import_productDTO> importProductSelectAll(int com_id) {
		List<Import_productDTO> list = myBatis.selectList("import.selectAllProduct", com_id);
		
		return list;
	}
	
	public int importBasicTradeDESC() {
		int id = myBatis.selectOne("import.selectBasicTradeDESC");
		
		return id; 
	}
	
	public List<Import_tradeFileDTO> importTradeFileSelect(int com_id) {
		try {
			List<Import_tradeFileDTO> list = myBatis.selectList("selectAllTradeFile", com_id);
			return list;
		} catch (Exception e) {
		}
		
		return null;
	}
	
	public List<Import_basicTradeDTO> importBasicTradeSelect(int com_id) {
		try {
			List<Import_basicTradeDTO> list = myBatis.selectList("selectAllBasicTrade", com_id);
			return list;
		} catch (Exception e) {
		}
		
		return null;

	}

	
	public void importBasictradeInsert(Import_basicTradeDTO basicTradeDTO) {
		try {
			myBatis.insert("import.insertBasicTrade", basicTradeDTO);
		} catch (Exception e) {
		}
	}
	
	public void importProductInsert(Import_orderDetailDTO orderDetailDTO) {
		try {
			myBatis.insert("insertOrderDetail", orderDetailDTO);
		} catch (Exception e) {
		}
	}
	
	public void importTradeFileInsert(Import_tradeFileDTO tradeFileDTO) {
		try {
			myBatis.insert("insertTradeFile", tradeFileDTO);
		} catch (Exception e) {
			System.out.println(">>>insertTradeFile insert"  + tradeFileDTO);
		}
	}
	
	
}
