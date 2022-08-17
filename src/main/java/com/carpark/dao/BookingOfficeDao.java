package com.carpark.dao;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.carpark.model.BookingOffice;
import com.carpark.util.ConnectionDB;
import com.carpark.util.Mapper;

public class BookingOfficeDao {
	private final String bookingOfficeAll = "  SELECT b.*, t.destination AS tripDestination FROM bookingoffice b "
			+ " INNER JOIN trip t ON b.tripId = t.tripId";
	private final String addBookingOffice = " INSERT INTO bookingoffice (officeName, officePhone, officePlace, officePrice, startContractDeadline, endContractDeadline, tripId) "
			+ " VALUES (?, ?, ?, ?, ?, ?, ?)";
	private final String searchBookingOfficeByName = " SELECT b.*, t.destination AS tripDestination FROM bookingoffice b "
			+ " INNER JOIN trip t ON b.tripId = t.tripId WHERE b.officeName LIKE ? ORDER BY b.officeId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	private final String searchBookingOfficeByTrip = " SELECT b.*, t.destination AS tripDestination FROM bookingoffice b "
			+ " INNER JOIN trip t ON b.tripId = t.tripId WHERE t.destination LIKE ? ORDER BY b.officeId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	private final String searchByNameTotalPage = " SELECT COUNT(*) AS COUNT FROM bookingoffice b "
			+ " INNER JOIN trip t ON b.tripId = t.tripId WHERE b.officeName LIKE ?";
	private final String searchByTripTotalPage = " SELECT COUNT(*) AS COUNT FROM bookingoffice b "
			+ " INNER JOIN trip t ON b.tripId = t.tripId WHERE t.destination LIKE ?";
	private final String bookingOfficeById = "  SELECT b.*, t.destination AS tripDestination FROM bookingoffice b "
			+ " INNER JOIN trip t ON b.tripId = t.tripId WHERE b.officeId = ?";
	
	public List<BookingOffice> getAllBookingOffice() {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(bookingOfficeAll)){			
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToBookingOfficeList(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void addBookingOffice(String name, String phone, String place, BigInteger price, String from, String to, BigInteger tripId) {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(addBookingOffice)){			
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, phone);
			preparedStatement.setString(3, place);
			preparedStatement.setLong(4, price.longValue());
			preparedStatement.setString(5, from);
			preparedStatement.setString(6, to);
			preparedStatement.setLong(7, tripId.longValue());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<BookingOffice> searchBookingOffice(String key, String by, int pageNumber, int elementPerPage) {
		String sql = "";
		if(by.equalsIgnoreCase("name")) {
			sql = searchBookingOfficeByName;
		} else {
			sql = searchBookingOfficeByTrip;
		}
		
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){	
			preparedStatement.setString(1, "%" + key + "%");
			preparedStatement.setInt(2, (pageNumber-1) * elementPerPage);
			preparedStatement.setInt(3, elementPerPage);
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToBookingOfficeList(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int searchTotalPage(String key, String by) {
		String sql = "";
		if(by.equalsIgnoreCase("name")) {
			sql = searchByNameTotalPage;
		} else {
			sql = searchByTripTotalPage;
		}
		
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){	
			preparedStatement.setString(1, "%" + key + "%");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				return resultSet.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public BookingOffice getBookingOfficeById(BigInteger id) {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(bookingOfficeById)){
			preparedStatement.setLong(1, id.longValue());
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToBookingOffice(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		BookingOfficeDao dao = new BookingOfficeDao();
//		System.out.println(dao.getAllBookingOffice());
//		dao.addBookingOffice("hehe", "06456456", "abcAdd", BigInteger.valueOf(454456154), "", "", BigInteger.valueOf(1));
		System.out.println(dao.getBookingOfficeById(BigInteger.valueOf(1)));
	}
}
