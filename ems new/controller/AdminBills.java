
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

@WebServlet("/AdminBills")
public class AdminBills extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        consumerDAO dao = new consumerDAO();
        List<Bill> bills = dao.getAllBillsDescending();
        request.setAttribute("bills", bills);
        request.getRequestDispatcher("/jspPages/AdminAllBills.jsp").forward(request, response);
    }
}