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
	
	public Import_employeeDTO importEmployeeSelectID(String id) {
		try {
			Import_employeeDTO dto = myBatis.selectOne("import.selectEmployee", id);
			System.out.println(">>>사용자아이디 검색 성공....");
			return dto;
		} catch (Exception e) {
			System.out.println(">>>사용자아이디 검색 실패....");
		}
		return null;
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
	
	
	
	public Import_businessDTO importBusinessSelectOne(int b_id) {
		
		try {
			Import_businessDTO dto = myBatis.selectOne("selectBusiness", b_id);
			System.out.println(">>>비즈니스 DTO 가져오기 성공....");
			return dto;
		} catch (Exception e) {
			System.out.println(">>>비즈니스 DTO 가져오기 실패....");
		}
		
		return null;
	}
	
	public Import_orderShipping importOrderShippingOne(int basic_id) {
		try {
			Import_orderShipping dto = myBatis.selectOne("selectOrderShipping", basic_id);
			System.out.println(">>>오더쉬핑 DTO 가져오기 성공....");
			return dto;
		} catch (Exception e) {
			System.out.println(">>>오더쉬핑 DTO 가져오기 실패....");
		}
		
		return null;
		
	}
	
	public List<Import_customerDTO> importCustomerSelectAll(Import_customerDTO customerDTO) {
		List<Import_customerDTO> list = myBatis.selectList("import.selectAllCustomer", customerDTO);
		
		return list;

	}
	
	public List<Import_productDTO> importProductSelectAll(int com_id) {
		List<Import_productDTO> list = myBatis.selectList("import.selectAllProduct", com_id);
		
		return list;
	}
	
	public Import_customerDTO importCustomerSelectOne(int c_id) {
		
		try {
			Import_customerDTO dto = myBatis.selectOne("selectCustomer", c_id);
			System.out.println("고객담당아이디 DTO 가져오기 성공...");
			return dto;
			
		} catch (Exception e) {
			System.out.println("고객담당아이디 DTO 가져오기 실패...");
		}
		return null;
	}
	
	public int importBasicTradeDESC() {
		int id = myBatis.selectOne("import.selectBasicTradeDESC");
		
		return id; 
	}
	
	public List<Import_tradeFileDTO> importTradeFileSelect(int com_id) {
		try {
			List<Import_tradeFileDTO> list = myBatis.selectList("selectAllTradeFile", com_id);
			System.out.println(">>>tradeFIle select 성공....");
			return list;
		} catch (Exception e) {
			System.out.println(">>>tradeFIle select 실패....");
		}
		
		return null;
	}
	
	public List<Import_productDTO> importProductSelectAllPID(int p_id) {
		try {
			List<Import_productDTO> list = myBatis.selectList("selectAllProductPID", p_id);
			System.out.println(">>>제품상세 select 성공....");
			return list;
		} catch (Exception e) {
			System.out.println(">>>제품상세 select 실패....");
		}
		
		return null;
	}

	
	public List<Import_basicTradeDTO> importBasicTradeSelect(int com_id) {
		try {
			List<Import_basicTradeDTO> list = myBatis.selectList("selectAllBasicTrade", com_id);
			System.out.println(">>>basicTrade select 성공....");
			return list;
		} catch (Exception e) {
			System.out.println(">>>basicTrade select 실패....");
		}
		
		return null;

	}
	
	public Import_basicTradeDTO importBasicTradeSelectPK(int id) {
		try {
			Import_basicTradeDTO dto = myBatis.selectOne("selectBasicTrade", id);
			System.out.println(">>>basicTradePK select 성공....");
			return dto;
		} catch (Exception e) {
			System.out.println(">>>basicTradePK select 실패....");
		}
		
		return null;

	}
	
	public Import_productDTO importProductSelectPID(int p_id) {
		try {
			Import_productDTO dto = myBatis.selectOne("selectProductPID", p_id);
			System.out.println(">>>제품상세 개별 select 성공....");
			return dto;
		} catch (Exception e) {
			System.out.println(">>>제품상세 개별 select 실패....");
		}
		
		return null;

	}

	
	public List<Import_orderDetailDTO> importOrderDetailAll(int basic_id) {
		try {
			List<Import_orderDetailDTO> list= myBatis.selectList("selectAllOrderDetail", basic_id);
			System.out.println(">>>오더디테일 가져오기 성공...");
			return list;
			
		} catch (Exception e) {
			System.out.println(">>>오더디테일 가져오기 실패...");
		}
		
		return null;
	}


	
	public void importBasictradeInsert(Import_basicTradeDTO basicTradeDTO) {
		try {
			myBatis.insert("import.insertBasicTrade", basicTradeDTO);
			System.out.println(">>>basicTrade insert 성공");
		} catch (Exception e) {
			System.out.println(">>>basicTrade insert 실패....");
		}
	}
	
	public void importProductInsert(Import_orderDetailDTO orderDetailDTO) {
		System.out.println("상세오더 dto 확인" + orderDetailDTO);
		try {
			myBatis.insert("insertOrderDetail", orderDetailDTO);
			System.out.println(">>>ProductInsert 성공.....");
		} catch (Exception e) {
			System.out.println(">>>ProductInsert 실패.....");
		}
	}
	
	public void importTradeFileInsert(Import_tradeFileDTO tradeFileDTO) {
		try {
			myBatis.insert("insertTradeFile", tradeFileDTO);
			System.out.println(">>>insertTradeFile insert 성공....");
		} catch (Exception e) {
			System.out.println(">>>insertTradeFile insert 실패...." + tradeFileDTO);
		}
	}
	
	public void importOrderShippingInsert(Import_orderShipping dto) {
		try {
			myBatis.insert("insertOrderShipping1", dto);
			System.out.println(">>>insertOrderShipping1 INSERT 성공");
		} catch (Exception e) {
			System.out.println(">>>insertOrderShipping1 INSERT 실패");
		}
	}
	
	
	
}
