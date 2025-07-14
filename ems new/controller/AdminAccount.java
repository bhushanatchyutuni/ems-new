package com.ems.controller;

import com.ems.dao.consumerDAO;
import com.ems.model.Consumer;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminAccount")
public class AdminAccount extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("userEmail");
        if (email == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        consumerDAO dao = new consumerDAO();
        Consumer admin = dao.getConsumerByEmail(email);
        if (admin == null) {
            request.setAttribute("errmsg", "Admin details not found.");
            request.getRequestDispatcher("jspPages/error.jsp").forward(request, response);
            return;
        }
        request.setAttribute("admin", admin); // Send entire Consumer object
        RequestDispatcher dispatcher = request.getRequestDispatcher("jspPages/admin-account.jsp");
        dispatcher.forward(request, response);
    }
}
