package com.carpark.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.CarDao;
import com.carpark.model.Car;

/**
 * Servlet implementation class LoadCar
 */
@WebServlet("/ad/LoadCar")
public class LoadCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    CarDao cdb = new CarDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String licensePlate = request.getParameter("licensePlate");
		CarDao cdb = new CarDao();
		Car c = cdb.getlicensePlate(licensePlate);
		request.setAttribute("r",c);
		request.getRequestDispatcher("editCar.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
