
package com.ems.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ems.dao.consumerDAO;
import com.ems.model.Complaint;


/**
 * Servlet implementation class ComplaintController
 */
@WebServlet("/ComplaintController")
public class ComplaintController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplaintController() {
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
	    String type = request.getParameter("complaintType");
	    String category = request.getParameter("complaintCategory");
	    String text = request.getParameter("complaintText");

	    if (text == null || text.trim().isEmpty()) {
            request.setAttribute("errmessage", " Complaint text cannot be empty!");
            request.getRequestDispatcher("jspPages/ComplaintRegistration.jsp").forward(request, response);
            return;
        }

	    Complaint complaint = new Complaint();
	    complaint.setConsumerId(consumerId);
	    complaint.setType(type);
	    complaint.setCategory(category);
	    complaint.setText(text);

	    consumerDAO dao = new consumerDAO();
	    String complaintId = dao.saveComplaint(complaint);

	    if (complaintId != null) {
	      request.setAttribute("message", " Complaint registered successfully! With Complaint ID : " + complaintId);

	    } else {
	      request.setAttribute("errmessage", " Failed to register complaint. Please try again.");

	    }

	    request.getRequestDispatcher("jspPages/ComplaintRegistration.jsp").forward(request, response);
	  }

}