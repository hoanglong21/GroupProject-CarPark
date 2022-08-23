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
 * Servlet implementation class DeleteCar
 */
@WebServlet(name = "deletecar", urlPatterns = { "/ad/deletecar" })
public class DeleteCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CarDao cdb = new CarDao();
		String licensePlate = request.getParameter("licensePlate");
		cdb.removeCar(licensePlate);
		response.sendRedirect("listcar");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
	}

}
