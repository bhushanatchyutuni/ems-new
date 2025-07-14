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
  <title>Welcome Page</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome-style.css">
  
</head>
<body>
<%
  
  String error_deactivate = (String) request.getAttribute("error-deactivate");
  
%>


<% if (error_deactivate != null) { %>
  <div class="alert-error"><%= error_deactivate %></div>
<% } %>


<!-- ✅ Content area -->
<div class="content-area">
  <h2>Welcome to Your Dashboard</h2>

<%
  List<Bill> bills = (List<Bill>) request.getAttribute("bills");
  if (bills != null && !bills.isEmpty()) {
%>
  <h3 style="text-align:center;">Pending Bills</h3>
  <div style="display: flex; justify-content: center;">
    <table class="styled-table" style="width: 70%;">
      <thead>
        <tr>
          <th>Bill No</th>
          <th>Month</th>
          <th>Units</th>
          <th>Amount (₹)</th>
          <th>Status</th>
          <th>Action</th>
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
          <td>
            <form action="PayBill" method="post">
              <input type="hidden" name="billNo" value="<%= b.getBillNo() %>">
              <input type="submit" value="Pay">
            </form>
          </td>
        </tr>
      <% } %>
      </tbody>
    </table>
  </div>
<% } else { %>
  <p style="text-align:center;">🎉 No unpaid bills found!</p>
<% } %>
</div>
<script src="${pageContext.request.contextPath}/js/welcome-script.js"></script>
</body>
</html>
 --%>
 
 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>
<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Bill" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <title>Welcome Page</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f2f6fc;
      margin: 0;
      padding: 0;
    }

    .content-area {
      max-width: 1000px;
      margin: 60px auto;
      background-color: white;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
    }

    h2, h3 {
      text-align: center;
      color: #333;
    }

    .styled-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 30px;
      font-size: 15px;
      box-shadow: 0 0 10px rgba(0,0,0,0.08);
      background-color: #fff;
    }

    .styled-table th, .styled-table td {
      padding: 12px 15px;
      border: 1px solid #ddd;
      text-align: center;
    }

    .styled-table th {
      background-color: #1e90ff;
      color: #fff;
    }

    input[type="submit"] {
      padding: 8px 16px;
      background-color: #1e90ff;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 14px;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #005bb5;
    }

    .alert-error {
      text-align: center;
      background-color: #f8d7da;
      color: #721c24;
      padding: 12px;
      border-radius: 6px;
      margin-bottom: 20px;
      font-weight: 500;
    }

    p {
      text-align: center;
      color: #555;
      font-size: 15px;
      margin-top: 30px;
    }

    @media (max-width: 768px) {
      .content-area {
        margin: 30px 20px;
        padding: 20px;
      }

      .styled-table th,
      .styled-table td {
        padding: 10px 8px;
        font-size: 14px;
      }
    }
  </style>
</head>
<body>

<%
  String error_deactivate = (String) request.getAttribute("error-deactivate");
%>

<% if (error_deactivate != null) { %>
  <div class="alert-error"><%= error_deactivate %></div>
<% } %>

<div class="content-area">
  <h2>Welcome to Your Dashboard</h2>

<%
  List<Bill> bills = (List<Bill>) request.getAttribute("bills");
  if (bills != null && !bills.isEmpty()) {
%>
  <h3>Pending Bills</h3>
  <div style="display: flex; justify-content: center;">
    <table class="styled-table">
      <thead>
        <tr>
          <th>Bill No</th>
          <th>Month</th>
          <th>Units</th>
          <th>Amount (₹)</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
      <% for (Bill b : bills) { %>
        <tr>
          <td><%= b.getBillNo() %></td>
          <td><%= b.getMonth() %></td>
          <td><%= b.getUnits() %></td>
          <td><%= b.getAmount() %></td>
          <td><%= b.getStatus() %></td>
          <td>
            <form action="PayBill" method="post">
              <input type="hidden" name="billNo" value="<%= b.getBillNo() %>">
              <input type="submit" value="Pay">
            </form>
          </td>
        </tr>
      <% } %>
      </tbody>
    </table>
  </div>
<% } else { %>
  <p>🎉 No unpaid bills found!</p>
<% } %>
</div>

<script src="${pageContext.request.contextPath}/js/welcome-script.js"></script>
</body>
</html>
 