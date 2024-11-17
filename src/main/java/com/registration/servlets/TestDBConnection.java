package com.registration.servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//import com.ticketreservation.util.DatabaseConnection;

public class TestDBConnection {

    public static void main(String[] args) {
        // Database URL, username, and password
        String url = "jdbc:mysql://localhost:3306/TicketReservationSystem"; // Update with your DB URL
        String user = "root"; // Update with your DB username
        String password = "octane"; // Update with your DB password

        // Establishing the connection
        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            if (connection != null) {
                System.out.println("Database connection established successfully!");
            } else {
                System.out.println("Failed to establish database connection.");
            }
        } catch (SQLException e) {
            //e.printStackTrace();
            System.out.println("FAILED");
        }
    }
}
