<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Travel Booking</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css?v=<%= System.currentTimeMillis() %>">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h2>Login to Your Account</h2>
            <form method="post" action="login">
                <!-- JSP expression to dynamically resolve the form action URL based on the context path -->
                <div class="input-group">
                    <label for="emailOrUsername">Email or Username</label>
                    <input type="text" id="emailOrUsername" name="emailOrUsername" placeholder="Enter your email or username" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="login-btn">Login</button>
                <div class="social-login">
                    <p>Or Login with</p>
                    <button type="button" class="social-btn google-btn">Google</button>
                    <button type="button" class="social-btn facebook-btn">Facebook</button>
                </div>
                <div class="extra-options">
                    <a href="#">Forgot Password?</a>
                    <p>Don't have an account? <a href="registration.jsp">Sign up</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
