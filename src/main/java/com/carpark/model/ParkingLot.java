package com.carpark.model;

import java.math.BigInteger;

public class ParkingLot {
	private BigInteger parkingId;
	private String parkingName;
	private String place;
	private BigInteger area;
	private BigInteger price;
	private String parkStatus;
	
	public ParkingLot() {
		super();
	}

	public ParkingLot(BigInteger parkingId, String parkingName, String place, BigInteger area, BigInteger price,
			String parkStatus) {
		super();
		this.parkingId = parkingId;
		this.parkingName = parkingName;
		this.place = place;
		this.area = area;
		this.price = price;
		this.parkStatus = parkStatus;
	}

	public BigInteger getParkingId() {
		return parkingId;
	}

	public void setParkingId(BigInteger parkingId) {
		this.parkingId = parkingId;
	}

	public String getParkingName() {
		return parkingName;
	}

	public void setParkingName(String parkingName) {
		this.parkingName = parkingName;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public BigInteger getArea() {
		return area;
	}

	public void setArea(BigInteger area) {
		this.area = area;
	}

	public BigInteger getPrice() {
		return price;
	}

	public void setPrice(BigInteger price) {
		this.price = price;
	}

	public String getParkStatus() {
		return parkStatus;
	}

	public void setParkStatus(String parkStatus) {
		this.parkStatus = parkStatus;
	}
	
	
	
	
	
	
	
	
}

