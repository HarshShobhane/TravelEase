<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.registration.servlets.BusBookingServlet.Bus" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Buses</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/ShowBuses.css">
</head>
<body>
    <header class="main-header">
        <h1>Available Buses</h1>
        <a href="BusTravel.jsp">Back to Search</a>
    </header>

    <div class="bus-container">
        <% 
            // Retrieve the list of available buses from the request attribute
            List<Bus> availableBuses = (List<Bus>) request.getAttribute("availableBuses");

            if (availableBuses != null && !availableBuses.isEmpty()) { 
                for (Bus bus : availableBuses) { 
        %>
            <div class="bus-card">
                <h2><%= bus.getBusName() %></h2>
                <p><strong>Route:</strong> <%= bus.getDepartureCity() %> to <%= bus.getDestinationCity() %></p>
                <p><strong>Departure Time:</strong> <%= bus.getDepartureTime() %></p>
                <p><strong>Arrival Time:</strong> <%= bus.getArrivalTime() %></p>
                <p><strong>Available Seats:</strong> <%= bus.getAvailableSeats() %></p>
                <p><strong>Price:</strong> ₹<%= bus.getPrice() %></p>
                <button class="book-btn">Book Now</button>
            </div>
        <% 
                }
            } else { 
        %>
            <p>No buses available for the selected route and date.</p>
        <% 
            } 
        %>
    </div>

    <footer>
        <p>&copy; 2024 TravelEase. All Rights Reserved.</p>
    </footer>
</body>
</html>
