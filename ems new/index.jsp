<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login - Electricity Bill Management</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <style>
    body {
      margin: 0;
      background-color: #e9eff6;
      font-family: 'Segoe UI', sans-serif;
    }

    /* Navbar */
    .navbar-custom {
      background-color: #052659;
      color: white;
      padding: 12px 24px;
      box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }

    .navbar-custom .project-name {
      font-weight: bold;
      font-size: 18px;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .navbar-custom .clock {
      font-size: 14px;
      color: #f1f1f1;
      display: flex;
      align-items: center;
      gap: 6px;
    }

    /* Main Card */
    .main-card {
      display: flex;
      min-height: 88vh;
      margin: 30px auto;
      max-width: 1000px;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    }

    .left-side {
      background-color: #fff;
      flex: 1;
      padding: 60px 40px;
    }

    .right-side {
      background: linear-gradient(to bottom right, #1e90ff, #4863f7);
      color: #fff;
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 30px;
    }

    .right-side img {
      max-width: 100%;
      height: auto;
    }

    .form-title {
      font-size: 24px;
      font-weight: bold;
      color: #052659;
      margin-bottom: 20px;
    }

    .form-control {
      margin-bottom: 15px;
      padding: 12px;
      border-radius: 8px;
    }

    .form-control:focus {
      border-color: #1e90ff;
      box-shadow: 0 0 6px rgba(30, 144, 255, 0.3);
    }

    .btn-login {
      background-color: #1e90ff;
      color: white;
      font-weight: 600;
      border: none;
      width: 100%;
      padding: 10px;
      border-radius: 8px;
    }

    .btn-login:hover {
      background-color: #156cd0;
    }

    .btn-restore {
      background-color: #ffc107;
      color: black;
      border: none;
      width: 100%;
      padding: 10px;
      border-radius: 8px;
      font-weight: 600;
    }

    .btn-restore:hover {
      background-color: #e0a800;
    }

    .alert-error {
      background-color: #ffe5e5;
      color: #c0392b;
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 15px;
      text-align: center;
    }

    .forgot-link {
      font-size: 13px;
      display: block;
      margin-top: 10px;
    }

    @media (max-width: 768px) {
      .main-card {
        flex-direction: column-reverse;
      }
      .right-side {
        padding: 20px;
      }
    }
  </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-custom d-flex justify-content-between">
  <div class="project-name">
    <i class="fas fa-bolt text-warning"></i> Electricity Bill Management System
  </div>
  <div class="clock">
    <i class="fas fa-clock text-light"></i> <span id="liveClock">--:--:--</span>
  </div>
</nav>

<!-- Main Card Section -->
<div class="main-card">

  <!-- Left Side: Login Form -->
  <div class="left-side">
    <div class="form-title">Welcome Back 👋<br> Sign into your account</div>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
      <div class="alert-error"><%= error %></div>
    <% } %>

    <form action="Login" method="post">
      <input type="email" name="email" class="form-control" placeholder="Email address" required>
      <input type="password" name="password" class="form-control" placeholder="Password" required>
      <button type="submit" class="btn btn-login mt-2">Log In</button>
    </form>

    <form action="RestoreAccount" method="post" class="mt-3">
      <input type="email" name="restoreEmail" class="form-control" placeholder="Enter Email to Restore Account" required>
      <button type="submit" class="btn btn-restore mt-2">Restore Account</button>
    </form>

    <div class="mt-3">
      Not registered yet? 
      <a href="${pageContext.request.contextPath}/jspPages/register.jsp" class="text-decoration-none">Create an account</a>
    </div>
  </div>

  <!-- Right Side: Illustration -->
  <div class="right-side">
    <img src="${pageContext.request.contextPath}/images/undraw_lightbulb-moment_16av.svg" alt="Login Illustration" />
  </div>
</div>
<!-- Clock Script -->
<script>
  function updateClock() {
    const now = new Date();
    document.getElementById('liveClock').innerText = now.toLocaleTimeString();
  }
  setInterval(updateClock, 1000);
  updateClock();
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

 
 
  --%>
  
  
  
  
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login - Electricity Bill Management</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

  <style>
    body {
      margin: 0;
      background-color: #e9eff6;
      font-family: 'Segoe UI', sans-serif;
    }

    /* Navbar */
    .navbar-custom {
      background-color: #3399ff;
      color: white;
      padding: 12px 24px;
      box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }

    .navbar-custom .project-name {
      font-weight: bold;
      font-size: 18px;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .navbar-custom .clock {
      font-size: 14px;
      color: #f1f1f1;
      display: flex;
      align-items: center;
      gap: 6px;
    }

    /* Main Card */
    .main-card {
      display: flex;
      min-height: 88vh;
      margin: 30px auto;
      max-width: 1000px;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 10px 25px rgba(0,0,0,0.15);
      transition: transform 0.3s ease;
    }

    .main-card:hover {
      transform: scale(1.01);
    }

    .left-side {
      background: linear-gradient(to bottom right, #1e90ff, #4863f7);
      color: #fff;
      flex: 1;
      padding: 50px 40px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      transition: background 0.3s ease;
    }

    .left-side:hover {
      background: linear-gradient(to bottom right, #156cd0, #4059d4);
    }

    .left-side h2 {
      font-size: 28px;
      margin-bottom: 20px;
    }

    .left-side ul {
      list-style: none;
      padding: 0;
    }

    .left-side li {
      margin-bottom: 15px;
      font-size: 16px;
    }

    .left-side i {
      margin-right: 10px;
      color: #ffeb3b;
    }

    .right-side {
      background-color: #fff;
      flex: 1;
      padding: 60px 40px;
      transition: box-shadow 0.3s ease;
    }

    .right-side:hover {
      box-shadow: inset 0 0 8px #3399ff;
    }

    .form-title {
      font-size: 24px;
      font-weight: bold;
      color: #052659;
      margin-bottom: 20px;
    }

    .form-control {
      margin-bottom: 15px;
      padding: 12px;
      border-radius: 8px;
    }

    .form-control:focus {
      border-color: #1e90ff;
      box-shadow: 0 0 6px rgba(30, 144, 255, 0.3);
    }

    .btn-login {
      background-color: #1e90ff;
      color: white;
      font-weight: 600;
      border: none;
      width: 100%;
      padding: 10px;
      border-radius: 8px;
    }

    .btn-login:hover {
      background-color: #156cd0;
    }

    .btn-restore {
      background-color: #ffc107;
      color: black;
      border: none;
      width: 100%;
      padding: 10px;
      border-radius: 8px;
      font-weight: 600;
    }

    .btn-restore:hover {
      background-color: #e0a800;
    }

    .alert-error {
      background-color: #ffe5e5;
      color: #c0392b;
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 15px;
      text-align: center;
    }

    @media (max-width: 768px) {
      .main-card {
        flex-direction: column;
      }

      .left-side, .right-side {
        padding: 30px;
      }
    }
  </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-custom d-flex justify-content-between">
  <div class="project-name">
    <i class="fas fa-bolt text-warning"></i> Electricity Bill Management System
  </div>
  <div class="clock">
    <i class="fas fa-clock text-light"></i> <span id="liveClock">--:--:--</span>
  </div>
</nav>

<!-- Main Card Section -->
<div class="main-card">

  <!-- Left Side: Info Content -->
  <div class="left-side">
    <h2>Why Choose Us?</h2>
    <ul>
      <li><i class="fas fa-bolt"></i> Easy Bill Viewing</li>
      <li><i class="fas fa-money-bill-wave"></i> Secure Payments</li>
      <li><i class="fas fa-history"></i> Billing History</li>
      <li><i class="fas fa-comment-dots"></i> Complaint Management</li>
      <li><i class="fas fa-user-shield"></i> Role-based Access</li>
    </ul>
  </div>

  <!-- Right Side: Login Form -->
  <div class="right-side">
    <div class="form-title">Welcome Back 👋<br> Sign into your account</div>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
      <div class="alert-error"><%= error %></div>
    <% } %>

    <form action="Login" method="post">
      <input type="email" name="email" class="form-control" placeholder="Email address" required>
      <input type="password" name="password" class="form-control" placeholder="Password" required>
      <button type="submit" class="btn btn-login mt-2">Log In</button>
    </form>

    <form action="RestoreAccount" method="post" class="mt-3">
      <input type="email" name="restoreEmail" class="form-control" placeholder="Enter Email to Restore Account" required>
      <button type="submit" class="btn btn-restore mt-2">Restore Account</button>
    </form>
    
    
<% String msg = (String) request.getAttribute("message"); %>
<% if (msg != null) { %>
  <div class="alert alert-success text-center"><%= msg %></div>
<% } %>

    <div class="mt-3">
      Not registered yet?
      <a href="${pageContext.request.contextPath}/jspPages/register.jsp" class="text-decoration-none fw-semibold text-primary">Create an account</a>
    </div>
  </div>
</div>

<!-- Clock Script -->
<script>
  function updateClock() {
    const now = new Date();
    document.getElementById('liveClock').innerText = now.toLocaleTimeString();
  }
  setInterval(updateClock, 1000);
  updateClock();
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
  