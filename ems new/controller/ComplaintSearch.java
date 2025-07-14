package com.ems.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.ems.dao.consumerDAO;
import com.ems.model.Complaint;

@WebServlet("/ComplaintSearch")
public class ComplaintSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
	        throws ServletException, IOException {

	    String complaintId = req.getParameter("complaintId");
	    List<Complaint> complaints = new ArrayList<>();

	    if (complaintId != null && !complaintId.trim().isEmpty()) {
	        consumerDAO dao = new consumerDAO();
	        Complaint complaint = dao.getComplaintById(complaintId);

	        if (complaint != null) {
	            complaints.add(complaint);
	        } else {
	            req.setAttribute("error", "No complaint found with ID: " + complaintId);
	        }
	    } else {
	        req.setAttribute("error", "Please enter a valid Complaint ID.");
	    }

	    req.setAttribute("complaints", complaints);
	    req.getRequestDispatcher("/jspPages/ComplaintHistory.jsp").forward(req, res);
	}
}
