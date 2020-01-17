<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
>>>>>>> Stashed changes
package com.mega.ITMS.financialMng.request;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RequestDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	public List<RequestDTO> selectAll() {
		List<RequestDTO> list = myBatis.selectList("request.selectAll");
		return list;
	}
	
	public void update(RequestDTO requestDTO) {
		try {
			myBatis.update("request.pay_check", requestDTO);
			System.out.println(">>>������Ʈ ����...");
		} catch (Exception e) {
			System.out.println(">>>������Ʈ ����...");
		}
	}

}
<<<<<<< Updated upstream
=======
=======
package com.mega.ITMS.financialMng.request;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RequestDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	public List<RequestDTO> selectAll() {
		List<RequestDTO> list = myBatis.selectList("request.selectAll");
		return list;
	}
	
	public void update(RequestDTO requestDTO) {
			myBatis.update("request.pay_check", requestDTO);
	}

}
>>>>>>> Stashed changes
>>>>>>> Stashed changes
