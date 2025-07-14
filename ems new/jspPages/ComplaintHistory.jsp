<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Complaint" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <title>Complaint History</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome-style.css">
</head>
<body>

<div class="content-area">
<% String msg = (String) request.getAttribute("message"); 
  %>
 
  <% if (msg != null) { %>
    <div class="alert-error"><%= msg %></div>
  <% } %>
  <h2 style="text-align:center;">📋 Your Complaint History</h2>

  <!-- 🔍 Search Box -->
  <div style="text-align: right; margin: 20px;">
  <form action="ComplaintSearch" method="get" style="display: inline-flex; align-items: center; gap: 10px;">
    <input type="text" name="complaintId" placeholder="Enter Complaint ID" 
           style="padding: 8px 12px; border: 1px solid #ccc; border-radius: 6px; font-size: 14px;"/>

    <input type="submit" value="🔍 Search"
           style="background-color: #007bff; color: white; padding: 8px 16px;
                  border: none; border-radius: 6px; cursor: pointer;
                  font-weight: bold; font-size: 14px; transition: background-color 0.3s ease;">
  </form>
</div>

  <% 
    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
    String error = (String) request.getAttribute("error");
  %>

  <% if (error != null) { %>
    <div class="alert-error"><%= error %></div>
  <% } %>

  <% if (complaints != null && !complaints.isEmpty()) { %>
    <table class="styled-table" style="width: 90%; margin: auto;">
      <thead>
        <tr>
          <th>ID</th>
          <th>Type</th>
          <th>Category</th>
          <th>Description</th>
          <th>Date</th>
        </tr>
      </thead>
      <tbody>
        <% for (Complaint c : complaints) { %>
        <tr>
          <td><%= c.getCompliantId() %></td>
          <td><%= c.getType() %></td>
          <td><%= c.getCategory() %></td>
          <td><%= c.getText() %></td>
          <td><%= c.getCompliantDate() %></td>
        </tr>
        <% } %>
      </tbody>
    </table>
  <% } else { %>
    <p style="text-align:center;">❗ No complaints found.</p>
  <% } %>
</div>

</body>
</html>

 --%>
 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Complaint" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <title>Complaint History</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f2f6fc;
      margin: 0;
      padding: 0;
    }

    .form-container {
      max-width: 1000px;
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

    .search-box {
      text-align: right;
      margin-bottom: 20px;
    }

    .search-box input[type="text"] {
      padding: 8px 12px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
      width: 200px;
    }

    .search-box input[type="submit"] {
      background-color: #1e90ff;
      color: white;
      padding: 8px 14px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
      margin-left: 10px;
      font-size: 14px;
      transition: background-color 0.3s ease;
    }

    .search-box input[type="submit"]:hover {
      background-color: #005bb5;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2>📋 Your Complaint History</h2>

  <%
    String msg = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
  %>

  <% if (msg != null) { %>
    <div class="alert-success"><%= msg %></div>
  <% } %>

  <% if (error != null) { %>
    <div class="alert-error"><%= error %></div>
  <% } %>

  <div class="search-box">
    <form action="ComplaintSearch" method="get">
      <input type="text" name="complaintId" placeholder="Enter Complaint ID" />
      <input type="submit" value="🔍 Search" />
    </form>
  </div>

  <% if (complaints != null && !complaints.isEmpty()) { %>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Type</th>
          <th>Category</th>
          <th>Description</th>
          <th>Date</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <% for (Complaint c : complaints) { %>
          <tr>
            <td><%= c.getCompliantId() %></td>
            <td><%= c.getType() %></td>
            <td><%= c.getCategory() %></td>
            <td><%= c.getText() %></td>
            <td><%= c.getCompliantDate() %></td>
            <td><%=c.getStatus() %></td>
          </tr>
        <% } %>
      </tbody>
    </table>
  <% } else { %>
    <div class="alert-error">❗ No complaints found.</div>
  <% } %>

</div>

</body>
</html>
 