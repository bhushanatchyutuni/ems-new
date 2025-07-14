

package com.ems.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ems.dao.consumerDAO;
import com.ems.model.Bill;


/**
 * Servlet implementation class ViewBills
 */
@WebServlet("/ViewBills")
public class ViewBills extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewBills() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String consumerId = (String) request.getSession().getAttribute("id");
		System.out.println("Consumer ID: " + consumerId);

	    List<Bill> unpaidBills ;
	    consumerDAO dao=new consumerDAO();
	    unpaidBills=dao.getUnpaidBills(consumerId);
	    System.out.println("Unpaid bills: " + unpaidBills.size());
	    request.setAttribute("bills", unpaidBills);
	    request.getRequestDispatcher("jspPages/welcome.jsp").forward(request, response);
	  }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}