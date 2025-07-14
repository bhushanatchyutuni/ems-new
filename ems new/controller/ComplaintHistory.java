

package com.ems.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ems.dao.consumerDAO;
import com.ems.model.Complaint;

/**
 * Servlet implementation class ComplaintHistory
 */
@WebServlet("/ComplaintHistory")
public class ComplaintHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplaintHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
	    String consumerId = (String) session.getAttribute("id");

	    if (consumerId != null) {
	      consumerDAO dao = new consumerDAO();
	      List<Complaint> complaints = dao.getComplaintsByConsumerId(consumerId);
	      req.setAttribute("complaints", complaints);
	      req.getRequestDispatcher("/jspPages/ComplaintHistory.jsp").forward(req, res);
	    } else {
	    	req.setAttribute("msg", "No Complaints Found");
	      res.sendRedirect("/jspPages/ComplaintHistory.jsp");
	    }
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