package com.carpark.dao;

import java.math.BigInteger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import com.carpark.model.ParkingLot;
import com.carpark.util.ConnectionDB;
import com.carpark.util.Mapper;

public class ParkingLotDao {
	private final String PackingLotAll = "SELECT * FROM parkinglot ";

	private final String ParkingLotPagination = "SELECT * FROM dbo.parkinglot "
			+ " WHERE columnName LIKE ?" + " ORDER BY parkId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

	private final String CountPark = "SELECT COUNT(*) AS countpage FROM dbo.parkinglot WHERE columnName LIKE ?";
	private final String removeParkingLot = "DELETE FROM dbo.parkinglot WHERE parkId = ?";

	private final String addParkingLot = "INSERT INTO parkinglot (parkArea,parkName,parkPlace, parkPrice, parkStatus) \r\n"
			+ "						 VALUES (? , ?, ?, ?, ?)";

	private final String EditParkingLot = "update parkinglot\r\n" + "		set parkArea = ? ,\r\n"
			+ "		    parkName = ? ,\r\n" + "			parkPlace = ? ,\r\n" + "			parkPrice= ? ,\r\n"
			+ "			parkStatus = ? \r\n" + "			where parkId = ?  ";

	private final String getParkingLotById = "SELECT * FROM dbo.parkinglot WHERE parkId = ? ";

	private final String searchByName = " SELECT * FROM dbo.parkinglot\r\n"
			+ "		 WHERE parkName LIKE '?' ORDER BY parkId OFFSET 1 ROWS FETCH NEXT 2 ROWS ONLY";

	public List<ParkingLot> getAllParkingLot() {
		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(PackingLotAll)) {
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToParkingLot(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<ParkingLot> ParkingLotPagination(String key, String by, int from, int to) {
		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement(ParkingLotPagination.replace("columnName", by))) {

			preparedStatement.setString(1, "%" + key + "%");
			preparedStatement.setInt(2, from);
			preparedStatement.setInt(3, to);
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToParkingLot(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int CountPark(String key, String by) {
		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement(CountPark.replace("columnName", by))) {
			preparedStatement.setString(1, "%" + key + "%");
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				return resultSet.getInt("countpage");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public void addParkingLot(BigInteger area, String parkingName, String place, BigInteger price) {
		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(addParkingLot)) {
			preparedStatement.setLong(1, area.longValue());
			preparedStatement.setString(2, parkingName);
			preparedStatement.setString(3, place);
			preparedStatement.setLong(4, price.longValue());
			preparedStatement.setInt(5, 0);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void removeParkingLot(BigInteger parkId) {
		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(removeParkingLot)) {
			preparedStatement.setLong(1, parkId.longValue());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// edit
	public void EditParkingLot(int parkArea, String parkName, String parkPlace, int price, BigInteger parkId) {

		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(EditParkingLot)) {
			preparedStatement.setInt(1, parkArea);
			preparedStatement.setString(2, parkName);
			preparedStatement.setString(3, parkPlace);
			preparedStatement.setInt(4, price);
			preparedStatement.setString(5, null);
			preparedStatement.setLong(6, parkId.longValue());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ParkingLot getParkingLotByID(BigInteger tid) {

		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(getParkingLotById)) {
			preparedStatement.setLong(1, tid.longValue());
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				ParkingLot p = new ParkingLot();
				p.setParkingId(BigInteger.valueOf(resultSet.getLong("parkId")));
				p.setArea(BigInteger.valueOf(resultSet.getLong("parkArea")));
				p.setParkingName(resultSet.getString("parkName"));
				p.setPlace(resultSet.getString("parkPlace"));
				p.setPrice(BigInteger.valueOf(resultSet.getLong("parkPrice")));
				p.setParkStatus(resultSet.getString("parkStatus"));
				return p;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}

	public static void main(String[] args) {
		ParkingLotDao dao = new ParkingLotDao();
		dao.addParkingLot(BigInteger.valueOf(123), "abc", "bfv", BigInteger.valueOf(456));
	}

}
