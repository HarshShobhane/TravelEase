<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Bus Ticket Booking</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/BusTravel.css">
</head>
<body>
    <header class="main-header">
        <nav>
            <div class="logo">TravelEase</div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="buses.jsp">Buses</a></li>
                <li><a href="support.jsp">Support</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <!-- Search Section -->
        <section class="booking-section">
            <div class="search-bar">
                <h2>Book Your Bus Tickets</h2>
               <form class="search-form" action="<%= request.getContextPath() %>/BusBooking" method="get">
               

                    <label for="from">From</label>
                    <input type="text" id="from" name="from" placeholder="Enter departure city" required aria-label="Departure city">
                    
                    <label for="to">To</label>
                    <input type="text" id="to" name="to" placeholder="Enter destination city" required aria-label="Destination city">
                    
                    <label for="date">Travel Date</label>
                    <input type="date" id="date" name="date" required aria-label="Travel date">
                    
                    <button type="submit" class="search-btn">Search Buses</button>
                </form>
            </div>
        </section>

        <!-- Featured Routes Section -->
        <section class="featured-routes">
            <h2>Featured Routes</h2>
            <div class="bus-card">
                <div class="bus-info">
                    <h3>Shine Tour and Travels</h3>
                    <p>Route: Udaipur to Jodhpur</p>
                    <p>Departure: 11:00 AM</p>
                    <p>Arrival: 1:00 PM</p>
                    <p>Seats Available: 20</p>
                    <p>Fare: ₹430.00</p>
                </div>
                <button class="book-btn">Book Now</button>
            </div>

            <div class="bus-card">
                <div class="bus-info">
                    <h3>EZBUS</h3>
                    <p>Route: Ahmedabad to Surat</p>
                    <p>Departure: 6:00 AM</p>
                    <p>Arrival: 8:00 AM</p>
                    <p>Seats Available: 30</p>
                    <p>Fare: ₹290.00</p>
                </div>
                <button class="book-btn">Book Now</button>
            </div>

            <div class="bus-card">
                <div class="bus-info">
                    <h3>Shree Yadav Travels</h3>
                    <p>Route: Kolkata to Varanasi</p>
                    <p>Departure: 8:00 AM</p>
                    <p>Arrival: 11:00 PM</p>
                    <p>Seats Available: 30</p>
                    <p>Fare: ₹420.00</p>
                </div>
                <button class="book-btn">Book Now</button>
            </div>
        </section>
    </div>

    <footer>
        <p>&copy; 2024 TravelEase. All Rights Reserved.</p>
    </footer>
</body>
</html>
