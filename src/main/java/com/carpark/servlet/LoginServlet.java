package com.carpark.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.carpark.dao.EmployeeDAO;
import com.carpark.model.Employee;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		EmployeeDAO member = new EmployeeDAO();
		Employee m = member.getAcc(email, password);
		if (m == null) {
            request.setAttribute("msgCommon", "Wrong account or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("email", m);
            session.setAttribute("password", password);
            //Remember - cookies
            Cookie cUser = new Cookie("user", email);
            Cookie cPass = new Cookie("pass", password);
            Cookie cRemember = new Cookie("remember", remember);
            if (remember != null) {
                cUser.setMaxAge(60 * 60 * 24 * 10); 
                cPass.setMaxAge(60 * 60 * 24 * 10); 
                cRemember.setMaxAge(60 * 60 * 24 * 10); 
            } else { 
                cUser.setMaxAge(0);
                cPass.setMaxAge(0);
                cRemember.setMaxAge(0);
            }
            response.addCookie(cUser);
            response.addCookie(cPass);
            response.addCookie(cRemember);
            response.sendRedirect("/CarPark/ListEmployeeServlet");
        }
	}

}
