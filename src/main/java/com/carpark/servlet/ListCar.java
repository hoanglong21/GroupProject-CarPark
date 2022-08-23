package com.carpark.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.CarDao;
import com.carpark.model.BookingOffice;
import com.carpark.model.Car;
import com.carpark.model.Employee;

/**
 * Servlet implementation class ListCar
 */
@WebServlet(name = "listcar", urlPatterns = { "/ad/listcar" })
public class ListCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    CarDao cdb = new CarDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		CarDao dao = new CarDao();
//		List<Car> list = dao.getAllCar();
//		int page, numperpage=10;
//        int size = list.size();
//        int num=(size%10==0?(size/10):((size/10))+1);
//        String xpage= request.getParameter("page");
//        if(xpage==null){
//            page=1;
//        }else{
//            page=Integer.parseInt(xpage);
//        }
//        int start, end;
//        start=(page-1)*numperpage;
//        end=Math.min(page*numperpage, size);
//        List<Car> list7 = dao.getListByPage((ArrayList<Car>) list, start, end);
//        request.setAttribute("page", page);
//        request.setAttribute("num", num);
//		request.setAttribute("listcar", list);
//		request.setAttribute("listcar", list7);
//		request.getRequestDispatcher("listCar.jsp").forward(request, response);
		int page = 1;
		int elementPerPage = 6;
		List<Car> list = cdb.searchCar("", "name", page, elementPerPage);
		request.setAttribute("search", "");
		request.setAttribute("by", "name");
		request.setAttribute("page", page);
		request.setAttribute("listcar", list);
		request.setAttribute("totalPage", Math.ceil((double)cdb.searchTotal("", "name")/elementPerPage));
		request.getRequestDispatcher("listCar.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String search = request.getParameter("search");
		String by = request.getParameter("by");
		if(search==null) {
			search = "";
		}
		int page = 1;
		int elementPerPage = 6;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			
		}
		List<Car> list = cdb.searchCar(search, by, page, elementPerPage);
		request.setAttribute("search", search);
		request.setAttribute("by", by);
		request.setAttribute("page", page);
		request.setAttribute("listcar", list);
		request.setAttribute("totalPage", Math.ceil((double)cdb.searchTotal(search, by)/elementPerPage));
		request.getRequestDispatcher("listCar.jsp").forward(request, response);
	}

}
