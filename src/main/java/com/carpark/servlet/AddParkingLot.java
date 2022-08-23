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
import com.carpark.model.Trip;

/**
 * Servlet implementation class AddParkingLot
 */
@WebServlet("/ad/AddParkingLot")
public class AddParkingLot extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ParkingLotDao pkldb =new ParkingLotDao();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddParkingLot() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<ParkingLot> list = pkldb.getAllParkingLot();
		req.setAttribute("list2", list);
		req.getRequestDispatcher("addParkingLot.jsp").forward(req, resp);

		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String parkingName = req.getParameter("parkingName");
		String place = req.getParameter("place");
		BigInteger area = BigInteger.valueOf(Long.parseLong(req.getParameter("area")));
		BigInteger price = BigInteger.valueOf(Long.parseLong(req.getParameter("price")));
		pkldb.addParkingLot(area, parkingName, place, price);
		resp.sendRedirect("ParkingLotList");
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BigInteger parkId = BigInteger.valueOf(Long.parseLong(req.getParameter("parkingId")));
		
		resp.sendRedirect("parkingId");
	}

}
