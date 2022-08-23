package com.carpark.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.BookingOfficeDao;
import com.carpark.model.BookingOffice;

@WebServlet(urlPatterns = {"/ad/bookinglist"})
public class BookingOfficeList extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BookingOfficeDao bdb = new BookingOfficeDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int elementPerPage = 6;
		List<BookingOffice> list = bdb.searchBookingOffice("", "name", page, elementPerPage);
		req.setAttribute("search", "");
		req.setAttribute("by", "name");
		req.setAttribute("page", page);
		req.setAttribute("list", list);
		req.setAttribute("totalPage", Math.ceil((double)bdb.searchTotalPage("", "name")/elementPerPage));
		req.getRequestDispatcher("bookingList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search");
		String by = req.getParameter("by");
		if(search==null) {
			search = "";
		}
		int page = 1;
		int elementPerPage = 6;
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (NumberFormatException e) {
			
		}
		List<BookingOffice> list = bdb.searchBookingOffice(search, by, page, elementPerPage);
		req.setAttribute("search", search);
		req.setAttribute("by", by);
		req.setAttribute("page", page);
		req.setAttribute("list", list);
		req.setAttribute("totalPage", Math.ceil((double)bdb.searchTotalPage(search, by)/elementPerPage));
		req.getRequestDispatcher("bookingList.jsp").forward(req, resp);
	}
}
