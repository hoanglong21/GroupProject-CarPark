package com.carpark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carpark.model.Employee;
import com.carpark.util.ConnectionDB;


public class EmployeeDAO {
	public final String getAll = "select * from employee";
	public final String insertEmployee = "insert into employee (employeeFullName, employeePhone, \r\n"
			+ "employeeBirthdate, sex, employeeAddress, employeeEmail, \r\n"
			+ "account, [password], department)\r\n"
			+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	public final String deleteEmployee = "delete from employee where employeeId = ?";
	public final String getAcc = "select * from employee c where c.employeeEmail = ? and c.password = ?";
	
	public List<Employee> getAll() {
		List<Employee> list = new ArrayList<>();
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(getAll);
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				Employee a = new Employee();
				a.setEmployeeId(rs.getInt("employeeId"));
				a.setEmployeeFullName(rs.getString("employeeFullName"));
				a.setAccount(rs.getString("account"));
				a.setDepartment(rs.getString("department"));
				a.setEmployeeAddress(rs.getString("employeeAddress"));
				a.setEmployeeBirthdate(rs.getString("employeeBirthdate"));
				a.setEmployeeEmail(rs.getString("employeeEmail"));
				a.setEmployeePhone(rs.getString("employeePhone"));
				a.setPassword(rs.getString("password"));
				a.setSex(rs.getInt("sex"));
				a.setRoleId(rs.getInt("roleId"));
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Employee getAcc(String employeeEmail, String password) {
		try (Connection connection = ConnectionDB.getInstance().getConnection()){
			PreparedStatement p = connection.prepareStatement(getAcc);
			p.setString(1, employeeEmail);
			p.setString(2, password);		
			ResultSet rs = p.executeQuery();
			if(rs.next()) {
				Employee a = new Employee();
				a.setEmployeeId(rs.getInt("employeeId"));
				a.setEmployeeFullName(rs.getString("employeeFullName"));
				a.setAccount(rs.getString("account"));
				a.setDepartment(rs.getString("department"));
				a.setEmployeeAddress(rs.getString("employeeAddress"));
				a.setEmployeeBirthdate(rs.getString("employeeBirthdate"));
				a.setEmployeeEmail(rs.getString("employeeEmail"));
				a.setEmployeePhone(rs.getString("employeePhone"));
				a.setPassword(rs.getString("password"));
				a.setSex(rs.getInt("sex"));
				a.setRoleId(rs.getInt("roleId"));
				return a;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void insert(Employee b) {
		try(Connection connection = ConnectionDB.getInstance().getConnection()){
			PreparedStatement p = connection.prepareStatement(insertEmployee);
			p.setString(1, deleteEmployee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteEmployee(int employeeId) {
		try(Connection connection  = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(getAll);
			p.setInt(1, employeeId);
			p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EmployeeDAO dao = new EmployeeDAO();
		List list = dao.getAll();
		System.out.println(list.toString());
	}

}
