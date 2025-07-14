<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>

<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
 %>
<%@ page import="com.ems.model.Consumer" %>
<%@ include file="/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Customer</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/EditCustomer-style.css">
</head>
<body>

<div class="content-area">
  <h2>Edit Your Details</h2>

  <%
    String id = request.getParameter("id");
    

    Consumer consumer = (Consumer) request.getAttribute("consumer");


    if (consumer != null) {
  %>
    <form action="${pageContext.request.contextPath}/UpdateCustomer" method="post" class="form-edit">
      <input type="hidden" name="consumerId" value="<%= consumer.getConsumerId() %>">

      <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="<%= consumer.getName() %>" required>

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" value="<%= consumer.getEmail() %>" required>

      <label for="mobile">Mobile:</label>
      <input type="text" id="mobile" name="mobile" value="<%= consumer.getMobile() %>" maxlength="10" required>

      
<button type="submit" class="btn-primary">💾 Update</button>
      
    </form>
  <% } else { %>
    <p style="color:red;">❌ Customer not found.</p>
  <% } %>

</div>

</body>
</html> --%>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
 response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>
<%@ page import="com.ems.model.Consumer" %>
<%@ include file="/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Customer</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f2f6fc;
      margin: 0;
      padding: 0;
    }

    .content-area {
      max-width: 600px;
      margin: 60px auto;
      background-color: #fff;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 25px;
    }

    .form-edit label {
      display: block;
      margin-top: 18px;
      font-weight: 500;
      color: #444;
    }

    .form-edit input[type="text"],
    .form-edit input[type="email"] {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
      margin-top: 6px;
      transition: border-color 0.3s, box-shadow 0.3s;
    }

    .form-edit input:focus {
      border-color: #1e90ff;
      box-shadow: 0 0 6px rgba(30, 144, 255, 0.3);
      outline: none;
    }

    .btn-primary {
      width: 100%;
      margin-top: 30px;
      background-color: #1e90ff;
      color: white;
      padding: 12px;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
      background-color: #005bb5;
    }

    p {
      text-align: center;
      color: red;
      font-weight: 500;
    }

    @media (max-width: 600px) {
      .content-area {
        padding: 20px;
        margin: 20px 15px;
      }
    }
  </style>
</head>
<body>

<div class="content-area">
  <h2>Edit Your Details</h2>

  <%
    String id = request.getParameter("id");
    Consumer consumer = (Consumer) request.getAttribute("consumer");

    if (consumer != null) {
  %>
    <form action="${pageContext.request.contextPath}/UpdateCustomer" method="post" class="form-edit">
      <input type="hidden" name="consumerId" value="<%= consumer.getConsumerId() %>">

      <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="<%= consumer.getName() %>" required>

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" value="<%= consumer.getEmail() %>" required>

      <label for="mobile">Mobile:</label>
      <input type="text" id="mobile" name="mobile" value="<%= consumer.getMobile() %>" maxlength="10" required>

      <button type="submit" class="btn-primary">💾 Update</button>
    </form>
  <% } else { %>
    <p>❌ Customer not found.</p>
  <% } %>
</div>

</body>
</html>
