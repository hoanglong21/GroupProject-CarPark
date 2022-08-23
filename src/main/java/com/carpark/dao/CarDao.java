package com.carpark.dao;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.model.BookingOffice;
import com.carpark.model.Car;
import com.carpark.model.Employee;
import com.carpark.model.ParkingLotSample;
import com.carpark.util.ConnectionDB;
import com.carpark.util.Mapper;

public class CarDao {
	public final String getAllCar = " SELECT * FROM car ";
	public final String addCar = "insert into car(licensePlate, carColor, carType, company, parkId)\r\n"
			+ " values (?,?,?,?,?)";
	public final String removeCar = "delete from car where licensePlate = ?";
	public final String removeTicket = " DELETE FROM ticket WHERE licensePlate = ?";
	public final String getlicensePlate = "select * from car\n" + "where licensePlate = ? ";
	public final String editCar = "update car set carType = ? , carColor = ? , company = ? , parkId = ? where licenseplate = ?";
	public final String getCarByLicensePlate = "select *  from car where licensePlate = ?";
	public final String EditTrip = "update car\r\n" + " set 	licensePlate = ? ,\r\n" + "			carType = ?,\r\n"
			+ "			carColor = ?, \r\n" + "			company = ?, \r\n" + "			parkId = ?, \r\n";
	public final String getAllParking = "  SELECT * FROM parkinglot";
	public final String searchCarByCompany = "SELECT * FROM car c WHERE c.company LIKE ? \r\n"
			+ "  ORDER BY c.licensePlate OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	public final String searchCarByType = "SELECT * FROM car c WHERE c.carType LIKE ? \r\n"
			+ "  ORDER BY c.licensePlate OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	public final String searchCarCompanyAllPage = "SELECT COUNT(*) AS COUNT FROM car\r\n"
			+ "  WHERE company LIKE ?";
	public final String searchCarTypeAllPage = "SELECT COUNT(*) AS COUNT FROM car\r\n"
			+ "  WHERE carType LIKE ?";
	public List<Car> getAllCar() {
		List<Car> list = new ArrayList<>();
		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement p = connection.prepareStatement(getAllCar)) {
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				Car c = new Car();
				c.setLicensePlate(rs.getString("licensePlate"));
				c.setCarColor(rs.getString("carColor"));
				c.setCarType(rs.getString("carType"));
				c.setCompany(rs.getString("company"));
				c.setParkId(BigInteger.valueOf(rs.getLong("parkId")));
				list.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

	public void addCar(String licensePlate, String carType, String carColor, String company, BigInteger parkingLot) {
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(addCar);
			p.setString(1, licensePlate);
			p.setString(2, carType);
			p.setString(3, carColor);
			p.setString(4, company);
			p.setLong(5, parkingLot.longValue());
			p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Car getCarByLicensePlate(String clp) {
		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(getCarByLicensePlate)) {
			preparedStatement.setString(1, clp.toString());
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Car c = new Car();
				c.setLicensePlate(String.valueOf(resultSet.getString("liscensePlate")));
				c.setCarType(String.valueOf(resultSet.getString("carType")));
				c.setCarColor((resultSet.getString("carColor")));
				c.setCompany(String.valueOf(resultSet.getString("company")));
				c.setParkId(BigInteger.valueOf(resultSet.getLong("parkingLot")));

				return c;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public Car getlicensePlate(String licensePlate) {
		Car c  = null;
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(getlicensePlate);
			p.setString(1,licensePlate);
			ResultSet rs = p.executeQuery();
			if(rs.next()) {
				Car a = new Car();
				a.setLicensePlate(rs.getString("licensePlate"));
				a.setCarType(rs.getString("carType"));
				a.setCarColor((rs.getString("carColor")));
				a.setCompany(rs.getString("company"));
				a.setParkId(BigInteger.valueOf(rs.getLong("parkId")));
				return a;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return c;
	}
	
	public List<Car> searchCar(String key, String by, int pageNumber, int elementPerPage) {
		String sql = "";
		if(by.equalsIgnoreCase("company")) {
			sql = searchCarByCompany;
		} else {
			sql = searchCarByType;
		}
		
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(sql)){	
			preparedStatement.setString(1, "%" + key + "%");
			preparedStatement.setInt(2, (pageNumber-1) * elementPerPage);
			preparedStatement.setInt(3, elementPerPage);
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToCarList(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int searchTotal(String key, String by) {
		String sql = "";
		if(by.equalsIgnoreCase("name")) {
			sql = searchCarCompanyAllPage;
		} else {
			sql = searchCarTypeAllPage;
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
	
	public List<ParkingLotSample> getAllParLot() {
		List<ParkingLotSample> list = new ArrayList<>();
		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement p = connection.prepareStatement(getAllParking)) {
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				ParkingLotSample c = new ParkingLotSample();
				c.setParkId(BigInteger.valueOf(rs.getLong("parkId")));
				c.setParkArea(BigInteger.valueOf(rs.getLong("parkArea")));
				c.setParkPrice(BigInteger.valueOf(rs.getLong("parkPrice")));
				c.setParkName(rs.getString("parkName"));
				c.setParkPlace(rs.getString("parkPlace"));
				c.setParkStatus(rs.getString("parkStatus"));
				list.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void removeCar(String licensePlate) {
		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement p = connection.prepareStatement(removeTicket);
				PreparedStatement p2 = connection.prepareStatement(removeCar)) {
			p.setString(1, licensePlate);
			p.executeUpdate();
			p2.setString(1, licensePlate);
			p2.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void editCar(String carType, String carColor, String company, BigInteger parkId, String licensePlate) {
		try (Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement p = connection.prepareStatement(editCar)) {
			PreparedStatement preparedStatement = connection.prepareStatement(editCar);
			preparedStatement.setString(1, carType);
			preparedStatement.setString(2, carColor);
			preparedStatement.setString(3, company);
			preparedStatement.setLong(4, parkId.longValue());
			preparedStatement.setString(5, licensePlate);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Car> getListByPage(ArrayList<Car> list, int start, int end) {
		ArrayList<Car> arr = new ArrayList<>();
		for (int i = start; i < end; i++) {
			arr.add(list.get(i));
		}
		return arr;
	}

	public static void main(String[] args) {
		CarDao cdb = new CarDao();
		Car car = new Car();
//		cdb.addCar("1111.1111332", "red", "audi", "pro", BigInteger.valueOf(77));
		//cdb.removeCar("87.85.233.203/18");
		cdb.getlicensePlate("107.71.3.210/14");
		
	}
}
