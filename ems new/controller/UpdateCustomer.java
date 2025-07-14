

package com.ems.controller;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ems.dao.consumerDAO;
import com.ems.model.Consumer;



/**
 * Servlet implementation class UpdateCustomer
 */
@WebServlet("/UpdateCustomer")
public class UpdateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String consumerId = request.getParameter("consumerId");
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String mobile = request.getParameter("mobile");
	    String status = request.getParameter("status");

	    Consumer consumer = new Consumer(consumerId, name, email, mobile, status);
	    consumerDAO dao = new consumerDAO();

	    System.out.println(" Starting Update Process...");

	    if (dao.isCustomerInfoSame(consumer)) {
	        System.out.println(" No changes detected.");
	        request.setAttribute("message1", " No changes detected in customer details.");
	    } else {
	        boolean infoUpdated = dao.updateCustomerInfoOnly(consumer);
	        if (infoUpdated) {
	            System.out.println(" Info updated.");
	            request.setAttribute("message", " Customer details updated successfully.");
	        } else {
	            System.out.println(" Update failed.");
	            request.setAttribute("error", " Failed to update customer details.");
	        }
	    }

	    request.setAttribute("consumer", consumer);
	    request.getRequestDispatcher("jspPages/MyAccount.jsp").forward(request, response);
	}

}