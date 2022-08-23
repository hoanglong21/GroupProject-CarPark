package com.carpark.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.ParkingLotDao;

/**
 * Servlet implementation class EditTrip
 */
@WebServlet(name = "editParkingLot", urlPatterns = { "/ad/editParkingLost" })
public class EditParkingLot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditParkingLot() {
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
        BigInteger id = BigInteger.valueOf(Long.parseLong(request.getParameter("parkid")));
        String name = request.getParameter("parkingName");
        String place = request.getParameter("place");
		int area = Integer.parseInt(request.getParameter("area")); 
        int price = Integer.parseInt(request.getParameter("price"));
       
      ParkingLotDao list = new ParkingLotDao();
      list.EditParkingLot(area, name, place, price,id);
      response.sendRedirect("ParkingLotList");
	}

}
