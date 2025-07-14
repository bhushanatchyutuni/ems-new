

package com.ems.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ems.dao.consumerDAO;
import com.ems.model.Consumer;



/**
 * Servlet implementation class Admin_Welcome
 */
@WebServlet("/Admin_Welcome")
public class Admin_Welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_Welcome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	    List<Consumer> customers ;
	    consumerDAO dao=new consumerDAO();
	    customers=dao.adminGetAllCustomers();
	    System.out.println("Unpaid bills: " + customers.size());
	    request.setAttribute("customers", customers);
	    request.getRequestDispatcher("/jspPages/AdminDashBoard.jsp").forward(request, response);
	  }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 List<Consumer> customers ;
		    consumerDAO dao=new consumerDAO();
		    customers=dao.adminGetAllCustomers();
		    System.out.println("Unpaid bills: " + customers.size());
		    request.setAttribute("customers", customers);
		    request.getRequestDispatcher("/jspPages/AdminDashBoard.jsp").forward(request, response);
		  }

	}

