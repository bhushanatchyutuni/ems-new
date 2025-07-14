<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
 %>
<%@ page import="com.ems.model.Bill" %>
<%
  Bill bill = (Bill) request.getAttribute("bill");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Confirm Bill Payment</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome-style.css">
  <script src="${pageContext.request.contextPath}/js/welcome-script.js" defer></script>
</head>
<body>

<%@ include file="/common/navbar.jsp" %>


<div class="content-area">
  <h2>Confirm Payment</h2>

  <table class="styled-table" style="width: 50%;">
    <tr><th>Bill No</th><td><%= bill.getBillNo() %></td></tr>
    <tr><th>Month</th><td><%= bill.getMonth() %></td></tr>
    <tr><th>Units</th><td><%= bill.getUnits() %></td></tr>
    <tr><th>Amount</th><td>₹ <%= bill.getAmount() %></td></tr>
    <tr><th>Status</th><td><%= bill.getStatus() %></td></tr>
  </table>

  <form action="ConfirmPayment" method="post" style="text-align:center; margin-top:20px;">
    <input type="hidden" name="billNo" value="<%= bill.getBillNo() %>">
    <input type="submit" value="Pay" style="padding: 10px 20px; font-size: 16px;">
  </form>
  
  
</div>

</body>
</html>
