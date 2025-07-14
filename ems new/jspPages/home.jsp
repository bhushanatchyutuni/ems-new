<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
String name = (String) session.getAttribute("userName");
if (name == null) {
    response.sendRedirect("${pageContext.request.contextPath}/index.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard | PowerGrid Pro</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #f2f6fc;
    }
    .dashboard {
      padding: 2rem;
    }
    .welcome {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 1rem;
    }
    .cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
    }
    .card {
      background: white;
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      transition: transform 0.3s, box-shadow 0.3s;
    }
    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 20px rgba(0,0,0,0.15);
    }
    .card i {
      font-size: 30px;
      color: #ffc107;
      margin-bottom: 10px;
    }
    .card h3 {
      margin: 10px 0 5px;
      font-size: 18px;
    }
    .card p {
      font-size: 14px;
      color: #555;
    }
  </style>
</head>
<body>
  <jsp:include page="/common/navbar.jsp" />

  <div class="dashboard">
    <div class="welcome">Welcome to your Dashboard, <%= name %></div>
    <p>Select an option from the navigation bar to get started.</p>
    <div class="cards">
      <div class="card">
        <i class="fas fa-users"></i>
        <h3>Consumers</h3>
        <p>Manage registered consumer data and their usage statistics.</p>
      </div>
      <div class="card">
        <i class="fas fa-bolt"></i>
        <h3>Electricity Usage</h3>
        <p>Track electricity usage trends and peak hour analysis.</p>
      </div>
      <div class="card">
        <i class="fas fa-coins"></i>
        <h3>Payments</h3>
        <p>Monitor bill payments and pending dues effectively.</p>
      </div>
      <div class="card">
        <i class="fas fa-tools"></i>
        <h3>Support</h3>
        <p>Handle customer complaints and feedback efficiently.</p>
      </div>
    </div>
  </div>
</body>
</html>
 --%>
 
 <%-- 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
String name = (String) session.getAttribute("userName");
if (name == null) {
    response.sendRedirect("${pageContext.request.contextPath}/index.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard | PowerGrid Pro</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f2f6fc;
      margin: 0;
      padding: 0;
    }

    .form-container {
      max-width: 1100px;
      margin: 40px auto;
      background-color: white;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }

    .welcome {
      font-size: 22px;
      font-weight: 500;
      margin-bottom: 10px;
      text-align: center;
      color: #333;
    }

    .intro {
      text-align: center;
      color: #555;
      margin-bottom: 30px;
    }

    .cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 20px;
    }

    .card {
      background: #ffffff;
      border-radius: 12px;
      padding: 25px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      text-align: center;
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 20px rgba(0,0,0,0.12);
    }

    .card i {
      font-size: 32px;
      color: #1e90ff;
      margin-bottom: 15px;
    }

    .card h3 {
      margin: 10px 0 8px;
      font-size: 18px;
      color: #333;
    }

    .card p {
      font-size: 14px;
      color: #666;
    }
  </style>
</head>
<body>
  <jsp:include page="/common/navbar.jsp" />

  <div class="form-container">
    <div class="welcome">Welcome to your Dashboard, <%= name %></div>
    <div class="intro">Select an option from the navigation bar to get started.</div>

    <div class="cards">
      <div class="card">
        <i class="fas fa-users"></i>
        <h3>Consumers</h3>
        <p>Manage registered consumer data and their usage statistics.</p>
      </div>
      <div class="card">
        <i class="fas fa-bolt"></i>
        <h3>Electricity Usage</h3>
        <p>Track electricity usage trends and peak hour analysis.</p>
      </div>
      <div class="card">
        <i class="fas fa-coins"></i>
        <h3>Payments</h3>
        <p>Monitor bill payments and pending dues effectively.</p>
      </div>
      <div class="card">
        <i class="fas fa-tools"></i>
        <h3>Support</h3>
        <p>Handle customer complaints and feedback efficiently.</p>
      </div>
    </div>
  </div>
</body>
</html>
 --%> 
 
 
 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
String name = (String) session.getAttribute("userName");
if (name == null) {
    response.sendRedirect("${pageContext.request.contextPath}/index.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard | PowerGrid Pro</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f2f6fc;
      margin: 0;
      padding: 0;
    }

    .form-container {
      max-width: 1100px;
      margin: 60px auto; /* Increased top margin for consistent vertical alignment */
      background-color: white;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }

    .welcome {
      font-size: 22px;
      font-weight: 500;
      margin-bottom: 10px;
      text-align: center;
      color: #333;
    }

    .intro {
      text-align: center;
      color: #555;
      margin-bottom: 30px;
    }

    .cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 20px;
    }

    .card {
      background: #ffffff;
      border-radius: 12px;
      padding: 25px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      text-align: center;
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 20px rgba(0,0,0,0.12);
    }

    .card i {
      font-size: 32px;
      color: #1e90ff;
      margin-bottom: 15px;
    }

    .card h3 {
      margin: 10px 0 8px;
      font-size: 18px;
      color: #333;
    }

    .card p {
      font-size: 14px;
      color: #666;
    }
  </style>
</head>
<body>
  <jsp:include page="/common/navbar.jsp" />

  <div class="form-container">
    <div class="welcome">Welcome to your Dashboard, <%= name %></div>
    <div class="intro">Select an option from the navigation bar to get started.</div>

    <div class="cards">
      <div class="card">
        <i class="fas fa-users"></i>
        <h3>Consumers</h3>
        <p>Manage registered consumer data and their usage statistics.</p>
      </div>
      <div class="card">
        <i class="fas fa-bolt"></i>
        <h3>Electricity Usage</h3>
        <p>Track electricity usage trends and peak hour analysis.</p>
      </div>
      <div class="card">
        <i class="fas fa-coins"></i>
        <h3>Payments</h3>
        <p>Monitor bill payments and pending dues effectively.</p>
      </div>
      <div class="card">
        <i class="fas fa-tools"></i>
        <h3>Support</h3>
        <p>Handle customer complaints and feedback efficiently.</p>
      </div>
    </div>
  </div>
</body>
</html>
 