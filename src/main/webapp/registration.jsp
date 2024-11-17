<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Travel Booking</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <div class="signup-container">
        <div class="signup-box">
            <h2>Create Your Account</h2>
            <form action="register" method="post">
                <!-- Use JSP expression to dynamically get the context path for the form action -->
                <div class="input-group">
                    <label for="full_name">Full Name</label>
                    <input type="text" id="full_name" name="full_name" placeholder="Enter your full name" required>
                </div>
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="input-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" placeholder="Enter your phone number" required>
                </div>
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Create a password" required>
                </div>
                <div class="input-group">
                    <label for="confirm_password">Confirm Password</label>
                    <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm your password" required>
                </div>
                <button type="submit" class="signup-btn">Sign Up</button>
                <div class="social-login">
                    <p>Or Sign Up with</p>
                    <button type="button" class="social-btn google-btn">Google</button>
                    <button type="button" class="social-btn facebook-btn">Facebook</button>
                </div>
                <div class="extra-options">
                    <p>Already have an account? <a href="login.jsp">Login</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
