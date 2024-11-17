package com.registration.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ticketreservation.util.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get email/username and password from the request
        String emailOrUsername = request.getParameter("emailOrUsername");
        String password = request.getParameter("password");

        // Validate the user and retrieve userId and userName
        User user = validateUser(emailOrUsername, password);

        if (user != null) {
            // If valid, create a session and store user information
            HttpSession session = request.getSession();
            session.setAttribute("email", emailOrUsername);
            session.setAttribute("userName", user.getUserName());  // Store the user's name in the session
            session.setAttribute("userId", user.getUserId());  // Store the user's ID in the session

            // Redirect to index.jsp after successful login
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            // If invalid, redirect to login page with an error message
            response.sendRedirect(request.getContextPath() + "/errorWhileLogin.jsp");
        }
    }

    // Method to validate the user from the database and retrieve userId and userName
    private User validateUser(String emailOrUsername, String password) {
        User user = null;

        try {
            // Establish database connection
            Connection connection = DatabaseConnection.getConnection();

            // SQL query to check user based on email/username and password
            String query = "SELECT * FROM users WHERE (email = ? OR username = ?) AND password = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, emailOrUsername);
            stmt.setString(2, emailOrUsername);
            stmt.setString(3, password);

            // Execute the query
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // User exists and credentials are valid, retrieve the user's ID and name
                int userId = rs.getInt("user_id"); // Assuming the column for user ID is "user_id"
                String userName = rs.getString("username"); // Assuming the column for username is "username"
                
                // Create a new User object
                user = new User(userId, userName);
            }

            // Close resources
            rs.close();
            stmt.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    // Inner class to represent the User object
    private class User {
        private int userId;
        private String userName;

        public User(int userId, String userName) {
            this.userId = userId;
            this.userName = userName;
        }

        public int getUserId() {
            return userId;
        }

        public String getUserName() {
            return userName;
        }
    }
}
