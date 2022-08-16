package com.carpark.dao;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.carpark.model.Ticket;
import com.carpark.util.ConnectionDB;
import com.carpark.util.Mapper;

public class TicketDao {
	private final String ticketAll = " SELECT tk.*, tp.destination AS tripDestination FROM ticket tk "
			+ " INNER JOIN trip tp ON tk.tripId = tp.tripId";
	private final String addTicket = " INSERT INTO ticket (bookingTime, customerName, licensePlate, tripId) "
			+ " VALUES (?, ?, ?, ?)";
	private final String removeTicket = "DELETE FROM ticket WHERE ticketId = ?";
	private final String searchTicket = " SELECT tk.*, tp.destination AS tripDestination FROM ticket tk "
			+ "	INNER JOIN trip tp ON tk.tripId = tp.tripId "
			+ "	WHERE tp.departureDate > ? AND myColumnName Like ? ORDER BY tk.ticketId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	private final String searchTicketTotal = " SELECT COUNT(*)  AS COUNT FROM ticket tk "
			+ "	INNER JOIN trip tp ON tk.tripId = tp.tripId "
			+ "	WHERE tp.departureDate > ? AND myColumnName Like ? ";
	
	public List<Ticket> getAllTicket() {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ticketAll)){			
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToTicketList(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void addTicket(String time, String customer, String licensePlate, BigInteger tripId) {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(addTicket)){			
			preparedStatement.setString(1, time);
			preparedStatement.setString(2, customer);
			preparedStatement.setString(3, licensePlate);
			preparedStatement.setLong(4, tripId.longValue());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void removeTicket(BigInteger ticketId) {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(removeTicket)){			
			preparedStatement.setLong(1, ticketId.longValue());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Ticket> searchTicket(String date, String by, String key, int pageNumber, int elementPerPage) {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = 
						connection.prepareStatement(searchTicket.replace("myColumnName", by))){
			preparedStatement.setString(1, date);
			preparedStatement.setString(2, "%" + key + "%");
			preparedStatement.setInt(3, (pageNumber-1) * elementPerPage);
			preparedStatement.setInt(4, elementPerPage);
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToTicketList(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int searchTotalPage(String key, String by, String date) {
				try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(searchTicketTotal.replace("myColumnName", by))){	
			preparedStatement.setString(1, date);
			preparedStatement.setString(2, "%" + key + "%");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				return resultSet.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static void main(String[] args) {
		TicketDao tdb = new TicketDao();
//		System.out.println(tdb.getAllTicket());
//		tdb.addTicket("10:00:00", "Long", "82.97.128.59/29", BigInteger.valueOf(1));
//		tdb.removeTicket(BigInteger.valueOf(102));
		
		int page = 1;
		int elementPerPage = 6;
		List<Ticket> list = tdb.searchTicket("2020/1/1", "tp.destination", "%" + "street" + "%", page, elementPerPage);
		System.out.println(list);
	}
}
