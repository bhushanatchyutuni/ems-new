
package com.ems.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ems.dao.consumerDAO;
import com.ems.model.Complaint;

/**
 * Servlet implementation class AdminComplaintHistory
 */
@WebServlet("/AdminComplaints")
public class AdminComplaintHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminComplaintHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        consumerDAO dao = new consumerDAO();

        String statusFilter = request.getParameter("statusFilter");
        String markId = request.getParameter("markCleared");

        //  If markCleared parameter is passed, update status
        if (markId != null && !markId.isEmpty()) {
            dao.markComplaintAsCleared(Integer.parseInt(markId));
        }

        List<Complaint> complaints;
        if (statusFilter != null && !statusFilter.isEmpty()) {
            complaints = dao.getComplaintsByStatus(statusFilter);
        } else {
            complaints = dao.getAllComplaints();
        }

        request.setAttribute("complaints", complaints);
        request.getRequestDispatcher("/jspPages/AdminComplaintHistory.jsp").forward(request, response);
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