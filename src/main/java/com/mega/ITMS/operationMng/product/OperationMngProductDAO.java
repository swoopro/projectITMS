package com.mega.ITMS.operationMng.product;

import java.util.List;

public interface OperationMngProductDAO {
	
	// insert
	public void addProduct(OperationMngProductDTO omPdDTO);
	
	// update
	public void editProduct(OperationMngProductDTO omPdDTO);
	
	// delete
	public void delProduct(OperationMngProductDTO omPdDTO);
	
	// selectOne
	public OperationMngProductDTO getProductRead(OperationMngProductDTO omPdDTO);
	
	// selectAll
	public List<OperationMngProductDTO> getProductReadAll(Object com_id);

	// selectAll()
	public List<OperationMngProductDTO> getProductReadAllHistory(OperationMngProductDTO omPdDTO);

	// selectAll() : HistoryUp
	public List<OperationMngProductDTO> getProductReadAllHistoryUp(OperationMngProductDTO omPdDTO);
}
