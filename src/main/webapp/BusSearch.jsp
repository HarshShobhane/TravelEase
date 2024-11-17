<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Search</title>
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
        <section class="search-section">
            <h2>Available Buses</h2>

            <form class="search-form" action="BusSearch.jsp" method="get">
                <label for="from">From</label>
                <input type="text" id="from" name="from" placeholder="Enter departure city" required>

                <label for="to">To</label>
                <input type="text" id="to" name="to" placeholder="Enter destination city" required>

                <button type="submit" class="search-btn">Search Buses</button>
            </form>
            </br>
            

            <div class="bus-list">
                <%
                    String fromCity = request.getParameter("from");
                    String toCity = request.getParameter("to");

                    if (fromCity != null && toCity != null && !fromCity.isEmpty() && !toCity.isEmpty()) {
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TicketReservationSystem", "root", "octane");

                            // SQL query to fetch buses based on departure and destination cities
                            String sql = "SELECT * FROM Buses WHERE departure_city = ? AND destination_city = ?";
                            stmt = conn.prepareStatement(sql);
                            stmt.setString(1, fromCity);
                            stmt.setString(2, toCity);
                            rs = stmt.executeQuery();

                            // If buses are found, display them
                            if (!rs.isBeforeFirst()) {
                                out.println("<p>No buses available for the specified route.</p>");
                            } else {
                                while (rs.next()) {
                                    out.println("<div class='bus-card'>");
                                    out.println("<h3>" + rs.getString("bus_name") + "</h3>");
                                    out.println("<p><strong>Route:</strong> " + rs.getString("departure_city") + " to " + rs.getString("destination_city") + "</p>");
                                    out.println("<p><strong>Departure:</strong> " + rs.getTime("departure_time") + "</p>");
                                    out.println("<p><strong>Arrival:</strong> " + rs.getTime("arrival_time") + "</p>");
                                    out.println("<p><strong>Seats Available:</strong> " + rs.getInt("available_seats") + "</p>");
                                    out.println("<p><strong>Fare:</strong> ₹" + rs.getDouble("price") + "</p>");
                                    out.println("<button class='book-btn'>Book Now</button>");
                                    out.println("</div>");
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<p>An error occurred while fetching bus data.</p>");
                        } finally {
                            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    } else {
                        out.println("<p>Please enter both departure and destination cities to search for buses.</p>");
                    }
                %>
            </div>
        </section>
    </div>

    <footer>
        <p>&copy; 2024 TravelEase. All Rights Reserved.</p>
    </footer>
</body>
</html>
