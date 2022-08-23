package com.carpark.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.EmployeeDAO;
import com.carpark.model.Employee;

/**
 * Servlet implementation class AddEmployeeServlet
 */
@WebServlet("/hr/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		EmployeeDAO dao = new EmployeeDAO();
		String employeeFullName = request.getParameter("employeeFullName");
		String employeePhone = request.getParameter("employeePhone");
		String employeeBirthdate = request.getParameter("employeeBirthdate");
		int sex = Integer.parseInt(request.getParameter("sex"));
		String employeeAddress = request.getParameter("employeeAddress");
		String employeeEmail = request.getParameter("employeeEmail");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String department = request.getParameter("department");
		Employee e = new Employee();
		e.setEmployeeFullName(employeeFullName);
		e.setEmployeePhone(employeePhone);
		e.setEmployeeBirthdate(employeeBirthdate);
		e.setSex(sex);
		e.setEmployeeAddress(employeeAddress);
		e.setEmployeeEmail(employeeEmail);
		e.setAccount(account);
		e.setPassword(password);
		e.setDepartment(department);
		dao.insert(e);
		response.sendRedirect("ListEmployeeServlet");
	}

}
