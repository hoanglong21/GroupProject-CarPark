package com.carpark.servlet;

import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.CarDao;

/**
 * Servlet implementation class AddCar
 */
@WebServlet("/ad/AddCar")
public class AddCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    CarDao cdb = new CarDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("list", cdb.getAllParLot());
		request.getRequestDispatcher("addCar.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String license = request.getParameter("licensePlate");
		String ct = request.getParameter("carType");
		String cc = request.getParameter("carColor");
		String com = request.getParameter("Conpany");
		BigInteger park = BigInteger.valueOf(Long.parseLong(request.getParameter("Parkinglot"))) ; 
		cdb.addCar(license, ct, cc, com, park);
		response.sendRedirect("listcar");
	}
		protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String licensePlate = request.getParameter("liscensePlate");
			cdb.removeCar(licensePlate);
			response.sendRedirect("listcar");	
		
	}
   
}
