<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Successful - Travel Booking</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/success.css">
</head>
<body>
    <div class="success-container">
        <div class="success-box">
            <i class="fa fa-check-circle success-icon"></i>
            <h2>Sign Up Successful!</h2>
            <p class="success-message">Thank you for creating an account with us. You can now <a href="<%= request.getContextPath() %>/login.jsp">log in</a> to access your account.</p>
            <a href="<%= request.getContextPath() %>/index.jsp" class="home-btn">Return to Home</a>
        </div>
    </div>
</body>
</html>
