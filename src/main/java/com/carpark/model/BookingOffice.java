package com.carpark.model;

import java.math.BigInteger;

public class BookingOffice {
	private BigInteger officeId;
	private String officeName;
	private String officePhone;
	private String officePlace;
	private BigInteger officePrice; 
	private String startContractDeadline;
	private String endContractDeadline;
	private BigInteger tripId;
	// extends
	private String tripDestination;
	
	public BookingOffice() {
		super();
	}

	public BookingOffice(BigInteger officeId, String officeName, String officePhone, String officePlace,
			BigInteger officePrice, String startContractDeadline, String endContractDeadline, BigInteger tripId,
			String tripDestination) {
		super();
		this.officeId = officeId;
		this.officeName = officeName;
		this.officePhone = officePhone;
		this.officePlace = officePlace;
		this.officePrice = officePrice;
		this.startContractDeadline = startContractDeadline;
		this.endContractDeadline = endContractDeadline;
		this.tripId = tripId;
		this.tripDestination = tripDestination;
	}

	public BigInteger getOfficeId() {
		return officeId;
	}

	public void setOfficeId(BigInteger officeId) {
		this.officeId = officeId;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	public String getOfficePhone() {
		return officePhone;
	}

	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	public String getOfficePlace() {
		return officePlace;
	}

	public void setOfficePlace(String officePlace) {
		this.officePlace = officePlace;
	}

	public BigInteger getOfficePrice() {
		return officePrice;
	}

	public void setOfficePrice(BigInteger officePrice) {
		this.officePrice = officePrice;
	}

	public String getStartContractDeadline() {
		return startContractDeadline;
	}

	public void setStartContractDeadline(String startContractDeadline) {
		this.startContractDeadline = startContractDeadline;
	}

	public String getEndContractDeadline() {
		return endContractDeadline;
	}

	public void setEndContractDeadline(String endContractDeadline) {
		this.endContractDeadline = endContractDeadline;
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
