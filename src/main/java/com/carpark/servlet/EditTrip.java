package com.carpark.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.TripDao;

/**
 * Servlet implementation class EditTrip
 */
@WebServlet(name = "edittrip", urlPatterns = { "/ad/edittrip" })
public class EditTrip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTrip() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String des = request.getParameter("destination");
        String time = request.getParameter("time");
        String drive = request.getParameter("driver");
        String cartype = request.getParameter("cartype");
        String maxticket = request.getParameter("maxticket");
        String date = request.getParameter("date");
        int id = Integer.parseInt(request.getParameter("tripId"));
      TripDao list = new TripDao();
      list.EditTrip(des, time, drive, cartype, maxticket, id);
      response.sendRedirect("triplist");
	}

}
