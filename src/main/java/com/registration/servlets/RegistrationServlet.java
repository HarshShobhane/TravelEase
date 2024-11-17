package com.registration.servlets;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.ticketreservation.util.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PrintWriter out=response.getWriter();
		//out.print("OKAYY");
		   // Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String fullName = request.getParameter("full_name");
        String confirmPassword = request.getParameter("confirm_password");

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            // Redirect back to signup with an error message in the query string
            response.sendRedirect("signup.jsp?error=password_mismatch");
            return;
        }

        // Connect to the database
        Connection connection = DatabaseConnection.getConnection();
        if (connection == null) {
            // Database connection failed
            response.sendRedirect("signup.jsp?error=database_connection_failed");
            return;
        }

        try {
            // Prepare SQL insert statement
            String sql = "INSERT INTO users (username, password, email, phone, full_name, user_type) VALUES (?, ?, ?, ?, ?, 'customer')";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password); // Store plain text password (consider hashing in production)
            statement.setString(3, email);
            statement.setString(4, phone);
            statement.setString(5, fullName);

            // Execute the statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                // Registration successful, redirect to success page
                response.sendRedirect("success.jsp");
            } else {
                // Registration failed, redirect back to signup page with an error
                response.sendRedirect("signup.jsp?error=registration_failed");
            }

        } catch (SQLException e) {
            // Handle SQL exception, log the error, and redirect back to signup page
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=database_error");
        } finally {
            // Close the database connection
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }	
}


