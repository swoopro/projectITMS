package com.mega.ITMS.operationMng.price;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("operation/price")
@Controller
public class OperationMngPriceController {

// 페이지 연결 메서드
	@RequestMapping("priceRead")
	public void pricePage() {
		System.out.println("단가 이력 페이지");
	}
	
// CRUD 메서드	
}
