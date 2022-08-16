package com.carpark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.carpark.model.Trip;
import com.carpark.util.ConnectionDB;
import com.carpark.util.Mapper;

public class TripDao {
	private final String tripAll = " select tp.tripId,\r\n"
			+ "       destination,\r\n"
			+ "	   departureTime,\r\n"
			+ "	   driver,\r\n"
			+ "	   carType,\r\n"
			+ "	   COUNT(tk.tripId) as bookedTicketNumber\r\n"
			+ "from trip tp inner join ticket tk on tp.tripId = tk.tripId\r\n"
			+ "group by tp.tripId, destination, departureTime, driver, carType ";
	public List<Trip> getAllTrip() {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(tripAll)){			
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToTripList(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		TripDao dao = new TripDao();
		System.out.println(dao.getAllTrip());
	}
}
