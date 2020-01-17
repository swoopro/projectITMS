package com.mega.ITMS.financialMng.transfer;

import java.sql.Timestamp;
import java.util.Date;

public class TransferDTO {
	int id;
	int finance_id;
	int action_type;
	int item;
	int amount_usd;
	int amount_krw;
	int amount_hdc;
	Timestamp closed_date;
	String note;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFinance_id() {
		return finance_id;
	}
	public void setFinance_id(int finance_id) {
		this.finance_id = finance_id;
	}
	public int getAction_type() {
		return action_type;
	}
	public void setAction_type(int action_type) {
		this.action_type = action_type;
	}
	public int getItem() {
		return item;
	}
	public void setItem(int item) {
		this.item = item;
	}
	public int getAmount_usd() {
		return amount_usd;
	}
	public void setAmount_usd(int amount_usd) {
		this.amount_usd = amount_usd;
	}
	public int getAmount_krw() {
		return amount_krw;
	}
	public void setAmount_krw(int amount_krw) {
		this.amount_krw = amount_krw;
	}
	public int getAmount_hdc() {
		return amount_hdc;
	}
	public void setAmount_hdc(int amount_hdc) {
		this.amount_hdc = amount_hdc;
	}
	public Timestamp getClosed_date() {
		return closed_date;
	}
	public void setClosed_date(Timestamp closed_date) {
		this.closed_date = closed_date;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	
}
