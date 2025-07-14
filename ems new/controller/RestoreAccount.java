package com.ems.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.ems.dao.consumerDAO;

@WebServlet("/RestoreAccount")
public class RestoreAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RestoreAccount() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("restoreEmail");

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Please enter a valid email to restore your account.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        consumerDAO dao = new consumerDAO();

        // Check if email exists in login table
        boolean exists = dao.doesEmailExist(email);
        if (!exists) {
            request.setAttribute("error", "No account found with the provided email.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        String status = dao.getConsumerStatus(email);
        if ("Active".equalsIgnoreCase(status)) {
            request.setAttribute("error", "Your account is already active. Please login.");
        } else if ("Inactive".equalsIgnoreCase(status)) {
            boolean updated = dao.updateLoginStatus(email, "Active");
            if (updated) {
                request.setAttribute("message", "Your account has been successfully restored. Please login.");
            } else {
                request.setAttribute("error", "Account restoration failed. Please try again.");
            }
        } else {
            request.setAttribute("error", "Unexpected account status.");
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
