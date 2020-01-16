package com.mega.ITMS.operationMng.customer;

import java.util.List;

public interface OperationMngCustomerDAO {

// 거래처 테이블(Business Table)
	
	// insert
	public void addBusiness(OperationMngBusinessDTO omBnDTO);
	
	// update
	public void editBusiness(OperationMngBusinessDTO omBnDTO);
	
	// delete
	public void delBusiness(OperationMngBusinessDTO omBnDTO);
	
	// selectOne
	public OperationMngBusinessDTO getBusinessRead(OperationMngBusinessDTO omBnDTO);
	
	// selectAll
	public List<OperationMngBusinessDTO> getBusinessReadAll(Object com_id);
	

// 담당자 테이블(Customer Table)
	
	// insert
	public void addCustomer(OperationMngCustomerDTO omCsDTO);
	
	// update
	public void editCustomer(OperationMngCustomerDTO omCsDTO);
	
	// delete
	public void delCustomer(OperationMngCustomerDTO omCsDTO);
	
	// selectOne
	public OperationMngCustomerDTO getCustomerRead(OperationMngCustomerDTO omCsDTO);
	
	// selectAll
	public void getCustomerReadAll();

	
}
