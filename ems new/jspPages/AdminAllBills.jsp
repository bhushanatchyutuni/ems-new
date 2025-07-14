<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/navbar-admin.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Bill" %>

<!DOCTYPE html>
<html>
<head>
  <title>All Bills - Admin</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome-style.css">
</head>
<body>

<div class="content-area">
  <h2 style="text-align:center;">📋 All Bills (Most Recent First)</h2>

<%
  List<Bill> bills = (List<Bill>) request.getAttribute("bills");
  if (bills != null && !bills.isEmpty()) {
%>

  <div style="overflow-x:auto;">
    <table class="styled-table" style="width: 95%; margin: auto;">
      <thead>
        <tr>
          <th>Bill No</th>
          <th>Consumer ID</th>
          <th>Month</th>
          <th>Units</th>
          <th>Amount (₹)</th>
          <th>Status</th>
          <th>Bill Date</th>
          <th>Payment Date</th>
        </tr>
      </thead>
      <tbody>
      <% for (Bill b : bills) { %>
        <tr>
          <td><%= b.getBillNo() %></td>
          <td><%= b.getConsumerId() %></td>
          <td><%= b.getMonth() %></td>
          <td><%= b.getUnits() %></td>
          <td><%= b.getAmount() %></td>
          <td><%= b.getStatus() %></td>
          <td><%= b.getBillDate() %></td>
          <td><%= b.getPaymentDate() != null ? b.getPaymentDate() : "—" %></td>
        </tr>
      <% } %>
      </tbody>
    </table>
  </div>

<% } else { %>
  <p style="text-align:center; color:#999;">❌ No bill records found.</p>
<% } %>
</div>

</body>
</html> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/navbar-admin.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Bill" %>

<!DOCTYPE html>
<html>
<head>
  <title>All Bills - Admin</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f8f9fa;
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

    .search-box {
      text-align: center;
      margin-bottom: 20px;
    }

    .search-box input {
      padding: 10px 14px;
      width: 320px;
      font-size: 15px;
      border: 1px solid #ced4da;
      border-radius: 5px;
    }

    .styled-table {
      border-collapse: collapse;
      margin: auto;
      font-size: 15px;
      min-width: 95%;
      background-color: white;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
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
      border-bottom: 1px solid #dee2e6;
    }

    .styled-table tbody tr:nth-of-type(even) {
      background-color: #f1f1f1;
    }

    .styled-table tbody tr:last-of-type {
      border-bottom: 2px solid #007bff;
    }

    .styled-table thead th {
      position: sticky;
      top: 0;
      background-color: #007bff;
      z-index: 2;
    }

    .action-links a {
      text-decoration: none;
      margin: 0 6px;
      font-size: 14px;
      color: #007bff;
    }

    .action-links a:hover {
      text-decoration: underline;
    }

    @media screen and (max-width: 768px) {
      .search-box input {
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
  <h2>📋 All Bills (Most Recent First)</h2>

  <div class="search-box">
    <input type="text" id="searchInput" placeholder="🔍 Search by Consumer ID or Month" onkeyup="filterTable()" />
  </div>

  <%
    List<Bill> bills = (List<Bill>) request.getAttribute("bills");
    if (bills != null && !bills.isEmpty()) {
  %>

  <div style="overflow-x:auto;">
    <table class="styled-table">
      <thead>
        <tr>
          <th>Bill No</th>
          <th>Consumer ID</th>
          <th>Month</th>
          <th>Units</th>
          <th>Amount (₹)</th>
          <th>Status</th>
          <th>Bill Date</th>
          <th>Payment Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <% for (Bill b : bills) { %>
        <tr>
          <td><%= b.getBillNo() %></td>
          <td><%= b.getConsumerId() %></td>
          <td><%= b.getMonth() %></td>
          <td><%= b.getUnits() %></td>
          <td><%= b.getAmount() %></td>
          <td style="color:<%= b.getStatus().equalsIgnoreCase("Paid") ? "green" : "red" %>;">
            <%= b.getStatus() %>
          </td>
          <td><%= b.getBillDate() %></td>
          <td><%= b.getPaymentDate() != null ? b.getPaymentDate() : "—" %></td>
          <td class="action-links">
            <a href="ViewBill?billNo=<%= b.getBillNo() %>">🔍 View</a>
            <% if (!b.getStatus().equalsIgnoreCase("Paid")) { %>
              | <a href="MarkAsPaid?billNo=<%= b.getBillNo() %>">✅ Mark Paid</a>
            <% } %>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>

  <% } else { %>
    <p style="text-align:center; color:#999;">❌ No bill records found.</p>
  <% } %>
</div>

<script>
function filterTable() {
  let input = document.getElementById("searchInput").value.toLowerCase();
  let rows = document.querySelectorAll(".styled-table tbody tr");

  rows.forEach(row => {
    let text = row.textContent.toLowerCase();
    row.style.display = text.includes(input) ? "" : "none";
  });
}
</script>

</body>
</html>
