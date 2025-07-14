<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="com.ems.model.Consumer" %>
<%
    Consumer admin = (Consumer) request.getAttribute("admin");
    String name = (String) session.getAttribute("userName");

    if (name == null) {
        response.sendRedirect("pages/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Account</title>
    <script src="${pageContext.request.contextPath}/js/welcome-script.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background-color: #f0f2f5;
        }

        /* Top Navbar */
        .top-navbar {
            background-color: #2c3e50;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
            min-width: 200px;
            box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
            border-radius: 5px;
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

        /* Second Navbar */
        .second-navbar {
            background-color: #3498db;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .second-navbar a {
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: 500;
        }

        .second-navbar a:hover {
            background-color: #2980b9;
        }

        .clock {
            font-weight: bold;
            color: white;
        }

        /* Container */
        .container {
            max-width: 500px;
            margin: 60px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        .info label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
            color: #333;
        }

        .info span {
            display: block;
            margin-top: 5px;
            color: #555;
        }
    </style>
</head>
<body>

<!-- 🔷 Top Navbar -->
<div class="top-navbar">
    <div class="top-left">⚡ Electricity Management System</div>
    <div class="top-center"><i class="fas fa-user-circle" style="margin-right: 8px;"></i> Welcome, <%= name %></div>
    <div class="top-right">
        <div class="dropdown">
            <img src="${pageContext.request.contextPath}/images/profile.png" alt="Profile" class="profile-pic" onclick="toggleDropdown()" />
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/AdminAccount"><i class="fas fa-user"></i> My Account</a>
                <a href="${pageContext.request.contextPath}/LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- 🔶 Second Navbar -->
<div class="second-navbar">
    <div>
        <a href="${pageContext.request.contextPath}/Admin_Welcome">Consumers</a>
        <a href="${pageContext.request.contextPath}/AdminBills">Bills</a>
        <a href="${pageContext.request.contextPath}/AdminComplaints">Complaint History</a>
    </div>
    <div class="clock" id="liveClock"></div>
</div>

<!-- 🟦 Account Info -->
<div class="container">
    <h2>Admin Account Details</h2>
    <div class="info">
        <label>Name:</label>
        <span><%= admin.getName() %></span>

        <label>Email:</label>
        <span><%= admin.getEmail() %></span>

        <label>Mobile:</label>
        <span><%= admin.getMobile() %></span>

        <label>Status:</label>
        <span><%= admin.getStatus() %></span>
    </div>
</div>

<script>
    function toggleDropdown() {
        const dropdown = document.querySelector('.dropdown');
        dropdown.classList.toggle('active');
    }

    window.onclick = function(event) {
        if (!event.target.matches('.profile-pic')) {
            const dropdowns = document.getElementsByClassName("dropdown");
            for (let i = 0; i < dropdowns.length; i++) {
                let openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('active')) {
                    openDropdown.classList.remove('active');
                }
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
 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="com.ems.model.Consumer" %>
<%
    Consumer admin = (Consumer) request.getAttribute("admin");
    String name = (String) session.getAttribute("userName");

    if (name == null) {
        response.sendRedirect("pages/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Account</title>
    <script src="${pageContext.request.contextPath}/js/welcome-script.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background-color: #f0f2f5;
        }

        .top-navbar {
            background-color: #34495e;
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
            display: flex;
            align-items: center;
            gap: 10px;
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
            transition: transform 0.3s;
        }

        .profile-pic:hover {
            transform: scale(1.1);
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #f9f9f9;
            min-width: 200px;
            box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 5px;
            overflow: hidden;
        }

        .dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s;
        }

        .dropdown-content a:hover {
            background-color: #1e90ff;
            color: white;
        }

        .dropdown-content i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .dropdown.active .dropdown-content {
            display: block;
        }

        .second-navbar {
            background-color: #1e90ff;
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
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .second-navbar a:hover {
            background-color: #156cd0;
        }

        .clock {
            color: white;
            font-weight: bold;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .info label {
            font-weight: 600;
            display: block;
            margin-top: 15px;
            color: #444;
        }

        .info span {
            display: block;
            margin-top: 5px;
            font-size: 15px;
            color: #555;
        }
    </style>
</head>
<body>

<!-- 🔷 Top Navbar -->
<div class="top-navbar">
    <div class="top-left"><i class="fas fa-bolt text-warning"></i> PowerGrid Pro (Admin)</div>
    <div class="top-center"><i class="fas fa-user-shield"></i> Welcome, <%= name %></div>
    <div class="top-right">
        <div class="dropdown">
            <img src="${pageContext.request.contextPath}/images/profile.png" alt="Profile" class="profile-pic" onclick="toggleDropdown()" />
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/AdminAccount"><i class="fas fa-user-cog"></i> My Account</a>
                <a href="${pageContext.request.contextPath}/LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- 🔶 Second Navbar -->
<div class="second-navbar">
    <div class="nav-left">
        <a href="${pageContext.request.contextPath}/Admin_Welcome"><i class="fas fa-users"></i> Consumers</a>
        <a href="${pageContext.request.contextPath}/AdminBills"><i class="fas fa-file-invoice-dollar"></i> Bills</a>
        <a href="${pageContext.request.contextPath}/AdminComplaints"><i class="fas fa-clipboard-list"></i> Complaint History</a>
    </div>
    <div class="nav-right">
        <div class="clock"><i class="fas fa-clock"></i> <span id="liveClock">--:--:--</span></div>
    </div>
</div>

<!-- 🟦 Account Info -->
<div class="container">
    <h2>Admin Account Details</h2>
    <div class="info">
        <label>Name:</label>
        <span><%= admin.getName() %></span>

        <label>Email:</label>
        <span><%= admin.getEmail() %></span>

        <label>Mobile:</label>
        <span><%= admin.getMobile() %></span>

        <label>Status:</label>
        <span><%= admin.getStatus() %></span>
    </div>
</div>

<script>
    function toggleDropdown() {
        document.querySelector('.dropdown').classList.toggle('active');
    }

    window.onclick = function(event) {
        if (!event.target.matches('.profile-pic')) {
            const dropdown = document.querySelector('.dropdown');
            dropdown.classList.remove('active');
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
 