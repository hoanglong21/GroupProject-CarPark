package com.carpark.dao;

import java.math.BigInteger;
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
			+ "from trip tp left join ticket tk on tp.tripId = tk.tripId\r\n"
			+ "group by tp.tripId, destination, departureTime, driver, carType ";
	
	private final String addTrip = " INSERT INTO trip (bookedTicketNumber,carType,departureDate, departureTime, destination, driver, maxiumOnlineTicketNumber) \r\n"
			+ "			 VALUES (0, ?, ?, ?, ?, ?, ?)";
	private final String removeTrip = "DELETE FROM trip WHERE tripId = ? ";
	
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
	
	public void addTrip( String cartype, String departureDate, String departureTime, String destination, String driver, String maxticket) {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(addTrip)){			
			preparedStatement.setString(1, cartype);
			preparedStatement.setString(2, departureDate);
			preparedStatement.setString(3, departureTime);
			preparedStatement.setString(4, destination);
			preparedStatement.setString(5, driver);
			preparedStatement.setString(6, maxticket);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void removeTrip(Integer tripId) {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(removeTrip)){			
			preparedStatement.setInt(1, tripId);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		TripDao dao = new TripDao();
		dao.removeTrip(55);
	}
}
