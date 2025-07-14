<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ include file="/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>Register Complaint</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome-style.css">
</head>
<body>

<div class="form-container">
  <h2>📝 Complaint Registration</h2>

  <% String msg = (String) request.getAttribute("message"); 
  		String errmsg = (String) request.getAttribute("errmessage"); 
  %>
 
  <% if (msg != null) { %>
    <div class="alert-success"><%= msg %></div>
  <% } %>
  
  <% if (errmsg != null) { %>
    <div class="alert-error"><%= errmsg %></div>
  <% } %>
  
  

  <form action="${pageContext.request.contextPath}/EMS/ComplaintController" method="post">
    <label for="consumerId">Consumer ID:</label>
    <input type="text" name="consumerId" required value="<%= session.getAttribute("id") %>" readonly>

    <label for="complaintType">Complaint Type:</label>
    <select name="complaintType" required>
      <option value="Billing Issue">Billing Issue</option>
      <option value="Power Failure">Power Failure</option>
      <option value="Meter Problem">Meter Problem</option>
    </select>

    <label for="complaintCategory">Category:</label>
    <select name="complaintCategory" required>
      <option value="Urgent">Urgent</option>
      <option value="Normal">Normal</option>
    </select>

    <label for="complaintText">Describe Your Complaint:</label>
    <textarea name="complaintText" rows="5" required></textarea>

    <input type="submit" value="Submit Complaint">
  </form>
</div>

</body>
</html> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ include file="/common/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>Register Complaint</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar-style.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f2f6fc;
      margin: 0;
      padding: 0;
    }

    .form-container {
      max-width: 600px;
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

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
      margin-top: 18px;
      color: #444;
    }

    input[type="text"],
    select,
    textarea {
      width: 100%;
      padding: 12px;
      border-radius: 8px;
      border: 1px solid #ccc;
      font-size: 15px;
      transition: border-color 0.3s, box-shadow 0.3s;
    }

    input[type="text"]:focus,
    select:focus,
    textarea:focus {
      border-color: #1e90ff;
      box-shadow: 0 0 6px rgba(30, 144, 255, 0.3);
      outline: none;
    }

    textarea {
      resize: vertical;
    }

    input[type="submit"] {
      width: 100%;
      margin-top: 25px;
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

    input[type="submit"]:hover {
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

    @media (max-width: 600px) {
      .form-container {
        padding: 20px;
        margin: 20px 15px;
      }
    }
  </style>
</head>
<body>

  <div class="form-container">
    <h2>📝 Complaint Registration</h2>

    <% 
      String msg = (String) request.getAttribute("message"); 
      String errmsg = (String) request.getAttribute("errmessage"); 
    %>

    <% if (msg != null) { %>
      <div class="alert-success"><%= msg %></div>
    <% } %>

    <% if (errmsg != null) { %>
      <div class="alert-error"><%= errmsg %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/ComplaintController" method="post">
      <label for="consumerId">Consumer ID:</label>
      <input type="text" name="consumerId" required value="<%= session.getAttribute("id") %>" readonly>

      <label for="complaintType">Complaint Type:</label>
      <select name="complaintType" required>
        <option value="Billing Issue">Billing Issue</option>
        <option value="Power Failure">Power Failure</option>
        <option value="Meter Problem">Meter Problem</option>
      </select>

      <label for="complaintCategory">Category:</label>
      <select name="complaintCategory" required>
        <option value="Urgent">Urgent</option>
        <option value="Normal">Normal</option>
      </select>

      <label for="complaintText">Describe Your Complaint:</label>
      <textarea name="complaintText" rows="5" required></textarea>

      <input type="submit" value="Submit Complaint">
    </form>
  </div>

</body>
</html>
