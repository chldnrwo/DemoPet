package com.trips.domain.payment;

import java.sql.Date;

import lombok.Data;

@Data
public class testDto {
	
	private String id;
	private int boardNumber;
	private int cartId;
	private String addDate; 
	private int price; 
	private int person;
	private String renamedFilename;
	private String title;
	
	/*
	 * private int orderId; public int getOrderId(){return orderId;} public void
	 * setOrderId(int orderId){this.orderId = orderId;}
	 */
	
}
