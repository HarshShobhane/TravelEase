<%
if(session.getAttribute("email") == null) {
    response.sendRedirect("login.jsp");
}
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Booking - Home</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lottie-web/5.7.4/lottie.min.js"></script> <!-- Lottie Library -->
</head>
<body>

    <!-- Header with Logo -->
    <header class="main-header">
        <div class="container">
            <!-- Logo Section -->
            <div class="logo-container">
                <img src="<%= request.getContextPath() %>/images/WebsiteLogo3.png" alt="TravelEase Logo" class="logo">
            </div>

            <!-- Navigation Menu -->
            <nav class="nav-menu">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="userinfo.jsp">User</a></li>
                    <li><a href="#">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Book Your Journey</h1>
            <p>Bus, Flight, and Train Travel, All in One Place</p>
            <div class="search-bar">
                <input type="text" placeholder="From" class="input-box">
                <input type="text" placeholder="To" class="input-box">
                <select class="input-box">
                    <option value="bus">Bus</option>
                    <option value="flight">Flight</option>
                    <option value="train">Train</option>
                </select>
                <button class="search-btn">Search</button>
            </div>
        </div>
    </section>

    <!-- Travel Facilities Section -->
    <section class="facilities">
        <div class="facility" onclick="location.href='BusSearch.jsp'" style="cursor: pointer;">
            <div id="bus-animation" class="animation"></div> <!-- Container for Bus Animation -->
            <h2 style="text-decoration: none;">Bus Travel</h2>
            <p>Comfortable and affordable bus journeys across various destinations.</p>
        </div>
        <div class="facility" onclick="location.href='FlightTravel.jsp'" style="cursor: pointer;">
            <div id="flight-animation" class="animation"></div> <!-- Container for Flight Animation -->
            <h2 style="text-decoration: none;">Flight Travel</h2>
            <p>Book flights at competitive prices with flexible dates and times.</p>
        </div>
        <div class="facility" onclick="location.href='TrainTravel.jsp'" style="cursor: pointer;">
            <div id="train-animation" class="animation"></div> <!-- Container for Train Animation -->
            <h2 style="text-decoration: none;">Train Travel</h2>
            <p>Explore extensive rail routes with our seamless booking process.</p>
        </div>
    </section>

    <!-- Footer Section -->
    <footer class="footer">
        <p>&copy; 2024 TravelEase. All Rights Reserved.</p>
    </footer>

    <script>
        // Load Lottie animations for Bus, Flight, and Train
        lottie.loadAnimation({
            container: document.getElementById('bus-animation'), // Bus animation div
            renderer: 'svg',
            loop: true,
            autoplay: true,
            path: '<%= request.getContextPath() %>/images/BusAnimation.json' // Path to Bus JSON
        });

        lottie.loadAnimation({
            container: document.getElementById('flight-animation'), // Flight animation div
            renderer: 'svg',
            loop: true,
            autoplay: true,
            path: '<%= request.getContextPath() %>/images/FlightAnimation.json' // Path to Flight JSON
        });

        lottie.loadAnimation({
            container: document.getElementById('train-animation'), // Train animation div
            renderer: 'svg',
            loop: true,
            autoplay: true,
            path: '<%= request.getContextPath() %>/images/TrainAnimation.json' // Path to Train JSON
        });

        // Scroll Fade Effect for Header
        window.addEventListener('scroll', function() {
            var header = document.querySelector('.main-header');
            var scrollPosition = window.scrollY; // Get the vertical scroll position
            var fadeStart = 100; // Start fading after scrolling 100px
            var fadeEnd = 300;   // Completely fade out after scrolling 300px

            if (scrollPosition < fadeStart) {
                header.style.opacity = 1; // Full opacity at the top
            } else if (scrollPosition >= fadeStart && scrollPosition <= fadeEnd) {
                // Calculate the opacity based on scroll position between fadeStart and fadeEnd
                var opacity = 1 - (scrollPosition - fadeStart) / (fadeEnd - fadeStart);
                header.style.opacity = opacity;
            } else {
                header.style.opacity = 0; // Completely transparent after fadeEnd
            }
        });
    </script>
    
</body>
</html>
