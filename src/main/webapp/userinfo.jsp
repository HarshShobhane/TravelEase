<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Link to the external CSS file -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/userinfo.css">
</head>
<body>
    <div class="user-info-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile-section">
                <!-- Dynamic Profile Picture -->
                <img src="<%= request.getContextPath() %>/images/ProfileLogo.png" alt="Profile Picture" class="profile-pic">
                
                <!-- Display user's name dynamically -->
                <h2 class="user-name">
                    <%
                        String userName = (String) session.getAttribute("userName");
                        if (userName != null) {
                            out.print(userName);
                        } else {
                            out.print("Guest");
                        }
                    %>
                </h2>
            </div>
            <!-- Navigation Menu -->
            <ul class="menu-list">
                <li><a href="#" onclick="showSection('profile')">Profile</a></li>
                <li><a href="#" onclick="showSection('login-details')">Login Details</a></li>
                <li><a href="login.jsp">Logout</a></li>
            </ul>
        </div>

        <!-- Main Content Section -->
        <div class="content">
            <!-- Profile Section -->
            <div id="profile-section" class="content-section">
                <h3>Personal Information</h3>
                <!-- Display user information dynamically -->
                <div class="info-row">
                    <span class="label">Name:</span>
                    <span class="value"><%= userName != null ? userName : "Unknown" %></span>
                </div>
                <div class="info-row">
                    <span class="label">Birthday:</span>
                    <span class="value"><%= session.getAttribute("birthday") != null ? session.getAttribute("birthday") : "Not provided" %></span>
                </div>
                <div class="info-row">
                    <span class="label">Gender:</span>
                    <span class="value"><%= session.getAttribute("gender") != null ? session.getAttribute("gender") : "Not provided" %></span>
                </div>
                <div class="info-row">
                    <span class="label">Marital Status:</span>
                    <span class="value"><%= session.getAttribute("maritalStatus") != null ? session.getAttribute("maritalStatus") : "Not provided" %></span>
                </div>
                <div class="info-row">
                    <span class="label">Address:</span>
                    <span class="value"><%= session.getAttribute("address") != null ? session.getAttribute("address") : "Not provided" %></span>
                </div>
                <div class="info-row">
                    <span class="label">Pincode:</span>
                    <span class="value"><%= session.getAttribute("pincode") != null ? session.getAttribute("pincode") : "Not provided" %></span>
                </div>
                <div class="info-row">
                    <span class="label">State:</span>
                    <span class="value"><%= session.getAttribute("state") != null ? session.getAttribute("state") : "Not provided" %></span>
                </div>

                <!-- Edit Profile Button -->
                <a href="editProfile.jsp" class="edit-profile-button">Edit Profile</a>
            </div>

            <!-- Login Details Section -->
            <div id="login-details-section" class="content-section" style="display: none;">
                <h3>Login Information</h3>
                <!-- Add dynamic content related to login details here -->
            </div>
        </div>
    </div>

    <script>
        function showSection(sectionId) {
            // Hide all sections
            document.getElementById('profile-section').style.display = 'none';
            document.getElementById('login-details-section').style.display = 'none';

            // Show selected section
            document.getElementById(sectionId + '-section').style.display = 'block';
        }
    </script>
</body>
</html>
