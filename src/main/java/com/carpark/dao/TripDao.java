package com.carpark.dao;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.carpark.model.BookingOffice;
import com.carpark.model.Ticket;
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
	
	
	private final String searchTrip = " SELECT tp.*, COUNT(tp.tripId) as bookedTicketNumber FROM  trip tp\r\n"
			+ " LEFT JOIN ticket t ON tp.tripId = t.tripId WHERE tp.departureDate > ? AND destination Like ?  \r\n"
			+ " group by tp.tripId, destination,departureDate, departureTime, driver, carType,bookedTicketNumber,maxiumOnlineTicketNumber\r\n"
			+ " ORDER BY tp.tripId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	
	private final String searchTripTotal = " with t as (\r\n"
			+ " SELECT tp.* FROM  trip tp\r\n"
			+ " LEFT JOIN ticket t ON tp.tripId = t.tripId WHERE tp.departureDate > ? AND destination Like ?  \r\n"
			+ " group by tp.tripId, destination,departureDate, departureTime, driver, carType,bookedTicketNumber,maxiumOnlineTicketNumber)\r\n"
			+ " select count(*) as [Count] from t";
	
	private final String getTripById = "select * from trip\n" 
                                      +"where tripId = ? ";
	
	private final String EditTrip = "update trip\r\n"
			+ "		set destination = ? ,\r\n"
			+ "		    departureTime = ? ,\r\n"
			+ "			driver = ? ,\r\n"
			+ "			carType = ? ,\r\n"
			+ "			maxiumOnlineTicketNumber = ? \r\n"
			+ "			where tripId = ?  ";
	
	
	public List<Trip> searchTrip(String date, String key, int pageNumber, int elementPerPage) {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = 
						connection.prepareStatement(searchTrip)){
			preparedStatement.setString(1, date);
			preparedStatement.setString(2, "%" + key + "%");
			preparedStatement.setInt(3, (pageNumber-1) * elementPerPage);
			preparedStatement.setInt(4, elementPerPage);
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToTripList(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	 public void EditTrip(String destination,String departime,String driver,
             String cartype,String maxtick, int id){
		 
		 try(Connection connection = ConnectionDB.getInstance().getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(EditTrip)){			
				preparedStatement.setString(1, destination);
				preparedStatement.setString(2, departime);
				preparedStatement.setString(3, driver);
				preparedStatement.setString(4, cartype);
				preparedStatement.setString(5, maxtick);
				preparedStatement.setInt(6, id);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	 
	 
	 
	public int searchTotalPage(String key, String date) {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(searchTripTotal)){	
	preparedStatement.setString(1, date);
	preparedStatement.setString(2, "%" + key + "%");
	ResultSet resultSet = preparedStatement.executeQuery();
	while(resultSet.next()) {
		return resultSet.getInt("count");
	}
} catch (SQLException e) {
	e.printStackTrace();
}
return 0;
}
	
	
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
	
	 public Trip getTripByID(BigInteger tid){
	       
			try(Connection connection = ConnectionDB.getInstance().getConnection();
					PreparedStatement preparedStatement = connection.prepareStatement(getTripById)){	
				preparedStatement.setLong(1,tid.longValue());
				ResultSet resultSet = preparedStatement.executeQuery();
				
				 while(resultSet.next()){
					 Trip t = new Trip();
		                t.setTripId(BigInteger.valueOf(resultSet.getLong("tripId")));
		                t.setBookedTicketNumber(Integer.parseInt(resultSet.getString("bookedTicketNumber")));
		                t.setCarType(resultSet.getString("carType"));
		                t.setDepartureDate(resultSet.getString("departureDate"));
		                t.setDepartureTime(resultSet.getString("departureTime"));
		                t.setDestination(resultSet.getString("destination"));
		                t.setDriver(resultSet.getString("driver"));
		                t.setMaxiumOnlineTicketNumber(resultSet.getInt("maxiumOnlineTicketNumber"));
		                return t;
		            }
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
		TripDao td = new TripDao();
		Trip t = new Trip();
		 t = td.getTripByID(BigInteger.valueOf(2));
		System.out.println(t.getCarType());
	}
}
