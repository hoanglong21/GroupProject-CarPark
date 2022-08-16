package com.carpark.util;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.model.BookingOffice;
import com.carpark.model.Car;
import com.carpark.model.Ticket;
import com.carpark.model.Trip;

public class Mapper {
	private Mapper() {

	}
	
	public static List<BookingOffice> mapToBookingOfficeList(ResultSet resultSet) throws SQLException {
		List<BookingOffice> list = new ArrayList<>();
		if (resultSet != null) {
			while (resultSet.next()) {
				BigInteger officeId = BigInteger.valueOf(resultSet.getLong("officeId"));
				String officeName = resultSet.getString("officeName");
				String officePhone = resultSet.getString("officePhone");
				String officePlace = resultSet.getString("officePlace");
				BigInteger officePrice = BigInteger.valueOf(resultSet.getLong("officePrice"));
				String startContractDeadline = resultSet.getString("startContractDeadline");
				String endContractDeadline = resultSet.getString("endContractDeadline");
				BigInteger tripId = BigInteger.valueOf(resultSet.getLong("tripId"));
				String tripDestination = resultSet.getString("tripDestination");

				list.add(new BookingOffice(officeId, officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId, tripDestination));
			}
		}
		return list;
	}
	
	public static BookingOffice mapToBookingOffice(ResultSet resultSet) throws SQLException {
		if (resultSet != null) {
			while (resultSet.next()) {
				BigInteger officeId = BigInteger.valueOf(resultSet.getLong("officeId"));
				String officeName = resultSet.getString("officeName");
				String officePhone = resultSet.getString("officePhone");
				String officePlace = resultSet.getString("officePlace");
				BigInteger officePrice = BigInteger.valueOf(resultSet.getLong("officePrice"));
				String startContractDeadline = resultSet.getString("startContractDeadline");
				String endContractDeadline = resultSet.getString("endContractDeadline");
				BigInteger tripId = BigInteger.valueOf(resultSet.getLong("tripId"));
				String tripDestination = resultSet.getString("tripDestination");

				return new BookingOffice(officeId, officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId, tripDestination);
			}
		}
		return null;
	}
	
	public static List<Trip> mapToTripList(ResultSet resultSet) throws SQLException {
		List<Trip> list = new ArrayList<>();
		if (resultSet != null) {
			while (resultSet.next()) {
				BigInteger tripId = BigInteger.valueOf(resultSet.getLong("tripId"));
				int bookedTicketNumber = resultSet.getInt("bookedTicketNumber");
				String carType = resultSet.getString("carType");
				String departureDate = resultSet.getString("departureDate");
				String departureTime = resultSet.getString("departureTime");
				String destination = resultSet.getString("destination");
				String driver = resultSet.getString("driver");
				int maxiumOnlineTicketNumber = resultSet.getInt("maxiumOnlineTicketNumber");
				
				list.add(new Trip(tripId, bookedTicketNumber, carType, departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber));
			}
		}
		return list;
	}
	
	public static List<Car> mapToCarList(ResultSet resultSet) throws SQLException {
		List<Car> list = new ArrayList<>();
		if (resultSet != null) {
			while (resultSet.next()) {
				String licensePlate = resultSet.getString("licensePlate");
				String carColor = resultSet.getString("carColor");
				String carType = resultSet.getString("carType");
				String company = resultSet.getString("company");
				BigInteger parkId = BigInteger.valueOf(resultSet.getLong("parkId"));
				
				list.add(new Car(licensePlate, carColor, carType, company, parkId));
			}
		}
		return list;
	}
	
	public static List<Ticket> mapToTicketList(ResultSet resultSet) throws SQLException {
		List<Ticket> list = new ArrayList<>();
		if (resultSet != null) {
			while (resultSet.next()) {
				BigInteger ticketId = BigInteger.valueOf(resultSet.getLong("ticketId"));
				String bookingTime = resultSet.getString("bookingTime");
				String customerName = resultSet.getString("customerName");
				String licensePlate = resultSet.getString("licensePlate");
				BigInteger tripId = BigInteger.valueOf(resultSet.getLong("tripId"));
				String tripDestination = resultSet.getString("tripDestination");
				
				
				list.add(new Ticket(ticketId, bookingTime, customerName, licensePlate, tripId, tripDestination));
			}
		}
		return list;
	}
}
