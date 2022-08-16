package com.carpark.model;

import java.math.BigInteger;

public class Car {
	private String licensePlate;
	private String carColor;
	private String carType;
	private String company;
	private BigInteger parkId;
	
	public Car() {
		super();
	}

	public Car(String licensePlate, String carColor, String carType, String company, BigInteger parkId) {
		super();
		this.licensePlate = licensePlate;
		this.carColor = carColor;
		this.carType = carType;
		this.company = company;
		this.parkId = parkId;
	}

	public String getLicensePlate() {
		return licensePlate;
	}

	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}

	public String getCarColor() {
		return carColor;
	}

	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public BigInteger getParkId() {
		return parkId;
	}

	public void setParkId(BigInteger parkId) {
		this.parkId = parkId;
	}
	
	
}
