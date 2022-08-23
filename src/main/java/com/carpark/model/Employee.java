package com.carpark.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Employee {
    int employeeId;
	String employeeFullName;
	String account;
	String department;
	String employeeAddress;
	String employeeBirthdate;
	String employeeEmail;
	String employeePhone;
	String password;
	int sex;
	int roleId;
	public Employee() {
		super();
	}
	public Employee(int employeeId, String employeeFullName, String account, String department, String employeeAddress,
			String employeeBirthdate, String employeeEmail, String employeePhone, String password, int sex,
			int roleId) {
		super();
		this.employeeId = employeeId;
		this.employeeFullName = employeeFullName;
		this.account = account;
		this.department = department;
		this.employeeAddress = employeeAddress;
		this.employeeBirthdate = employeeBirthdate;
		this.employeeEmail = employeeEmail;
		this.employeePhone = employeePhone;
		this.password = password;
		this.sex = sex;
		this.roleId = roleId;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeFullName() {
		return employeeFullName;
	}
	public void setEmployeeFullName(String employeeFullName) {
		this.employeeFullName = employeeFullName;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getEmployeeAddress() {
		return employeeAddress;
	}
	public void setEmployeeAddress(String employeeAddress) {
		this.employeeAddress = employeeAddress;
	}
	public String getEmployeeBirthdate() {
		return employeeBirthdate;
	}
	public void setEmployeeBirthdate(String employeeBirthdate) {
		this.employeeBirthdate = employeeBirthdate;
	}
	public String getEmployeeEmail() {
		return employeeEmail;
	}
	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}
	public String getEmployeePhone() {
		return employeePhone;
	}
	public void setEmployeePhone(String employeePhone) {
		this.employeePhone = employeePhone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", employeeFullName=" + employeeFullName + ", account=" + account
				+ ", department=" + department + ", employeeAddress=" + employeeAddress + ", employeeBirthdate="
				+ employeeBirthdate + ", employeeEmail=" + employeeEmail + ", employeePhone=" + employeePhone
				+ ", password=" + password + ", sex=" + sex + ", roleId=" + roleId + "]";
	}
	
	public String getDate() throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date a = formatter.parse(employeeBirthdate);
        formatter = new SimpleDateFormat("dd-MM-yyyy");
        return formatter.format(a);
 } 
}
