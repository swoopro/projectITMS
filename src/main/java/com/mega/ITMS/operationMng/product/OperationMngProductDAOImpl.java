package com.mega.ITMS.operationMng.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OperationMngProductDAOImpl implements OperationMngProductDAO{

	@Autowired
	SqlSessionTemplate myBatis;
	
// 제품 테이블(Product Table)	
	
	// insert
	@Override
	public void addProduct(OperationMngProductDTO omPdDTO) {
		myBatis.insert("product.insertPd", omPdDTO);
		
	}
	
	// update
	@Override
	public void editProduct(OperationMngProductDTO omPdDTO) {
		myBatis.insert("product.insertPd2", omPdDTO); // update가 아닌 insert 메서드 사용 : 이력관리를 위해
		
	}
	
	// delete
	@Override
	public void delProduct(OperationMngProductDTO omPdDTO) {
		myBatis.delete("product.deletePd", omPdDTO);
		
	}

	// selectOne
	@Override
	public OperationMngProductDTO getProductRead(OperationMngProductDTO omPdDTO) {
		omPdDTO = myBatis.selectOne("product.selectPd", omPdDTO);
		return omPdDTO;
		
	}

	// selectAll
	@Override
	public List<OperationMngProductDTO> getProductReadAll(Object com_id) {
		List<OperationMngProductDTO> list = myBatis.selectList("product.selectAllPd", com_id);
		return list;
		
	}
	
	// selectAll (Search)
	//	제품 테이블(Product Table) : 검색(productSearch) 제품명 : dropdown == 0
	@Override
	public List<OperationMngProductDTO> getProductReadAllSearchZero(OperationMngProductDTO omPdDTO) {
		List<OperationMngProductDTO> list = myBatis.selectList("product.selectAllPdSearchZero", omPdDTO);
		return list;
		
	}
	
	// selectAll (Search)
	//	제품 테이블(Product Table) : 검색(productSearch) 제품코드 : dropdown == 1
	@Override
	public List<OperationMngProductDTO> getProductReadAllSearchOne(OperationMngProductDTO omPdDTO) {
		List<OperationMngProductDTO> list = myBatis.selectList("product.selectAllPdSearchOne", omPdDTO);
		return list;
		
	}
	
	// selectAll (History)Down
	@Override
	public List<OperationMngProductDTO> getProductReadAllHistory(OperationMngProductDTO omPdDTO) {
		List<OperationMngProductDTO> list = myBatis.selectList("product.selectAllHistory", omPdDTO);
		return list;
		
	}
	// selectAll (HistoryUp)
	@Override
	public List<OperationMngProductDTO> getProductReadAllHistoryUp(OperationMngProductDTO omPdDTO) {
		List<OperationMngProductDTO> list = myBatis.selectList("product.selectAllHistoryUp", omPdDTO);
		return list;
		
	}

}
