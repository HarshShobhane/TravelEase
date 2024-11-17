package com.registration.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BusBooking")
public class BusBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3306/TicketReservationSystem";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "octane";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters from the request
        String fromCity = request.getParameter("from");
        String toCity = request.getParameter("to");

        // Validate if all fields are filled
        if (fromCity == null || toCity == null || fromCity.isEmpty() || toCity.isEmpty()) {
            request.setAttribute("error", "Please fill in all fields");
            request.getRequestDispatcher("BusTravel.jsp").forward(request, response);
            return;
        }

        // List to store the available buses
        List<Bus> availableBuses = new ArrayList<>();

        // Database logic to fetch available buses
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM Buses WHERE departure_city = ? AND destination_city = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, fromCity);
                statement.setString(2, toCity);

                ResultSet resultSet = statement.executeQuery();

                // Check if resultSet has data and fetch bus details
                boolean dataFound = false;
                while (resultSet.next()) {
                    dataFound = true;
                    Bus bus = new Bus(
                        resultSet.getInt("bus_id"),
                        resultSet.getString("bus_name"),
                        resultSet.getString("departure_city"),
                        resultSet.getString("destination_city"),
                        resultSet.getTime("departure_time").toString(),
                        resultSet.getTime("arrival_time").toString(),
                        resultSet.getInt("available_seats"),
                        resultSet.getDouble("price")
                    );
                    availableBuses.add(bus);
                }
                
                // Log if no buses were found
                if (!dataFound) {
                    System.out.println("No buses found for the specified route.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while fetching bus data");
            request.getRequestDispatcher("BusTravel.jsp").forward(request, response);
            return;
        }

        // Set the list of buses as a request attribute
        request.setAttribute("availableBuses", availableBuses);

        // Forward to ShowBuses.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShowBuses.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    // Inner class for the Bus model
    public static class Bus {
        private int busId;
        private String busName;
        private String departureCity;
        private String destinationCity;
        private String departureTime;
        private String arrivalTime;
        private int availableSeats;
        private double price;

        public Bus(int busId, String busName, String departureCity, String destinationCity, String departureTime, String arrivalTime, int availableSeats, double price) {
            this.busId = busId;
            this.busName = busName;
            this.departureCity = departureCity;
            this.destinationCity = destinationCity;
            this.departureTime = departureTime;
            this.arrivalTime = arrivalTime;
            this.availableSeats = availableSeats;
            this.price = price;
        }

        // Getters
        public int getBusId() { return busId; }
        public String getBusName() { return busName; }
        public String getDepartureCity() { return departureCity; }
        public String getDestinationCity() { return destinationCity; }
        public String getDepartureTime() { return departureTime; }
        public String getArrivalTime() { return arrivalTime; }
        public int getAvailableSeats() { return availableSeats; }
        public double getPrice() { return price; }
    }
}
