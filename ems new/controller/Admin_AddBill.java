
package com.ems.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ems.dao.consumerDAO;
import com.ems.model.Bill;
/**
 * Servlet implementation class Admin_AddBill
 */
@WebServlet("/Admin_AddBill")
public class Admin_AddBill extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Admin_AddBill() {
        super();
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("Admin bill add");
        String consumerId = request.getParameter("consumerId");
        System.out.println(consumerId);
        String month = request.getParameter("month");
        String unitStr = request.getParameter("units");

        String billDate = request.getParameter("billDate");

        String message = "";

        try {
        	System.out.println("Admin bill add try");
            int units = Integer.parseInt(unitStr);


            Bill bill = new Bill();
            bill.setConsumerId(consumerId);
            bill.setMonth(month);
            bill.setUnits(units);

            bill.setBillDate(billDate);
            bill.setStatus("Unpaid");

            consumerDAO dao = new consumerDAO();
            boolean added = dao.insertBill(bill);
            System.out.println(added);
            if (added) {
                message = " Bill added successfully for Consumer ID: " + consumerId;
                request.setAttribute("msg", message);
            } else {
                request.setAttribute("errmsg", " Failed to add bill.");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errmsg", " Invalid number format for units or amount.");
        } catch (Exception e) {
            request.setAttribute("errmsg", " Error occurred: " + e.getMessage());
        }

        request.getRequestDispatcher("jspPages/AddBill.jsp").forward(request, response);
    }
}