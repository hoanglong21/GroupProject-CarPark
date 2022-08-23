package com.carpark.model;

import java.math.BigInteger;

public class ParkingLotSample {
	private BigInteger parkId;
	private BigInteger parkArea;
	private String parkName;
	private String parkPlace;
	private BigInteger parkPrice;
	private String parkStatus;
	public ParkingLotSample() {
		super();
	}
	public ParkingLotSample(BigInteger parkId, BigInteger parkArea, String parkName, String parkPlace,
			BigInteger parkPrice, String parkStatus) {
		super();
		this.parkId = parkId;
		this.parkArea = parkArea;
		this.parkName = parkName;
		this.parkPlace = parkPlace;
		this.parkPrice = parkPrice;
		this.parkStatus = parkStatus;
	}
	public BigInteger getParkId() {
		return parkId;
	}
	public void setParkId(BigInteger parkId) {
		this.parkId = parkId;
	}
	public BigInteger getParkArea() {
		return parkArea;
	}
	public void setParkArea(BigInteger parkArea) {
		this.parkArea = parkArea;
	}
	public String getParkName() {
		return parkName;
	}
	public void setParkName(String parkName) {
		this.parkName = parkName;
	}
	public String getParkPlace() {
		return parkPlace;
	}
	public void setParkPlace(String parkPlace) {
		this.parkPlace = parkPlace;
	}
	public BigInteger getParkPrice() {
		return parkPrice;
	}
	public void setParkPrice(BigInteger parkPrice) {
		this.parkPrice = parkPrice;
	}
	public String getParkStatus() {
		return parkStatus;
	}
	public void setParkStatus(String parkStatus) {
		this.parkStatus = parkStatus;
	}
	
	
	
}
