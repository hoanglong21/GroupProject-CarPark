package com.carpark.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.CarDao;
import com.carpark.dao.TicketDao;
import com.carpark.dao.TripDao;
import com.carpark.model.Car;
import com.carpark.model.Trip;

@WebServlet(urlPatterns = {"/ad/addticket"})
public class AddTicket extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	TicketDao tkdb = new TicketDao();
	TripDao tdb = new TripDao();
	CarDao cdb = new CarDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Trip> list = tdb.getAllTrip();
		List<Car> list2 = cdb.getAllCar();
		req.setAttribute("list", list);
		req.setAttribute("list2", list2);
		req.getRequestDispatcher("addTicket.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String customer = req.getParameter("customer");
		String time = req.getParameter("time");
		BigInteger tripId = BigInteger.valueOf(Long.parseLong(req.getParameter("trip")));
		String license = req.getParameter("license");
		tkdb.addTicket(time, customer, license, tripId);
		resp.sendRedirect("ticketlist");
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BigInteger ticketId = BigInteger.valueOf(Long.parseLong(req.getParameter("ticketId")));
		tkdb.removeTicket(ticketId);
		resp.sendRedirect("ticketlist");
	}
}
