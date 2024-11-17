<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Failed - Travel Booking</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        .message-box {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        .message-box h2 {
            color: #d9534f;
            margin: 0 0 10px;
        }
        .message-box p {
            font-size: 16px;
            margin: 0 0 20px;
        }
        .message-box a {
            text-decoration: none;
            color: #0275d8;
            font-weight: bold;
        }
        .message-box a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message-box">
            <h2>Login Failed</h2>
            <p>We couldn't log you in. Please check your credentials and try again.</p>
            <a href="<%= request.getContextPath() %>/login.jsp">Back to Login</a>
        </div>
    </div>
</body>
</html>
