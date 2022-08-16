package com.carpark.model;

import java.math.BigInteger;

public class Trip {
	private BigInteger tripId;
	private int bookedTicketNumber;
	private String carType;
	private String departureDate;
	private String departureTime;
	private String destination;
	private String driver;
	private int maxiumOnlineTicketNumber;
	
	public Trip() {
		super();
	}
	
	public Trip(BigInteger tripId, int bookedTicketNumber, String carType, String departureDate, String departureTime,
			String destination, String driver, int maxiumOnlineTicketNumber) {
		super();
		this.tripId = tripId;
		this.bookedTicketNumber = bookedTicketNumber;
		this.carType = carType;
		this.departureDate = departureDate;
		this.departureTime = departureTime;
		this.destination = destination;
		this.driver = driver;
		this.maxiumOnlineTicketNumber = maxiumOnlineTicketNumber;
	}

	public BigInteger getTripId() {
		return tripId;
	}

	public void setTripId(BigInteger tripId) {
		this.tripId = tripId;
	}

	public int getBookedTicketNumber() {
		return bookedTicketNumber;
	}

	public void setBookedTicketNumber(int bookedTicketNumber) {
		this.bookedTicketNumber = bookedTicketNumber;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public int getMaxiumOnlineTicketNumber() {
		return maxiumOnlineTicketNumber;
	}

	public void setMaxiumOnlineTicketNumber(int maxiumOnlineTicketNumber) {
		this.maxiumOnlineTicketNumber = maxiumOnlineTicketNumber;
	}
}
