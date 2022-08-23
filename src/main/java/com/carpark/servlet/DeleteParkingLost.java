package com.carpark.servlet;

import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.ParkingLotDao;
import com.carpark.dao.TripDao;

/**
 * Servlet implementation class DeleteTrip
 */
@WebServlet(name = "deleteParkingLot", urlPatterns = { "/ad/deleteParkingLot" })
public class DeleteParkingLost extends HttpServlet {
	private static final long serialVersionUID = 1L;
            ParkingLotDao pkld = new ParkingLotDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String parkId = request.getParameter("parkingId");
		parkId = parkId.substring(7);
		Integer parkID = Integer.parseInt(parkId);
		pkld.removeParkingLot(BigInteger.valueOf(parkID));
		response.sendRedirect("ParkingLotList");
	}

}
