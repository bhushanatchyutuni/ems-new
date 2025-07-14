package com.ems.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ems.dao.consumerDAO;



/**
 * Servlet implementation class ToggleStatus
 */
@WebServlet("/DeactivateAccount")
public class DeactivateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeactivateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        String email = (String) session.getAttribute("userEmail");

        if (email == null) {
            res.sendRedirect("index.jsp"); // not logged in
            return;
        }

        consumerDAO dao = new consumerDAO();
        boolean updated = dao.updateLoginStatus(email, "Inactive");

        session.invalidate(); // logout the user

        if (updated) {
            req.setAttribute("message-deactivate", " Your account has been deactivated.");
            req.getRequestDispatcher("index.jsp").forward(req, res);
        } else {
            req.setAttribute("error-deactivate", " Failed to deactivate account. Please try again.");
            req.getRequestDispatcher("jspPages/welcome.jsp").forward(req, res);
        }


    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 }

}