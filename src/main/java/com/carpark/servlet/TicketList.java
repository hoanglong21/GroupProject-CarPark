package com.carpark.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.TicketDao;
import com.carpark.model.Ticket;

@WebServlet(urlPatterns = {"/ad/ticketlist"})
public class TicketList extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	TicketDao tdb = new TicketDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int elementPerPage = 6;
		List<Ticket> list = tdb.searchTicket("1/1/1", "licensePlate", "", page, elementPerPage);
		req.setAttribute("page", page);
		req.setAttribute("list", list);
		req.setAttribute("year", "2000");
		req.setAttribute("totalPage", Math.ceil((double)tdb.searchTotalPage("", "licensePlate", "2020/1/1")/elementPerPage));
		req.getRequestDispatcher("ticketList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = req.getParameter("search");
		String by = req.getParameter("by");
		String day = req.getParameter("day");
		String month = req.getParameter("month");
		String year = req.getParameter("year");
		String date = year + "/" + month + "/" + day;
		
		if(search==null) {
			search = "";
		}
		int page = 1;
		int elementPerPage = 6;
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (NumberFormatException e) {
			
		}
		List<Ticket> list = tdb.searchTicket(date, by, search, page, elementPerPage);
		req.setAttribute("search", search);
		req.setAttribute("by", by);
		req.setAttribute("page", page);
		req.setAttribute("list", list);
		req.setAttribute("day", day);
		req.setAttribute("month", month);
		req.setAttribute("year", year);
		req.setAttribute("totalPage", Math.ceil((double)tdb.searchTotalPage(search, by, date)/elementPerPage));
		req.getRequestDispatcher("ticketList.jsp").forward(req, resp);
	}
}
