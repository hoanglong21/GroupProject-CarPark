package com.carpark.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.EmployeeDAO;
import com.carpark.model.Employee;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/auth/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.getRequestDispatcher("register.jsp").forward(request, response);
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
		String repass = request.getParameter("repass");
		if(!password.equals(repass)){
            request.setAttribute("error", "Please re-enter correct password");
            request.setAttribute("name", employeeFullName);
            request.setAttribute("phone", employeePhone);
            request.setAttribute("birthdate", employeeBirthdate);
            request.setAttribute("sex", sex);
            request.setAttribute("address", employeeAddress);
            request.setAttribute("email", employeeEmail);
            request.setAttribute("account1", account);
            request.setAttribute("password1", password);
            request.setAttribute("confirm", repass);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }else{
            Employee u = dao.checkExits(employeeEmail);
            if(u==null){
                dao.registerEmployee(employeeFullName, employeePhone, employeeBirthdate, sex, employeeAddress, employeeEmail, account, password);
                response.sendRedirect("LoginServlet");
            }else{
                request.setAttribute("error", "Account existed");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
	}
}
