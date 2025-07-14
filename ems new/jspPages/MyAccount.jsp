 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
   response.setHeader("Pragma","no-cache");
   response.setDateHeader("Expires",0);
%>
<%@ page import="com.ems.model.Consumer" %>
<%@ include file="/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>My Account</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f2f6fc;
      margin: 0;
      padding: 0;
    }

    .form-container {
      max-width: 700px;
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
      padding: 12px;
      border: 1px solid #ccc;
      text-align: left;
    }

    th {
      background-color: #1e90ff;
      color: white;
      width: 40%;
    }

    .btn-container {
      text-align: center;
      margin-top: 30px;
    }

    button {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #1e90ff;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #005bb5;
    }

    .alert-success,
    .alert-error {
      text-align: center;
      padding: 12px;
      margin: 20px 0;
      border-radius: 6px;
      font-weight: 500;
    }

    .alert-success {
      background-color: #d4edda;
      color: #155724;
    }

    .alert-error {
      background-color: #f8d7da;
      color: #721c24;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>👤 My Account Details</h2>

  <%
    String message = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
    String message1 = (String) request.getAttribute("message1");
  %>

  <% if (message != null) { %>
    <div class="alert-success"><%= message %></div>
  <% } %>
  <% if (error != null) { %>
    <div class="alert-error"><%= error %></div>
  <% } %>
  <% if (message1 != null) { %>
    <div class="alert-error"><%= message1 %></div>
  <% } %>

  <%
    Consumer consumer = (Consumer) request.getAttribute("consumer");
    if (consumer != null) {
  %>
    <table>
      <tr><th>Consumer ID</th><td><%= consumer.getConsumerId() %></td></tr>
      <tr><th>Name</th><td><%= consumer.getName() %></td></tr>
      <tr><th>Email</th><td><%= consumer.getEmail() %></td></tr>
      <tr><th>Mobile</th><td><%= consumer.getMobile() %></td></tr>
    </table>

    <div class="btn-container">
      <form action="EditCustomer" method="get" style="display: inline-block;">
        <input type="hidden" name="id" value="<%= consumer.getConsumerId() %>">
        <button type="submit">✏️ Edit Details</button>
      </form>
    </div>
  <%
    } else {
  %>
    <div class="alert-error">❌ Consumer not found.</div>
  <%
    }
  %>
</div>

</body>
</html>
 
  
  
<%--   
  
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="com.ems.model.Consumer" %>
<%@ include file="/common/navbar-admin.jsp" %>
<%
    Consumer admin = (Consumer) request.getAttribute("admin");
    

    if (name == null) {
        response.sendRedirect("pages/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Account</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f2f6fc;
      margin: 0;
      padding: 0;
    }

    .form-container {
      max-width: 700px;
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
      padding: 12px;
      border: 1px solid #ccc;
      text-align: left;
    }

    th {
      background-color: #1e90ff;
      color: white;
      width: 40%;
    }

    .alert-success,
    .alert-error {
      text-align: center;
      padding: 12px;
      margin: 20px 0;
      border-radius: 6px;
      font-weight: 500;
    }

    .alert-success {
      background-color: #d4edda;
      color: #155724;
    }

    .alert-error {
      background-color: #f8d7da;
      color: #721c24;
    }

    .btn-container {
      text-align: center;
      margin-top: 30px;
    }

    button {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #1e90ff;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #005bb5;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>👨‍💼 Admin Account Details</h2>

  <%
    String message = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
  %>

  <% if (message != null) { %>
    <div class="alert-success"><%= message %></div>
  <% } %>
  <% if (error != null) { %>
    <div class="alert-error"><%= error %></div>
  <% } %>

  <%
    if (admin != null) {
  %>
    <table>
      <tr><th>Admin ID</th><td><%= admin.getConsumerId() %></td></tr>
      <tr><th>Name</th><td><%= admin.getName() %></td></tr>
      <tr><th>Email</th><td><%= admin.getEmail() %></td></tr>
      <tr><th>Mobile</th><td><%= admin.getMobile() %></td></tr>
      <tr><th>Status</th><td><%= admin.getStatus() %></td></tr>
    </table>
  <%
    } else {
  %>
    <div class="alert-error">❌ Admin not found.</div>
  <%
    }
  %>
</div>

</body>
</html>
 --%>  