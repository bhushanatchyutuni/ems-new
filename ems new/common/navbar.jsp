<%-- 
<%@ page session="true" %>
<%
    String name = (String) session.getAttribute("userName");
    if (name == null) {
        response.sendRedirect("${pageContext.request.contextPath}/index.jsp");
        return;
    }
%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<script src="${pageContext.request.contextPath}/js/welcome-script.js"></script>

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
    display: flex;
    align-items: center;
    gap: 8px;
}
    
    
    /* Show dropdown when active */
    .dropdown.active .dropdown-content {
        display: block;
    }
</style>

<!-- 🔷 Top Navbar -->
<div class="top-navbar">
  <div class="top-left"><i class="fas fa-bolt"></i> Electricity Management System</div>
  <div class="top-center"><i class="fas fa-user-circle" style="margin-right: 8px;"></i> Welcome, <%= name %></div>
  <div class="top-right">
    <div class="dropdown">
      <img src="${pageContext.request.contextPath}/images/profile.png" alt="Profile" class="profile-pic" onclick="toggleDropdown()" />
      <div id="dropdownMenu" class="dropdown-content">
        <a href="${pageContext.request.contextPath}/MyAccount"><i class="fas fa-user"></i> My Account</a>
        <a href="${pageContext.request.contextPath}/LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
        <a href="${pageContext.request.contextPath}/DeactivateAccount"
           onclick="return confirm('Are you sure to deactivate your account?');">
          <i class="fas fa-user-slash"></i> Deactivate
        </a>
      </div>
    </div>
  </div>
</div>

<!-- 🔶 Second Navbar -->
<div class="second-navbar">
  <div class="nav-left">
  <a href="${pageContext.request.contextPath}/jspPages/home.jsp"><i class="fas fa-file-invoice"></i> Home</a>
    <a href="${pageContext.request.contextPath}/ViewBills"><i class="fas fa-file-invoice"></i> View Bills</a>
    <a href="${pageContext.request.contextPath}/BillHistory"><i class="fas fa-history"></i> Bill History</a>
    <a href="${pageContext.request.contextPath}/jspPages/ComplaintRegistration.jsp"><i class="fas fa-comment-dots"></i> Add Complaint</a>
    <a href="${pageContext.request.contextPath}/ComplaintHistory"><i class="fas fa-clipboard-list"></i> Complaint History</a>
  </div>
  <div class="nav-right">
  <div id="liveClock" class="clock">
    <i class="fas fa-clock"></i> <span id="clockTime">--:--:--</span>
  </div>
</div>
</div>

<script>
function toggleDropdown() {
    document.querySelector('.dropdown').classList.toggle('active');
}

// Close the dropdown if clicked outside
window.onclick = function(event) {
    if (!event.target.matches('.profile-pic')) {
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
    const timeString = now.toLocaleTimeString(); // Format: "5:35:12 PM"
    document.getElementById('clockTime').innerText = timeString;
}
setInterval(updateClock, 1000);
updateClock();
</script> --%>




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
    background-color: #34495e; /* dark slate blue */
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
    background-color: #1e90ff; /* light blue */
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
  <div class="top-left"><i class="fas fa-bolt text-warning"></i> PowerGrid Utilities</div>
  <div class="top-center"><i class="fas fa-user-circle"></i> Welcome, <%= name %></div>
  <div class="top-right">
    <div class="dropdown">
      <img src="${pageContext.request.contextPath}/images/profile.png" alt="Profile" class="profile-pic" onclick="toggleDropdown()" />
      <div id="dropdownMenu" class="dropdown-content">
        <a href="${pageContext.request.contextPath}/MyAccount"><i class="fas fa-user"></i> My Account</a>
        <a href="${pageContext.request.contextPath}/LogoutController"><i class="fas fa-sign-out-alt"></i> Logout</a>
        <a href="${pageContext.request.contextPath}/DeactivateAccount" onclick="return confirm('Are you sure to deactivate your account?');">
          <i class="fas fa-user-slash"></i> Deactivate
        </a>
      </div>
    </div>
  </div>
</div>

<div class="second-navbar">
  <div class="nav-left">
    <a href="${pageContext.request.contextPath}/jspPages/home.jsp"><i class="fas fa-home"></i> Home</a>
    <a href="${pageContext.request.contextPath}/ViewBills"><i class="fas fa-file-invoice-dollar"></i> View Bills</a>
    <a href="${pageContext.request.contextPath}/BillHistory"><i class="fas fa-history"></i> Bill History</a>
    <a href="${pageContext.request.contextPath}/jspPages/ComplaintRegistration.jsp"><i class="fas fa-comment-dots"></i> Add Complaint</a>
    <a href="${pageContext.request.contextPath}/ComplaintHistory"><i class="fas fa-clipboard-list"></i> Complaint History</a>
  </div>
  <div class="nav-right">
    <div class="clock">
      <i class="fas fa-clock"></i> <span id="clockTime">--:--:--</span>
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
  document.getElementById('clockTime').innerText = now.toLocaleTimeString();
}
setInterval(updateClock, 1000);
updateClock();
</script>
