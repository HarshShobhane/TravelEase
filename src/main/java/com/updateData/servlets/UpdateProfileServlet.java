package com.updateData.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ticketreservation.util.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateprofile")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);  // Get the existing session, don't create a new one
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");  // Redirect to login if session or userId is not found
            return;
        }

        // Retrieve the user's ID from the session
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            // If userId is null, there's a session problem
            PrintWriter out = response.getWriter();
            out.print("No user ID found in session");
            return;
        }

        // Log user ID to verify
        System.out.println("Updating profile for user ID: " + userId);

        // Retrieve form data
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String maritalStatus = request.getParameter("maritalStatus");
        String address = request.getParameter("address");
        String pincode = request.getParameter("pincode");
        String state = request.getParameter("state");

        // Perform the database operation
        Connection conn = null;  
        PreparedStatement stmt = null;
        try {
            conn = DatabaseConnection.getConnection();  
            // Check if the user profile exists
            String checkQuery = "SELECT COUNT(*) FROM user_profile WHERE user_id = ?";
            stmt = conn.prepareStatement(checkQuery);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                // User profile exists, perform an update
                String updateQuery = "UPDATE user_profile SET birthday = ?, gender = ?, marital_status = ?, address = ?, pincode = ?, state = ? WHERE user_id = ?";
                stmt = conn.prepareStatement(updateQuery);
                stmt.setString(1, birthday);
                stmt.setString(2, gender);
                stmt.setString(3, maritalStatus);
                stmt.setString(4, address);
                stmt.setString(5, pincode);
                stmt.setString(6, state);
                stmt.setInt(7, userId);
                int rowsUpdated = stmt.executeUpdate();

                PrintWriter out = response.getWriter();
                if (rowsUpdated > 0) {
                    System.out.println("Profile updated successfully for user ID: " + userId);
                    out.print("Profile updated successfully");
                } else {
                    System.out.println("Profile update failed for user ID: " + userId);
                    out.print("Profile update failed");
                }
            } else {
                // User profile does not exist, perform an insert
                String insertQuery = "INSERT INTO user_profile (user_id, birthday, gender, marital_status, address, pincode, state) VALUES (?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(insertQuery);
                stmt.setInt(1, userId);         // user_id
                stmt.setString(2, birthday);    // birthday
                stmt.setString(3, gender);      // gender
                stmt.setString(4, maritalStatus); // marital_status
                stmt.setString(5, address);     // address
                stmt.setString(6, pincode);     // pincode
                stmt.setString(7, state);       // state
                int rowsInserted = stmt.executeUpdate();

                PrintWriter out = response.getWriter();
                if (rowsInserted > 0) {
                    System.out.println("Profile created successfully for user ID: " + userId);
                    out.print("Profile created successfully");
                } else {
                    System.out.println("Profile creation failed for user ID: " + userId);
                    out.print("Profile creation failed");
                }
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error while updating profile", e);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
