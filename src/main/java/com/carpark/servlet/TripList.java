package com.carpark.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.TripDao;
import com.carpark.model.Ticket;
import com.carpark.model.Trip;

/**
 * Servlet implementation class TripList
 */
@WebServlet(name = "triplist", urlPatterns = { "/ad/triplist" })
public class TripList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TripDao tdb = new TripDao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		int elementPerPage = 6;
		List<Trip> list = tdb.searchTrip("1/1/1","", page, elementPerPage);
		request.setAttribute("page", page);
		request.setAttribute("listtrip", list);
		request.setAttribute("year", "2000");
		request.setAttribute("totalPage", Math.ceil((double)tdb.searchTotalPage("", "1/01/01")/elementPerPage));
		request.getRequestDispatcher("tripList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String day = request.getParameter("day");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String date = year + "/" + month + "/" + day;
		
		if(search==null) {
			search = "";
		}
		int page = 1;
		int elementPerPage = 6;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			
		}
		List<Trip> list = tdb.searchTrip(date, search, page, elementPerPage);
		request.setAttribute("search", search);
		request.setAttribute("page", page);
		request.setAttribute("listtrip", list);
		request.setAttribute("day", day);
		request.setAttribute("month", month);
		request.setAttribute("year", year);
		request.setAttribute("totalPage", Math.ceil((double)tdb.searchTotalPage(search,date)/elementPerPage));
		request.getRequestDispatcher("tripList.jsp").forward(request, response);
	}

}
