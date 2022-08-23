package com.carpark.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.ParkingLotDao;
import com.carpark.model.ParkingLot;

/**
 * Servlet implementation class ParkingLotList
 */
@WebServlet("/ad/ParkingLotList")
public class ParkingLotList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ParkingLotDao pkld = new ParkingLotDao();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParkingLotList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<ParkingLot> list = pkld.ParkingLotPagination("", "parkName", 0, 10);
		req.setAttribute("totalPage", Math.ceil((double)pkld.CountPark("", "parkName")/10));
		req.setAttribute("list", list);
		req.setAttribute("page", 1);
		
		req.getRequestDispatcher("parkingLotList.jsp").forward(req, resp);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int elementPerPage = 10;
		String search = req.getParameter("search");
		String by = req.getParameter("by");
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (NumberFormatException e) {
			
		}
		List<ParkingLot> list = pkld.ParkingLotPagination(search, by, (page-1)*elementPerPage, elementPerPage);
		req.setAttribute("search", search);
		req.setAttribute("by", by);
		req.setAttribute("page", page);
		req.setAttribute("list", list);
		req.setAttribute("totalPage", Math.ceil((double)pkld.CountPark(search, by)/elementPerPage));
		req.getRequestDispatcher("parkingLotList.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
