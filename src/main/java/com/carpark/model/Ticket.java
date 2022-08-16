package com.carpark.model;

import java.math.BigInteger;

public class Ticket {
	private BigInteger ticketId;
	private String bookingTime;
	private String customerName;
	private String licensePlate;
	private BigInteger tripId;
	// Extends
	private String tripDestination;
	
	public Ticket() {
		super();
	}
	
	public Ticket(BigInteger ticketId, String bookingTime, String customerName, String licensePlate, BigInteger tripId,
			String tripDestination) {
		super();
		this.ticketId = ticketId;
		this.bookingTime = bookingTime;
		this.customerName = customerName;
		this.licensePlate = licensePlate;
		this.tripId = tripId;
		this.tripDestination = tripDestination;
	}

	public BigInteger getTicketId() {
		return ticketId;
	}

	public void setTicketId(BigInteger ticketId) {
		this.ticketId = ticketId;
	}

	public String getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getLicensePlate() {
		return licensePlate;
	}

	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}

	public BigInteger getTripId() {
		return tripId;
	}

	public void setTripId(BigInteger tripId) {
		this.tripId = tripId;
	}

	public String getTripDestination() {
		return tripDestination;
	}

	public void setTripDestination(String tripDestination) {
		this.tripDestination = tripDestination;
	}
}
