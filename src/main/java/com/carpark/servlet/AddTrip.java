package com.carpark.servlet;

import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.TripDao;

/**
 * Servlet implementation class AddTrip
 */
@WebServlet(name = "addtrip", urlPatterns = { "/ad/addtrip" })
public class AddTrip extends HttpServlet {
	private static final long serialVersionUID = 1L;
           TripDao td = new TripDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String des = request.getParameter("destination");
		String departtime = request.getParameter("time");
		String driver = request.getParameter("driver");
		String cartype = request.getParameter("cartype");
		String maxticket = request.getParameter("maxticket");
		String departdate = request.getParameter("date");
		td.addTrip(cartype, departdate, departtime, des, driver, maxticket);
		response.sendRedirect("triplist");
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tripid = Integer.parseInt(request.getParameter("tripId"));
		td.removeTrip(tripid);
		response.sendRedirect("triplist");
	}
}
