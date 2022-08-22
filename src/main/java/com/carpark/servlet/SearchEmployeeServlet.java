package com.carpark.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.carpark.dao.EmployeeDAO;
import com.carpark.model.Employee;

/**
 * Servlet implementation class SearchEmployeeServlet
 */
@WebServlet("/SearchEmployeeServlet")
public class SearchEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String key = request.getParameter("txt");
        if(key== null){
            key="";
        }
        EmployeeDAO dao = new EmployeeDAO();
        List<Employee> list = dao.searchByName(key);
        int page, numperpage=10;
        int size = list.size();
        int num=(size%10==0?(size/10):((size/10))+1);
        String xpage= request.getParameter("page");
        if(xpage==null){
            page=1;
        }else{
            page=Integer.parseInt(xpage);
        }
        int start, end;
        start=(page-1)*numperpage;
        end=Math.min(page*numperpage, size);
        List<Employee> list3 = dao.getListByPage((ArrayList<Employee>) list, start, end);
        List<Employee> list2 = dao.getDepartment();
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("data", list);
        request.setAttribute("box", key);
        request.setAttribute("data", list3);
        request.setAttribute("list2", list2);
        request.getRequestDispatcher("listEmployee.jsp").forward(request, response);
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String department = request.getParameter("department");
        EmployeeDAO dao = new EmployeeDAO();
        List<Employee> list1 = dao.filterByDepartment(department);
        List<Employee> list2 = dao.getDepartment();
        int page, numperpage=10;
        int size = list1.size();
        int num=(size%10==0?(size/10):((size/10))+1);
        String xpage= request.getParameter("page");
        if(xpage==null){
            page=1;
        }else{
            page=Integer.parseInt(xpage);
        }
        int start, end;
        start=(page-1)*numperpage;
        end=Math.min(page*numperpage, size);
        List<Employee> list3 = dao.getListByPage((ArrayList<Employee>) list1, start, end);
        request.setAttribute("department", department);       
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("data", list3);
        request.setAttribute("list2", list2);
        request.setAttribute("data", list1);
        request.getRequestDispatcher("listEmployee.jsp").forward(request, response);
	}

}
