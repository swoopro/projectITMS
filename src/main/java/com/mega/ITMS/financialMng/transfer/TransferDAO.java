<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
>>>>>>> Stashed changes
package com.mega.ITMS.financialMng.transfer;

public class TransferDAO {

}
<<<<<<< Updated upstream
=======
=======
package com.mega.ITMS.financialMng.transfer;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mega.ITMS.financialMng.request.RequestDTO;

@Repository
public class TransferDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	
	public void insert(TransferDTO transferDTO) {
		myBatis.insert("transfer.payinsert", transferDTO);
	}
	
	public void insertAll(TransferDTO transferDTO) {
		try {
			myBatis.insert("transfer.insertAll", transferDTO);
			System.out.println(">>>ajax for문 insert 성공...");
			System.out.println(transferDTO);
		} catch (Exception e) {
			System.out.println(">>>ajax for문 insert 실패...");
		}
	}


	public TransferDTO selectpayend(TransferDTO transferDTO) {
		transferDTO = myBatis.selectOne("transfer.selectpayend", transferDTO);
		return transferDTO;
	}
	
	public void selectAllTransfer() {
		try {
			
			System.out.println(">>>selectAllTransfer success....");
		} catch (Exception e) {
			System.out.println(">>>selectAllTransfer Fail....");
		}
	}
}
>>>>>>> Stashed changes
>>>>>>> Stashed changes
