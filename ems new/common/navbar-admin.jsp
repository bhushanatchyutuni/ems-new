<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>

<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Bill" %>

<html>
<head>
  <title>Welcome Page</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <script src="${pageContext.request.contextPath}/js/welcome-script.js" ></script>
</head>
<style>
    /* 🔷 Top Navbar Styles */
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
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
        background-color: #3498db;
        color: white;
    }
    
    .dropdown-content i {
        margin-right: 10px;
        width: 20px;
        text-align: center;
    }
    
    /* 🔶 Second Navbar Styles */
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
        display: flex;
        align-items: center;
        gap: 8px;
    }
    
    .second-navbar a:hover {
        background-color: #2980b9;
    }
    
    .clock {
        color: white;
        font-weight: bold;
        font-size: 16px;
    }
    
    /* Show dropdown when active */
    .dropdown.active .dropdown-content {
        display: block;
    }
</style>
<body>

<%
    String name = (String) session.getAttribute("userName");
    if (name == null) {
        response.sendRedirect("pages/index.jsp");
        return;
    }
%>
<div class="top-navbar">
  <div class="top-left">⚡ Electricity Management System</div>
  <div class="top-center"><i class="fas fa-user-circle" style="margin-right: 8px;"></i> Welcome, <%= name %></div>
  <div class="top-right">
    <div class="dropdown">
      <img src="${pageContext.request.contextPath}/images/profile.png" alt="Profile" class="profile-pic" onclick="toggleDropdown()" />
      <div id="dropdownMenu" class="dropdown-content">
        <a href="${pageContext.request.contextPath}/AdminAccount"><i class="fas fa-user"></i> My Account</a>
        <a href="${pageContext.request.contextPath}/LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
   
      </div>
    </div>
  </div>
</div>

<div class="navbar">
  <div class="nav-left">
    <a href="${pageContext.request.contextPath}/Admin_Welcome">Consumers</a>
    <a href="${pageContext.request.contextPath}/AdminBills">Bills</a>
    <a href="${pageContext.request.contextPath}/AdminComplaints">Complaint History</a>
  </div>

  <div class="nav-right">
    <div class="dropdown">
     <span id="liveClock" class="clock" style="color: white;
    font-weight: bold;
    font-size: 16px;"></span>
      <div id="dropdownMenu" class="dropdown-content">
  
  <a href="${pageContext.request.contextPath}/LogoutController">Logout</a>
  
</div>

    </div>
  </div>
</div>
<script>
function toggleDropdown() {
    const dropdown = document.querySelector('.dropdown');
    dropdown.classList.toggle('active');
}

// Optional: Close dropdown if clicking outside
window.onclick = function(event) {
    if (!event.target.matches('.profile-pic') && !event.target.matches('.dropdown-toggle')) {
        var dropdowns = document.getElementsByClassName("dropdown");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('active')) {
                openDropdown.classList.remove('active');
            }
        }
    }
}
function updateClock() {
    const now = new Date();
    const timeString = now.toLocaleTimeString(); // e.g., "5:35:12 PM"
    document.getElementById('liveClock').innerText = timeString;
}

// Update the clock every second
setInterval(updateClock, 1000);
updateClock(); // Run once on load


</script>




</body>
</html> --%>



<%@ page session="true" %>
<%
    String name = (String) session.getAttribute("userName");
    if (name == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
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

  .dropdown.active .dropdown-content {
    display: block;
  }
</style>

<div class="top-navbar">
  <div class="top-left"><i class="fas fa-bolt text-warning"></i> PowerGrid Utilities (Admin)</div>
  <div class="top-center"><i class="fas fa-user-shield"></i> Welcome, <%= name %></div>
  <div class="top-right">
    <div class="dropdown">
      <img src="${pageContext.request.contextPath}/images/profile.png" alt="Profile" class="profile-pic" onclick="toggleDropdown()" />
      <div id="dropdownMenu" class="dropdown-content">
        <a href="${pageContext.request.contextPath}/AdminAccount"><i class="fas fa-user-cog"></i> My Account</a>
        <a href="${pageContext.request.contextPath}/LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
      </div>
    </div>
  </div>
</div>

<div class="second-navbar">
  <div class="nav-left">
    <a href="${pageContext.request.contextPath}/Admin_Welcome"><i class="fas fa-users"></i> Consumers</a>
    <a href="${pageContext.request.contextPath}/AdminBills"><i class="fas fa-file-invoice-dollar"></i> Bills</a>
    <a href="${pageContext.request.contextPath}/AdminComplaints"><i class="fas fa-clipboard-list"></i> Complaint History</a>
  </div>
  <div class="nav-right">
    <div class="clock">
      <i class="fas fa-clock"></i> <span id="liveClock">--:--:--</span>
    </div>
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
