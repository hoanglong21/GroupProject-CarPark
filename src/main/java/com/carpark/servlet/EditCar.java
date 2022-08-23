package com.carpark.servlet;

import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.CarDao;
import com.carpark.model.Car;

/**
 * Servlet implementation class EditCar
 */
@WebServlet("/ad/EditCar")
public class EditCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	CarDao cdb = new CarDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setAttribute("list", cdb.getAllParLot());
//		request.getRequestDispatcher("addCar.jsp").forward(request, response);
//		String clp = null;s
//		try {
//			 clp = request.getParameter("licensePlate");
//		} catch (Exception e) {
//
//		}
//		
//		Car car = cdb.getCarByLicensePlate(clp);
//		request.setAttribute("car", car);
//		request.getRequestDispatcher("editCar.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ct = request.getParameter("carType");
		String cc = request.getParameter("carColor");
		String com = request.getParameter("company");
		BigInteger park = BigInteger.valueOf(Long.parseLong(request.getParameter("parkId"))) ; 
		String license = request.getParameter("licensePlate");
		cdb.editCar(ct, cc, com, park, license);
		response.sendRedirect("listcar");
	}
	}


