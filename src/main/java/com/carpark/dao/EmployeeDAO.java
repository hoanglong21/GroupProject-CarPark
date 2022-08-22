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
			+ "account, [password], department, roleId)\r\n" + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
	public final String deleteEmployee = "delete from employee where employeeId = ?";
	public final String getAcc = "select * from employee c where (c.employeeEmail = ? or c.account = ?) and c.password = ?";
	public final String getDept = "SELECT DISTINCT department FROM employee";
	public final String updateEmployee = "update employee set employeeFullName = ?, employeePhone = ?,\r\n"
			+ "  employeeBirthdate = ?, sex = ?, employeeAddress = ?,\r\n"
			+ "  employeeEmail = ?, account = ?, [password] = ?,\r\n"
			+ "  department = ?, roleId = ? where employeeId = ?";
	public final String getEmployee = "select *, roleName from employee e inner join role r on e.roleId = r.roleId where employeeId = ?";
	public final String searchEmployee = "select * from employee where employeeFullName LIKE ?";
	public final String searchDepartment = "select * from employee where department LIKE ?";
	public final String searchAddress = "select * from employee where employeeAddress LIKE ?";
	public final String registerEmployee = "insert into employee (employeeFullName, employeePhone,\r\n"
			+ "employeeBirthdate, sex, employeeAddress, employeeEmail, \r\n"
			+ "account, [password], department, roleId) values (?, ?, ?, ?, ?, ?, ?, ?, 'Training', 1)";
	public final String checkEm = "select * from employee where employeeEmail = ?";
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

	public Employee getAcc(String acc, String password) {
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(getAcc);
			p.setString(1, acc);
			p.setString(2, acc);
			p.setString(3, password);
			ResultSet rs = p.executeQuery();
			if (rs.next()) {
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

	public Employee getE(int employeeId) {
		Employee e = null;
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(getEmployee);
			p.setInt(1, employeeId);
			ResultSet rs = p.executeQuery();
			if (rs.next()) {
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
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return e;
	}

	public void insert(Employee b) {
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(insertEmployee);
			p.setString(1, b.getEmployeeFullName());
			p.setString(2, b.getEmployeePhone());
			p.setString(3, b.getEmployeeBirthdate());
			p.setInt(4, b.getSex());
			p.setString(5, b.getEmployeeAddress());
			p.setString(6, b.getEmployeeEmail());
			p.setString(7, b.getAccount());
			p.setString(8, b.getPassword());
			p.setString(9, b.getDepartment());
			p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void registerEmployee(String fullName, String phone, String birthdate, int sex, String address, String email, String account, String password) {
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(registerEmployee);
			p.setString(1, fullName);
			p.setString(2, phone);
			p.setString(3, birthdate);
			p.setInt(4, sex);
			p.setString(5, address);
			p.setString(6, email);
			p.setString(7, account);
			p.setString(8, password);
			p.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}			
	}
	
	public Employee checkExits(String email) {
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(checkEm);
			p.setString(1, email);
			ResultSet rs = p.executeQuery();
			while(rs.next()) {
				return new Employee(rs.getInt("employeeId"),
						rs.getString("employeeFullName"), rs.getString("account"),
						rs.getString("department"), rs.getString("employeeAddress"), 
						rs.getString("employeeBirthdate"), rs.getString("employeeEmail"),
						rs.getString("employeePhone"), rs.getString("password"), rs.getInt("sex"),
						rs.getInt("roleId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
    }

	public void update(String employeeFullName, String employeePhone, String employeeBirthdate, int sex,
			String employeeAddress, String employeeEmail, String account, String password, String department,
			int roleId, int employeeId) {
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(updateEmployee);
			p.setString(1, employeeFullName);
			p.setString(2, employeePhone);
			p.setString(3, employeeBirthdate);
			p.setInt(4, sex);
			p.setString(5, employeeAddress);
			p.setString(6, employeeEmail);
			p.setString(7, account);
			p.setString(8, password);
			p.setString(9, department);
			p.setInt(10, roleId);
			p.setInt(11, employeeId);
			p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteEmployee(int employeeId) {
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(deleteEmployee);
			p.setInt(1, employeeId);
			p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Employee> getListByPage(ArrayList<Employee> list, int start, int end) {
		ArrayList<Employee> arr = new ArrayList<>();
		for (int i = start; i < end; i++) {
			arr.add(list.get(i));
		}
		return arr;
	}

	public List<Employee> getDepartment() {
		List<Employee> list = new ArrayList<>();
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(getDept);
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				Employee e = new Employee();
				e.setDepartment(rs.getString("department"));
				list.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

	public List<Employee> filterByDepartment(String department) {
		List<Employee> list = new ArrayList<>();
		String sql = "SELECT * FROM employee where 1 = 1";
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			if (department != null && !department.equals("")) {
				sql += " and department = '" + department + "'";
			}
			PreparedStatement p = connection.prepareStatement(sql);
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List<Employee> searchByName(String key) {
		List<Employee> list = new ArrayList<>();
		try (Connection connection = ConnectionDB.getInstance().getConnection()) {
			PreparedStatement p = connection.prepareStatement(searchEmployee);
			p.setString(1, "%" + key + "%");
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
			System.out.println(e);
		}
		return list;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		EmployeeDAO dao = new EmployeeDAO();
		Employee a = dao.getAcc("huong123", "Huong123456");
		System.out.println(a);

	}

}
