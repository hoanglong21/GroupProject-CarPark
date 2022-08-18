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
 * Servlet implementation class DeleteTrip
 */
@WebServlet(name = "deletetrip", urlPatterns = { "/ad/deletetrip" })
public class DeleteTrip extends HttpServlet {
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
		String tripid = request.getParameter("tripId");
		tripid = tripid.substring(7);
		Integer tripId = Integer.parseInt(tripid);
		td.removeTrip(tripId);
		response.sendRedirect("triplist");
	}

}
