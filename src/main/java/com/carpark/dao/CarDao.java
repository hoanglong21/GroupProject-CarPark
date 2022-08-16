package com.carpark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.carpark.model.Car;
import com.carpark.util.ConnectionDB;
import com.carpark.util.Mapper;

public class CarDao {
	private final String carAll = " SELECT * FROM car ";
	public List<Car> getAllCar() {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(carAll)){			
			ResultSet resultSet = preparedStatement.executeQuery();
			return Mapper.mapToCarList(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		CarDao cdb = new CarDao();
		System.out.println(cdb.getAllCar());
	}
}
