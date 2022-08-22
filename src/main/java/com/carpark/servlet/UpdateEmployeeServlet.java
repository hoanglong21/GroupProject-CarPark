package com.carpark.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.EmployeeDAO;

/**
 * Servlet implementation class UpdateEmployeeServlet
 */
@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String employeeFullName = request.getParameter("employeeFullName");
		String employeePhone = request.getParameter("employeePhone");
		String employeeBirthdate = request.getParameter("employeeBirthdate");
		int sex = Integer.parseInt(request.getParameter("sex"));
		String employeeAddress = request.getParameter("employeeAddress");
		String employeeEmail = request.getParameter("employeeEmail");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String department = request.getParameter("department");
		int roleId = Integer.parseInt(request.getParameter("roleId"));
		int employeeId = Integer.parseInt(request.getParameter("employeeId"));
		EmployeeDAO dao = new EmployeeDAO();
		dao.update(employeeFullName, employeePhone, employeeBirthdate, sex, employeeAddress, employeeEmail, account, password, department, roleId, employeeId);
		response.sendRedirect("ListEmployeeServlet");
	}

}
