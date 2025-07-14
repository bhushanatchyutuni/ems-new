<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/navbar-admin.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Consumer" %>

<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard - Electricity Bill Management</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome-style.css">
</head>
<body>

<%
  String error_deactivate = (String) request.getAttribute("error-deactivate");

%>

<% if (error_deactivate != null) { %>
  <div class="alert-error"><%= error_deactivate %></div>
<% } %>


<div class="content-area">
  <h2 style="text-align: center;">Admin Dashboard</h2>
  <p style="text-align: center; color: #555;">Below is the list of all registered customers</p>

<%
  List<Consumer> customers = (List<Consumer>) request.getAttribute("customers");
  if (customers != null && !customers.isEmpty()) {
%>
  <div style="display: flex; justify-content: center;">
    <table class="styled-table" style="width: 90%;">
      <thead>
        <tr>
          <th>User ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Mobile</th>
          <th>Add Bill</th>
        </tr>
      </thead>
      <tbody>
        <% for (Consumer c : customers) { %>
          <tr>
            <td><%= c.getConsumerId() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getMobile() %></td>
            <td>
            <form action="jspPages/AddBill.jsp" method="post">
              <input type="hidden" name="consumerId" value="<%= c.getConsumerId() %>">
              <input type="submit" value="Add">
            </form>
          </td>
            
          </tr>
        <% } %>
      </tbody>
    </table>
  </div>
<% } else { %>
  <p style="text-align:center; color: #888;"> No customer data available.</p>
<% } %>
</div>

<script src="${pageContext.request.contextPath}/js/welcome-script.js"></script>
</body>
</html> --%>





<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/navbar-admin.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Consumer" %>

<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard - Electricity Bill Management</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
    }

    .content-area {
      padding: 30px;
    }

    h2 {
      text-align: center;
      margin-bottom: 10px;
      color: #343a40;
    }

    p {
      text-align: center;
      color: #555;
    }

    .alert-error {
      background-color: #f8d7da;
      color: #721c24;
      padding: 10px 20px;
      margin: 10px auto;
      border-radius: 5px;
      width: 90%;
      text-align: center;
    }

    .styled-table {
      width: 90%;
      margin: auto;
      border-collapse: collapse;
      font-size: 15px;
      background-color: white;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    }

    .styled-table thead tr {
      background-color: #007bff;
      color: white;
    }

    .styled-table th,
    .styled-table td {
      padding: 12px 14px;
      text-align: center;
    }

    .styled-table tbody tr {
      border-bottom: 1px solid #dddddd;
    }

    .styled-table tbody tr:nth-of-type(even) {
      background-color: #f3f3f3;
    }

    .styled-table thead th {
      position: sticky;
      top: 0;
      z-index: 2;
    }

    .styled-table input[type="submit"] {
      background-color: #28a745;
      color: white;
      border: none;
      padding: 6px 12px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 13px;
    }

    .styled-table input[type="submit"]:hover {
      background-color: #218838;
    }

    .no-data {
      text-align: center;
      color: #888;
      margin-top: 40px;
      font-size: 16px;
    }

    @media screen and (max-width: 768px) {
      .styled-table th, .styled-table td {
        font-size: 13px;
        padding: 10px;
      }

      .styled-table input[type="submit"] {
        padding: 5px 10px;
        font-size: 12px;
      }
    }
  </style>
</head>
<body>

<%
  String error_deactivate = (String) request.getAttribute("error-deactivate");
  if (error_deactivate != null) {
%>
  <div class="alert-error"><%= error_deactivate %></div>
<% } %>

<div class="content-area">
  <h2>📋 Admin Dashboard</h2>
  <p>Below is the list of all registered customers</p>

  <%
    List<Consumer> customers = (List<Consumer>) request.getAttribute("customers");
    if (customers != null && !customers.isEmpty()) {
  %>

  <div style="overflow-x:auto;">
    <table class="styled-table">
      <thead>
        <tr>
          <th>User ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Mobile</th>
          <th>Add Bill</th>
        </tr>
      </thead>
      <tbody>
        <% for (Consumer c : customers) { %>
        <tr>
          <td><%= c.getConsumerId() %></td>
          <td><%= c.getName() %></td>
          <td><%= c.getEmail() %></td>
          <td><%= c.getMobile() %></td>
          <td>
            <form action="jspPages/AddBill.jsp" method="post">
              <input type="hidden" name="consumerId" value="<%= c.getConsumerId() %>">
              <input type="submit" value="Add">
            </form>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>

  <% } else { %>
    <p class="no-data">❌ No customer data available.</p>
  <% } %>
</div>

<script src="${pageContext.request.contextPath}/js/welcome-script.js"></script>
</body>
</html>
