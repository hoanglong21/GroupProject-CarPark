package com.carpark.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.TripDao;
import com.carpark.model.Trip;

/**
 * Servlet implementation class TripList
 */
@WebServlet(name = "triplist", urlPatterns = { "/triplist" })
public class TripList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TripDao tdb = new TripDao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		int elementPerPage = 6;
		List<Trip> list = tdb.getAllTrip();
		//req.setAttribute("page", page);
		request.setAttribute("listtrip", list);
		//req.setAttribute("year", "2000");
		//req.setAttribute("totalPage", Math.ceil((double)tdb.searchTotalPage("", "licensePlate", "2020/1/1")/elementPerPage));
		request.getRequestDispatcher("tripList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
