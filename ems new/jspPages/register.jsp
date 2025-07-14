<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<% 
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html>
<head>
  <title>Consumer Registration | PowerGrid Pro</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updated.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    body {
      margin: 0;
      background-color: #e9eff6;
      font-family: 'Segoe UI', sans-serif;
    }

    .navbar-custom {
      background-color: #1e90ff;
      color: white;
      padding: 12px 24px;
      box-shadow: 0 3px 10px rgba(0,0,0,0.1);
      display: flex;
      justify-content: space-between;
      align-items: center;
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

    .registration-container {
      max-width: 1000px;
      margin: 2rem auto;
    }

    .registration-card {
      display: flex;
      background: white;
      border-radius: 16px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      min-height: 600px;
      transition: transform 0.3s ease;
    }

    .registration-card:hover {
      transform: scale(1.01);
    }

    .registration-hero {
      flex: 1;
      background: linear-gradient(to bottom right, #1e90ff, #4863f7);
      color: white;
      padding: 3rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
      transition: background 0.3s ease;
    }

    .registration-hero:hover {
      background: linear-gradient(to bottom right, #156cd0, #4059d4);
    }

    .registration-form-section {
      flex: 1;
      padding: 3rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .registration-title {
      font-size: 2rem;
      font-weight: 700;
      margin-bottom: 0.5rem;
      color: #052659;
    }

    .registration-subtitle {
      font-size: 1rem;
      color: #6c757d;
      margin-bottom: 2rem;
    }

    .form-control {
      padding: 12px 15px;
      border-radius: 8px;
      margin-bottom: 15px;
      border: 1px solid #ced4da;
      transition: all 0.3s;
    }

    .form-control:focus {
      border-color: #1e90ff;
      box-shadow: 0 0 6px rgba(30, 144, 255, 0.3);
    }

    .password-strength {
      height: 4px;
      background: #e9ecef;
      border-radius: 2px;
      margin-top: -10px;
      margin-bottom: 15px;
      overflow: hidden;
    }

    .password-strength-bar {
      height: 100%;
      width: 0%;
      background: red;
      transition: width 0.3s, background 0.3s;
    }

    .password-hints {
      font-size: 0.8rem;
      color: #6c757d;
      margin-top: -10px;
      margin-bottom: 15px;
    }

    .btn-primary {
      background-color: #ffc107;
      border: none;
      font-weight: 600;
      padding: 10px;
      border-radius: 8px;
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
    }

    .btn-primary:hover {
      background-color: #156cd0;
    }
	i {
      margin-right: 10px;
      color: #ffeb3b;
    }
    .alert-error {
      background-color: #ffe5e5;
      color: #c0392b;
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 15px;
    }

    .alert-success {
      background-color: #e5ffe5;
      color: #2e7d32;
      padding: 10px;
      border-radius: 5px;
      margin-bottom: 15px;
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
    @media (max-width: 768px) {
      .registration-card {
        flex-direction: column;
      }

      .registration-hero, .registration-form-section {
        padding: 2rem;
      }
    }
  </style>
</head>
<body>
  <nav class="navbar navbar-custom">
    <div class="project-name">
       <i class="fas fa-bolt text-warning"></i>Electricity Bill Management System
    </div>
    <div class="clock">
      <i class="fas fa-clock text-light"></i> <span id="liveClock">--:--:--</span>
    </div>
  </nav>

  <div class="registration-container">
    <div class="registration-card">
      <div class="registration-hero">
        <h1 class="welcome-title">Join Our Network</h1>
        <p class="welcome-subtitle">Register once, manage your electricity needs forever</p>
        <div class="features">
          <div class="feature">
            <i class="fas fa-shield-alt"></i>
            <h3>Secure Account</h3>
            <p>Your data is protected with industry-standard encryption</p>
          </div>
          <div class="feature">
            <i class="fas fa-mobile-alt"></i>
            <h3>Mobile Friendly</h3>
            <p>Access your account from any device</p>
          </div>
        </div>
      </div>

      <div class="registration-form-section">
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
          <div class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i> <%= error %>
          </div>
        <% } %>

        <% String success = (String) request.getAttribute("success"); %>
        <% if (success != null) { %>
          <div class="alert alert-success">
            <i class="fas fa-check-circle"></i> Registration successful!
            <% String consumerId = (String) request.getAttribute("consumerId"); %>
            <% String name = (String) request.getAttribute("name"); %>
            <% String email = (String) request.getAttribute("email"); %>
            <div class="mt-3">
              <p><strong>User ID:</strong> <%= consumerId %></p>
              <p><strong>Name:</strong> <%= name %></p>
              <p><strong>Email:</strong> <%= email %></p>
            </div>
          </div>
        <% } %>

        <h2 class="registration-title">Create Account</h2>
        <p class="registration-subtitle">Fill in your details to get started</p>

        <form action="${pageContext.request.contextPath}/Register" method="post" onsubmit="return validateForm()">
          <input type="text" id="consumerId" name="consumerId" class="form-control" placeholder="User Id" required>
          <input type="text" id="name" name="name" class="form-control" placeholder="Full Name" required>
          <input type="email" id="email" name="email" class="form-control" placeholder="Email Address" required>
          <input type="text" id="mobile" name="mobile" class="form-control" placeholder="Mobile Number" minlength="10" maxlength="10" required oninput="this.value = this.value.replace(/[^0-9]/g, '');">
          <input type="password" id="password" name="password" class="form-control" placeholder="Create Password" minlength="6" maxlength="16" required onkeyup="checkPasswordStrength()">
          <div class="password-strength">
            <div class="password-strength-bar" id="password-strength-bar"></div>
          </div>
          <div class="password-hints" id="password-hints">
            Password should be at least 6 characters with a mix of letters and numbers
          </div>
          <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm Password" minlength="6" maxlength="16" required>
          <button type="submit" class="btn btn-primary">
            <i class="fas fa-user-plus" style="color:black"></i> Register Now
          </button>
        </form>

        <p class="text-center mt-3">
          Already have an account? <a href="${pageContext.request.contextPath}/index.jsp" class="link">Sign in here</a>
        </p>
      </div>
    </div>
  </div>

  <script>
    function updateClock() {
      const now = new Date();
      document.getElementById('liveClock').innerText = now.toLocaleTimeString();
    }
    setInterval(updateClock, 1000);
    updateClock();

    function validateForm() {
      const pass = document.getElementById("password").value;
      const confirm = document.getElementById("confirmPassword").value;
      if (pass !== confirm) {
        alert("Passwords do not match!");
        return false;
      }
      return true;
    }

    function checkPasswordStrength() {
      const password = document.getElementById("password").value;
      const strengthBar = document.getElementById("password-strength-bar");
      const hints = document.getElementById("password-hints");

      strengthBar.style.width = '0%';

      if (password.length === 0) {
        hints.innerHTML = "Password should be at least 6 characters with a mix of letters and numbers";
        return;
      }

      let strength = 0;
      strength += Math.min(password.length / 6, 1) * 25;
      if (password.match(/\d/)) strength += 25;
      if (password.match(/[a-zA-Z]/)) strength += 25;
      if (password.match(/[^a-zA-Z0-9]/)) strength += 25;

      strengthBar.style.width = strength + '%';
      if (strength < 50) {
        strengthBar.style.backgroundColor = 'red';
        hints.innerHTML = "Weak password - add numbers or special characters";
      } else if (strength < 75) {
        strengthBar.style.backgroundColor = 'orange';
        hints.innerHTML = "Moderate password - could be stronger";
      } else {
        strengthBar.style.backgroundColor = 'green';
        hints.innerHTML = "Strong password!";
      }
    }
  </script>
</body>
</html>
