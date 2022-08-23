package com.carpark.servlet;

import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.BookingOfficeDao;
import com.carpark.model.BookingOffice;

@WebServlet(urlPatterns = {"/ad/viewbooking"})
public class ViewBooking extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookingOfficeDao bdb = new BookingOfficeDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BigInteger id = null;
		try {
			id = BigInteger.valueOf(Long.parseLong(req.getParameter("id")));
		} catch (Exception e) {

		}
		
		BookingOffice element = bdb.getBookingOfficeById(id);
		req.setAttribute("element", element);
		req.getRequestDispatcher("viewBooking.jsp").forward(req, resp);
	}
}
