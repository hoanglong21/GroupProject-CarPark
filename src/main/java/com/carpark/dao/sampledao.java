package com.carpark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.carpark.util.ConnectionDB;

public class sampledao {
	private final String contentAll = "SELECT * FROM Car";
	
	public void getAllContent() {
		try(Connection connection = ConnectionDB.getInstance().getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(contentAll)){			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				System.out.println(resultSet.getString("licensePlate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		sampledao sp = new sampledao();
		sp.getAllContent();
	}
}
