<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import="java.util.*, com.ems.model.Complaint" %>
<%@ include file="/common/navbar-admin.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <title>Admin Complaint History</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome-style.css">
  <style>

  .btn-mark {
    padding: 5px 10px;
    background-color: #28a745;
    color: white;
    border: none;
    font-size: 13px;
    border-radius: 4px;
    cursor: pointer;
  }

  .btn-mark:hover {
    background-color: #218838;
  }

  
    .filter-container {
      text-align: right;
      margin: 20px;
    }

    .filter-select {
      padding: 6px 12px;
      font-size: 14px;
      border-radius: 4px;
      border: 1px solid #ccc;
    }

    .styled-table {
      width: 90%;
      margin: auto;
    }
  </style>
</head>
<body>

<div class="content-area">
  <h2 style="text-align:center;">All Complaints</h2>

  <!-- ✅ Filter Dropdown -->
  <div class="filter-container">
    <form action="${PageContext.request.contextPath}/AdminComplaints" method="get">
      <select name="statusFilter" class="filter-select" onchange="this.form.submit()">
        <option value="">🔍 Show All</option>
        <option value="Pending" <%= "Pending".equals(request.getParameter("statusFilter")) ? "selected" : "" %>>⏳ Pending</option>
        <option value="Cleared" <%= "Cleared".equals(request.getParameter("statusFilter")) ? "selected" : "" %>>✅ Cleared</option>
      </select>
    </form>
  </div>

  <%
    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
    if (complaints != null && !complaints.isEmpty()) {
  %>
  <table class="styled-table">
    <thead>
      <tr>
        <th>Complaint ID</th>
        <th>Consumer ID</th>
        <th>Type</th>
        <th>Category</th>
        <th>Description</th>
        <th>Date</th>
        <th>Status</th>
        <th>Clear Complaints</th>
      </tr>
    </thead>
    <tbody>
      <% for (Complaint c : complaints) { %>
      <tr>
        <td><%= c.getCompliantId() %></td>
        <td><%= c.getConsumerId() %></td>
        <td><%= c.getType() %></td>
        <td><%= c.getCategory() %></td>
        <td><%= c.getText() %></td>
        <td><%= c.getCompliantDate() %></td>
        <td><%= c.getStatus() %></td>
        <td>
  <% if ("Pending".equalsIgnoreCase(c.getStatus())) { %>
    <form method="get" action="AdminComplaints">
      <input type="hidden" name="markCleared" value="<%= c.getCompliantId() %>">
      <input type="submit" value="✔️ Mark as Cleared" class="btn-mark">
    </form>
  <% } else { %>
    <span style="color: green;">✔️</span>
  <% } %>
</td>
      </tr>
      <% } %>
    </tbody>
  </table>
  <% } else { %>
    <p style="text-align:center;">❌ No complaints found.</p>
  <% } %>
</div>

</body>
</html>



 --%>

<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import="java.util.*, com.ems.model.Complaint" %>
<%@ include file="/common/navbar-admin.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <title>Admin Complaint History</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 0;
    }

    .content-area {
      padding: 30px;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #343a40;
    }

    .filter-container {
      text-align: right;
      margin: 0 5% 20px 0;
    }

    .filter-select {
      padding: 8px 12px;
      font-size: 14px;
      border-radius: 4px;
      border: 1px solid #ccc;
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
      color: #ffffff;
    }

    .styled-table th,
    .styled-table td {
      padding: 12px 15px;
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

    .btn-mark {
      padding: 6px 10px;
      background-color: #28a745;
      color: white;
      border: none;
      font-size: 13px;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn-mark:hover {
      background-color: #218838;
    }

    .status-pending {
      color: orange;
      font-weight: bold;
    }

    .status-cleared {
      color: green;
      font-weight: bold;
    }

    .no-data {
      text-align: center;
      color: #888;
      margin-top: 40px;
      font-size: 16px;
    }

    @media screen and (max-width: 768px) {
      .filter-container {
        text-align: center;
        margin: 10px 0;
      }

      .filter-select {
        width: 90%;
      }

      .styled-table th, .styled-table td {
        font-size: 13px;
        padding: 10px;
      }
    }
  </style>
</head>
<body>

<div class="content-area">
  <h2>📋 All Complaints</h2>

  <!-- ✅ Filter Dropdown -->
  <div class="filter-container">
    <form action="${pageContext.request.contextPath}/EMS/AdminComplaints" method="get">
      <select name="statusFilter" class="filter-select" onchange="this.form.submit()">
        <option value="">🔍 Show All</option>
        <option value="Pending" <%= "Pending".equals(request.getParameter("statusFilter")) ? "selected" : "" %>>⏳ Pending</option>
        <option value="Cleared" <%= "Cleared".equals(request.getParameter("statusFilter")) ? "selected" : "" %>>✅ Cleared</option>
      </select>
    </form>
  </div>

  <%
    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
    if (complaints != null && !complaints.isEmpty()) {
  %>

  <div style="overflow-x:auto;">
    <table class="styled-table">
      <thead>
        <tr>
          <th>Complaint ID</th>
          <th>Consumer ID</th>
          <th>Type</th>
          <th>Category</th>
          <th>Description</th>
          <th>Date</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <% for (Complaint c : complaints) { %>
        <tr>
          <td><%= c.getCompliantId() %></td>
          <td><%= c.getConsumerId() %></td>
          <td><%= c.getType() %></td>
          <td><%= c.getCategory() %></td>
          <td><%= c.getText() %></td>
          <td><%= c.getCompliantDate() %></td>
          <td class="<%= c.getStatus().equalsIgnoreCase("Cleared") ? "status-cleared" : "status-pending" %>">
            <%= c.getStatus() %>
          </td>
          <td>
            <% if ("Pending".equalsIgnoreCase(c.getStatus())) { %>
              <form method="get" action="AdminComplaints">
                <input type="hidden" name="markCleared" value="<%= c.getCompliantId() %>">
                <input type="submit" value="✔️ Mark as Cleared" class="btn-mark">
              </form>
            <% } else { %>
              <span class="status-cleared">✔️</span>
            <% } %>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>

  <% } else { %>
    <p class="no-data">❌ No complaints found.</p>
  <% } %>
</div>

</body>
</html>
 --%>
 
 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import="java.util.*, com.ems.model.Complaint" %>
<%@ include file="/common/navbar-admin.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <title>Admin Complaint History</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 0;
    }

    .content-area {
      padding: 30px;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    .filter-container {
      text-align: right;
      margin: 0 5% 20px 0;
    }

    .filter-select {
      padding: 8px 12px;
      font-size: 14px;
      border-radius: 4px;
      border: 1px solid #ccc;
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
      padding: 12px 15px;
      text-align: center;
    }

    .styled-table tbody tr {
      border-bottom: 1px solid #ddd;
    }

    .styled-table tbody tr:nth-of-type(even) {
      background-color: #f3f3f3;
    }

    .styled-table thead th {
      position: sticky;
      top: 0;
      z-index: 2;
    }

    .btn-mark {
      padding: 6px 10px;
      background-color: #28a745;
      color: white;
      border: none;
      font-size: 13px;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn-mark:hover {
      background-color: #218838;
    }

    .status-pending {
      color: orange;
      font-weight: bold;
    }

    .status-cleared {
      color: green;
      font-weight: bold;
    }

    .no-data {
      text-align: center;
      color: #888;
      margin-top: 40px;
      font-size: 16px;
    }

    @media screen and (max-width: 768px) {
      .filter-container {
        text-align: center;
        margin: 10px 0;
      }

      .filter-select {
        width: 90%;
      }

      .styled-table th, .styled-table td {
        font-size: 13px;
        padding: 10px;
      }
    }
  </style>
</head>
<body>

<div class="content-area">
  <h2>📋 All Complaints</h2>

  <!-- ✅ Filter Dropdown -->
  <div class="filter-container">
    <form action="${pageContext.request.contextPath}/AdminComplaints" method="get">
      <select name="statusFilter" class="filter-select" onchange="this.form.submit()">
        <option value="">🔍 Show All</option>
        <option value="Pending" <%= "Pending".equals(request.getParameter("statusFilter")) ? "selected" : "" %>>⏳ Pending</option>
        <option value="Cleared" <%= "Cleared".equals(request.getParameter("statusFilter")) ? "selected" : "" %>>✅ Cleared</option>
      </select>
    </form>
  </div>

  <%
    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
    if (complaints != null && !complaints.isEmpty()) {
  %>

  <div style="overflow-x:auto;">
    <table class="styled-table">
      <thead>
        <tr>
          <th>Complaint ID</th>
          <th>Consumer ID</th>
          <th>Type</th>
          <th>Category</th>
          <th>Description</th>
          <th>Date</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <% for (Complaint c : complaints) { %>
        <tr>
          <td><%= c.getCompliantId() %></td>
          <td><%= c.getConsumerId() %></td>
          <td><%= c.getType() %></td>
          <td><%= c.getCategory() %></td>
          <td><%= c.getText() %></td>
          <td><%= c.getCompliantDate() %></td>
          <td class="<%= c.getStatus().equalsIgnoreCase("Cleared") ? "status-cleared" : "status-pending" %>">
            <%= c.getStatus() %>
          </td>
          <td>
            <% if ("Pending".equalsIgnoreCase(c.getStatus())) { %>
              <form method="get" action="AdminComplaints">
                <input type="hidden" name="markCleared" value="<%= c.getCompliantId() %>">
                <input type="submit" value="✔️ Mark as Cleared" class="btn-mark">
              </form>
            <% } else { %>
              <span class="status-cleared">✔️</span>
            <% } %>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>

  <% } else { %>
    <p class="no-data">❌ No complaints found.</p>
  <% } %>
</div>

</body>
</html>
 