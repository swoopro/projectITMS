package com.mega.ITMS.operationMng.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.executor.ReuseExecutor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OperationMngCustomerDAOImpl implements OperationMngCustomerDAO{

	@Autowired
	SqlSessionTemplate myBatis;

// 거래처 테이블(Business Table)	
	
	// insert
	@Override
	public void addBusiness(OperationMngBusinessDTO omBnDTO) {
		myBatis.insert("customer.insertBn", omBnDTO);
		
	}
	
	// update
	@Override
	public void editBusiness(OperationMngBusinessDTO omBnDTO) {
		myBatis.update("customer.updateBn", omBnDTO);
		
	}

	// delete
	@Override
	public void delBusiness(OperationMngBusinessDTO omBnDTO) {
		myBatis.delete("customer.deleteBn", omBnDTO);
		
	}

	// selectOne
	@Override
	public OperationMngBusinessDTO getBusinessRead(OperationMngBusinessDTO omBnDTO) {
//		System.out.println("DAO ID");
//		System.out.println(omBnDTO.getId());
//		System.out.println(omBnDTO.getCom_id());
		omBnDTO = myBatis.selectOne("customer.selectBn", omBnDTO);
//		System.out.println(omBnDTO.getCeo());
		return omBnDTO;
	}
	 
	//selectAll
	@Override
	public List<OperationMngBusinessDTO> getBusinessReadAll(Object com_id) {
		List<OperationMngBusinessDTO> list = myBatis.selectList("customer.selectAllBn", com_id);
		return list;
	}

// 담당자 테이블(Customer Table)	
	
	// insert
	@Override
	public void addCustomer(OperationMngCustomerDTO omCsDTO) {
		myBatis.insert("customer.insertCs", omCsDTO);
		
	}
	
	// update
	@Override
	public void editCustomer(OperationMngCustomerDTO omCsDTO) {
		myBatis.update("customer.updateCs", omCsDTO);
		
	}

	// delete
	@Override
	public void delCustomer(OperationMngCustomerDTO omCsDTO) {
		myBatis.delete("customer.deleteCs", omCsDTO);
		
	}

	// selectOne
	@Override
	public OperationMngCustomerDTO getCustomerRead(OperationMngCustomerDTO omCsDTO) {
		omCsDTO = myBatis.selectOne("customer.selectCs", omCsDTO);
		return omCsDTO;
	}

	@Override
	public void getCustomerReadAll() {
		// TODO Auto-generated method stub
		
	}

//	담당자 & 거래처 조인 테이블(Customer & Business Table)
	
	public List<OperationMngCustomerJoinDTO> getCustomerBusinessReadAll(Object com_id) {
		System.out.println("-----------------------------------------------");
		/*System.out.println(a_com_id);*/
		System.out.println("-----------------------------------------------");
		List<OperationMngCustomerJoinDTO> list = myBatis.selectList("customer.selectAllCsJoin", com_id);
		return list;
	}
	
//	담당자 & 거래처 조인 테이블(Customer & Business Table) : 검색(searchBnCs) 담당자명 : dropdown == 0
	
	public List<OperationMngCustomerJoinDTO> getCustomerBusinessReadAllSearchZero(OperationMngCustomerJoinDTO omCsJoinDTO) {
		List<OperationMngCustomerJoinDTO> list = myBatis.selectList("customer.selectAllSearchBnCsZero", omCsJoinDTO);
		return list;
	}
	
//	담당자 & 거래처 조인 테이블(Customer & Business Table) : 검색(searchBnCs) 거래처명 : dropdown == 1
	
	public List<OperationMngCustomerJoinDTO> getCustomerBusinessReadAllSearchOne(OperationMngCustomerJoinDTO omCsJoinDTO) {
		List<OperationMngCustomerJoinDTO> list = myBatis.selectList("customer.selectAllSearchBnCsOne", omCsJoinDTO);
		return list;
	}
	
}
