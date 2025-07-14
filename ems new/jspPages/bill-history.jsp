<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
 %>
<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Bill" %>
<%@ include file="/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bill History</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome-style.css">
</head>
<body>

<div class="content-area">
<h2>Welcome to Your Dashboard</h2>
  <h3 style="text-align:center;">Your Bill History</h3>

  <%
    List<Bill> bills = (List<Bill>) request.getAttribute("bills");
    if (bills != null && !bills.isEmpty()) {
  %>
    <div style="display: flex; justify-content: center;">
      <table class="styled-table" style="width: 70%;">
        <thead>
          <tr>
            <th>Bill No</th>
            <th>Month</th>
            <th>Units</th>
            <th>Amount (₹)</th>
            <th>Status</th>
            <th>Bill Date</th>
            <th>Payment Date</th>
          </tr>
        </thead>
        <tbody>
        <%
          for (Bill b : bills) {
        %>
          <tr>
            <td><%= b.getBillNo() %></td>
            <td><%= b.getMonth() %></td>
            <td><%= b.getUnits() %></td>
            <td><%= b.getAmount() %></td>
            <td><%= b.getStatus() %></td>
            <td><%= b.getBillDate() != null ? b.getBillDate() : "-" %></td>
            <td><%= b.getPaymentDate() != null ? b.getPaymentDate() : "-" %></td>
          </tr>
        <% } %>
        </tbody>
      </table>
    </div>
  <% } else { %>
    <p style="text-align:center;">No bills found for your account.</p>
  <% } %>
</div>

</body>
</html> --%>
 
 
 
 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
   response.setHeader("Pragma","no-cache");
   response.setDateHeader("Expires",0);
%>
<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Bill" %>
<%@ include file="/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bill History</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f2f6fc;
      margin: 0;
      padding: 0;
    }

    .form-container {
      max-width: 900px;
      margin: 40px auto;
      background-color: white;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #333;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      font-size: 15px;
    }

    th, td {
      border: 1px solid #ccc;
      padding: 10px 12px;
      text-align: center;
    }

    th {
      background-color: #1e90ff;
      color: white;
    }

    .alert-error {
      text-align: center;
      padding: 12px;
      margin: 20px 0;
      background-color: #f8d7da;
      color: #721c24;
      border-radius: 6px;
      font-weight: 500;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>📊 Your Bill History</h2>

  <%
    List<Bill> bills = (List<Bill>) request.getAttribute("bills");
    if (bills != null && !bills.isEmpty()) {
  %>
    <table>
      <thead>
        <tr>
          <th>Bill No</th>
          <th>Month</th>
          <th>Units</th>
          <th>Amount (₹)</th>
          <th>Status</th>
          <th>Bill Date</th>
          <th>Payment Date</th>
        </tr>
      </thead>
      <tbody>
      <%
        for (Bill b : bills) {
      %>
        <tr>
          <td><%= b.getBillNo() %></td>
          <td><%= b.getMonth() %></td>
          <td><%= b.getUnits() %></td>
          <td><%= b.getAmount() %></td>
          <td><%= b.getStatus() %></td>
          <td><%= b.getBillDate() != null ? b.getBillDate() : "-" %></td>
          <td><%= b.getPaymentDate() != null ? b.getPaymentDate() : "-" %></td>
        </tr>
      <% } %>
      </tbody>
    </table>
  <% } else { %>
    <div class="alert-error">No bills found for your account.</div>
  <% } %>
</div>

</body>
</html>
 