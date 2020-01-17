package com.mega.ITMS.operationMng.price;

import java.sql.Timestamp;

// 단가 이력 DTO - Join 테이블
public class OperationMngProductJoinDTO {

	// 멤버 변수
	
	// Customer Table - b
	String b_name; // 거래처명
	
	// Product Table - a
	int a_id; // 고유번호
	int a_com_id; // 회사 아이디
	String a_code; // 제품 코드
	String a_name; // 제품명
	String a_spec; // 제품 상세
	int a_price; // 제품 단가
	Timestamp a_date; // 입력일자

	// 기본 생성자
	public OperationMngProductJoinDTO() {
	}

	// 파라메터 생성자
	public OperationMngProductJoinDTO(int a_id, int a_com_id, String a_code, String a_name, String a_spec, int a_price,
			Timestamp a_date, String b_name) {
		super();
		this.a_id = a_id;
		this.a_com_id = a_com_id;
		this.a_code = a_code;
		this.a_name = a_name;
		this.a_spec = a_spec;
		this.a_price = a_price;
		this.a_date = a_date;
		this.b_name = b_name;
	}

	// get/set 메서드
	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public int getA_com_id() {
		return a_com_id;
	}

	public void setA_com_id(int a_com_id) {
		this.a_com_id = a_com_id;
	}

	public String getA_code() {
		return a_code;
	}

	public void setA_code(String a_code) {
		this.a_code = a_code;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_spec() {
		return a_spec;
	}

	public void setA_spec(String a_spec) {
		this.a_spec = a_spec;
	}

	public int getA_price() {
		return a_price;
	}

	public void setA_price(int a_price) {
		this.a_price = a_price;
	}

	public Timestamp getA_date() {
		return a_date;
	}

	public void setA_date(Timestamp a_date) {
		this.a_date = a_date;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	// toString
	@Override
	public String toString() {
		return "OperationMngProductJoinDTO [a_id=" + a_id + ", a_com_id=" + a_com_id + ", a_code=" + a_code
				+ ", a_name=" + a_name + ", a_spec=" + a_spec + ", a_price=" + a_price + ", a_date=" + a_date
				+ ", b_name=" + b_name + "]";
	}

	
}
