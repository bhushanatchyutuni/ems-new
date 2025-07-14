package com.ems.model;

public class Complaint {
	  private int compliantId;
	  private String compliantDate;
	  private String consumerId;
	  private String type;
	  private String category;
	  private String text;
	  private String status;


public Complaint(int compliantId, String compliantDate, String consumerId, String type, String category,
			String text, String status) {

		this.compliantId = compliantId;
		this.compliantDate = compliantDate;
		this.consumerId = consumerId;
		this.type = type;
		this.category = category;
		this.text = text;
		this.status = status;
	}
public Complaint(String consumerId, String type, String category, String text) {
		this.consumerId = consumerId;
		this.type = type;
		this.category = category;
		this.text = text;
	}
	public Complaint() {

}


	  public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCompliantId() {
		return compliantId;
	}
	public void setCompliantId(int compliantId) {
		this.compliantId = compliantId;
	}
	public String getCompliantDate() {
		return compliantDate;
	}
	public void setCompliantDate(String compliantDate) {
		this.compliantDate = compliantDate;
	}
	public String getConsumerId() {
		return consumerId;
	}
	public void setConsumerId(String consumerId) {
		this.consumerId = consumerId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
}
