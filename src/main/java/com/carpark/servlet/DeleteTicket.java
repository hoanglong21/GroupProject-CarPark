package com.carpark.servlet;

import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.TicketDao;

@WebServlet(urlPatterns = {"/deleteticket"})
public class DeleteTicket extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	TicketDao tkdb = new TicketDao();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ticket = req.getParameter("ticketId");
		ticket = ticket.substring(7);
		BigInteger ticketId = BigInteger.valueOf(Long.parseLong(ticket));
		tkdb.removeTicket(ticketId);
		resp.sendRedirect("ticketlist");
	}
}
