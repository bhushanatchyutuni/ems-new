<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Bill - Admin</title>
    <style>
        /* ✅ General styles */
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        /* ✅ Top Navbar Styles */
        .top-navbar {
            background-color: #2c3e50;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .top-left {
            font-weight: bold;
            font-size: 18px;
        }

        .top-center {
            font-size: 16px;
        }

        .top-right {
            position: relative;
        }

        .profile-pic {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            border: 2px solid #fff;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #3498db;
            color: white;
        }

        .dropdown.active .dropdown-content {
            display: block;
        }

        /* ✅ Second Navbar Styles */
        .second-navbar {
            background-color: #3498db;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .nav-left, .nav-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .second-navbar a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .second-navbar a:hover {
            background-color: #2980b9;
        }

        /* ✅ Clock */
        .clock {
            color: white;
            font-weight: bold;
            font-size: 16px;
        }

        /* ✅ Form Styling */
        .container {
            max-width: 500px;
            margin: 100px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            margin-bottom: 6px;
            display: block;
        }

        input {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
            background-color: #fafafa;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007acc;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
        }

        button:hover {
            background-color: #005fa3;
        }

        .message, .error {
            text-align: center;
            margin-bottom: 10px;
        }

        .message {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>

<%@ page import="java.util.*" %>
<%
    String name = (String) session.getAttribute("userName");
    if (name == null) {
        response.sendRedirect("pages/index.jsp");
        return;
    }
%>

<!-- ✅ Navbar: Top -->
<div class="top-navbar">
  <div class="top-left">⚡ Electricity Management System</div>
  <div class="top-center"><i class="fas fa-user-circle" style="margin-right: 8px;"></i> Welcome, <%= name %></div>
  <div class="top-right">
    <div class="dropdown">
      <img src="${pageContext.request.contextPath}/images/profile.png" alt="Profile" class="profile-pic" onclick="toggleDropdown()" />
      <div class="dropdown-content">
        <a href="${pageContext.request.contextPath}/AdminAccount">My Account</a>
        <a href="${pageContext.request.contextPath}/LogoutController">Logout</a>
      </div>
    </div>
  </div>
</div>

<!-- ✅ Navbar: Second -->
<div class="second-navbar">
  <div class="nav-left">
    <a href="${pageContext.request.contextPath}/Admin_Welcome">Consumers</a>
    <a href="${pageContext.request.contextPath}/AdminBills">Bills</a>
    <a href="${pageContext.request.contextPath}/AdminComplaints">Complaint History</a>
  </div>
  <div class="nav-right">
    <span id="liveClock" class="clock"></span>
  </div>
</div>

<!-- ✅ Add Bill Form -->
<div class="container">
    <h2>Add New Bill</h2>

    <%
        String msg = (String) request.getAttribute("msg");
        String errmsg = (String) request.getAttribute("errmsg");
        if (msg != null) {
    %>
        <div class="message"><%= msg %></div>
    <%
        } else if (errmsg != null) {
    %>
        <div class="error"><%= errmsg %></div>
    <%
        }
    %>

    <form action="<%= request.getContextPath() %>/Admin_AddBill" method="post">
        <label for="consumerId">User ID:</label>
        <input type="text" id="consumerId" name="consumerId" required />

        <label for="month">Month:</label>
        <input type="text" id="month" name="month" placeholder="e.g. July 2025" required />

        <label for="units">Units:</label>
        <input type="number" id="units" name="units" required min="0" />

        <label for="billDate">Bill Date:</label>
        <input type="date" id="billDate" name="billDate" required />

        <button type="submit">Add Bill</button>
    </form>
</div>

<!-- ✅ Scripts -->
<script>
function toggleDropdown() {
    const dropdown = document.querySelector('.dropdown');
    dropdown.classList.toggle('active');
}
window.onclick = function(event) {
    if (!event.target.matches('.profile-pic')) {
        const dropdowns = document.getElementsByClassName("dropdown");
        for (let d of dropdowns) {
            d.classList.remove('active');
        }
    }
}
function updateClock() {
    const now = new Date();
    document.getElementById('liveClock').innerText = now.toLocaleTimeString();
}
setInterval(updateClock, 1000);
updateClock();
</script>

</body>
</html>
