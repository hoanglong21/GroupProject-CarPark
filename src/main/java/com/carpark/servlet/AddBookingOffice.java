package com.carpark.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.BookingOfficeDao;
import com.carpark.dao.TripDao;
import com.carpark.model.Trip;

@WebServlet(urlPatterns = {"/addbooking"})
public class AddBookingOffice extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookingOfficeDao bdb = new BookingOfficeDao();
	TripDao tdb = new TripDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Trip> list = tdb.getAllTrip();
		req.setAttribute("list", list);
		req.getRequestDispatcher("addBooking.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("officeName");
		BigInteger tripId = BigInteger.valueOf(Long.parseLong(req.getParameter("trip"))) ; 
		String phone = req.getParameter("phone");
		String place = req.getParameter("place");
		BigInteger price = BigInteger.valueOf(Long.parseLong(req.getParameter("price"))) ; 
		String from = req.getParameter("from");
		String to = req.getParameter("to");
		bdb.addBookingOffice(name, phone, place, price, from, to, tripId);
		resp.sendRedirect("bookinglist");
	}
}
