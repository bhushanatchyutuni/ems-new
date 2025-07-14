
package com.ems.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ems.dao.consumerDAO;





@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    PrintWriter pw = response.getWriter();
	    HttpSession session = request.getSession(true);

	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    consumerDAO dao = new consumerDAO();
	    boolean isValid = dao.validationCheck(email, password);

	    if (isValid) {
	        String status = dao.getConsumerStatus(email);
	        String userType = dao.getUserType(email);  //  New method for role

	        if ("Inactive".equalsIgnoreCase(status)) {
	            request.setAttribute("error", " Your account is deactivated. Please restore your account to continue.");
	            request.getRequestDispatcher("index.jsp").forward(request, response);
	        } else {
	            session.setAttribute("userEmail", email);
	            session.setAttribute("userName", dao.getConsumerName(email));
	            session.setAttribute("id", dao.getConsumerID(email));
	            System.out.println(email);

	            //  Redirect based on role
	            if ("Admin".equalsIgnoreCase(userType)) {
	            	 session.setAttribute("userEmail", email);
	 	            session.setAttribute("userName", dao.getConsumerName(email));
	 	            session.setAttribute("id", dao.getConsumerID(email));
	 	           response.sendRedirect(request.getContextPath() + "/Admin_Welcome");
	            } else {
	                response.sendRedirect(request.getContextPath() + "/jspPages/home.jsp");
	            }
	        }

	    } else {
	        request.setAttribute("error", " Invalid email or password.");
	        request.getRequestDispatcher("index.jsp").forward(request, response);
	    }
	}

}