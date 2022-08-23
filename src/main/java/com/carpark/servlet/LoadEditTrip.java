package com.carpark.servlet;

import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.TripDao;
import com.carpark.model.Trip;


/**
 * Servlet implementation class LoadEditTrip
 */
@WebServlet(name = "loadedit", urlPatterns = { "/ad/loadedit" })
public class LoadEditTrip extends HttpServlet {
	private static final long serialVersionUID = 1L;
	              TripDao list = new TripDao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tid = request.getParameter("tid");
		BigInteger tripid = BigInteger.valueOf(Long.parseLong(tid));
        
        Trip t = list.getTripByID(tripid);
        request.setAttribute("trip", t);
        request.getRequestDispatcher("EditTrip.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
