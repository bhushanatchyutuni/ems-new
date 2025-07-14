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
 * Servlet implementation class MyAccountController
 */
@WebServlet("/MyAccount")
public class MyAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("userEmail");

        if (email == null) {
          response.sendRedirect("index.jsp");
          return;
        }

        consumerDAO dao = new consumerDAO();
        Consumer consumer = dao.getConsumerByEmail(email);
        System.out.println(email);
        request.setAttribute("consumer", consumer);
        System.out.println(consumer);
        request.getRequestDispatcher("/jspPages/MyAccount.jsp").forward(request, response);
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