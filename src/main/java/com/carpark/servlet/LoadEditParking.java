package com.carpark.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.ParkingLotDao;
import com.carpark.model.ParkingLot;

/**
 * Servlet implementation class LoadEditParking
 */
@WebServlet(name = "loadeditparking", urlPatterns = { "/ad/loadeditparking" })
public class LoadEditParking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ParkingLotDao list = new ParkingLotDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadEditParking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// tu code
		String pid = request.getParameter("pid");
		BigInteger parkid = BigInteger.valueOf(Long.parseLong(pid));
		
		ParkingLot p = list.getParkingLotByID(parkid);
		List<ParkingLot> list1 = list.getAllParkingLot();
		request.setAttribute("list2", list1);
		request.setAttribute("parkingLot", p);
		//bug
		request.getRequestDispatcher("EditParkingLot.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
