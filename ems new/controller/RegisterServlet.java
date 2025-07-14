
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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		String consumerId = request.getParameter("consumerId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        Consumer consumer = new Consumer(consumerId, name, email, mobile, password);
        consumerDAO dao = new consumerDAO();
        int res = dao.addConsumer(consumer);
        String custId=dao.getUserID(email);
        if (res == -1) {
            request.setAttribute("error", "Email already exists.");
            request.getRequestDispatcher("jspPages/register.jsp").forward(request, response);
        } else {
            request.setAttribute("success", "true");
            request.setAttribute("consumerId", custId);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

	}
