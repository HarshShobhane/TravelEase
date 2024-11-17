<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
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
                <h3>Edit Personal Information</h3>
                <!-- Form to capture and update user data -->
                <form action="updateprofile" method="post">
                    <!-- Hidden input field for userId -->
                    <input type="hidden" name="userId" value="<%= session.getAttribute("userId")%>">

                    <div class="info-row">
                        <span class="label">Name:</span>
                        <span class="value"><%= userName != null ? userName : "Unknown" %></span>
                    </div>
                    <br>
                    <div class="info-row">
                        <span class="label">Birthday:</span>
                        <input type="date" name="birthday" class="value" value="<%= session.getAttribute("birthday") %>" required>
                    </div>
                    <br>
                    <div class="info-row">
                        <span class="label">Gender:</span>
                        <select name="gender" class="value" required>
                            <option value="Male" <%= "Male".equals(session.getAttribute("gender")) ? "selected" : "" %>>Male</option>
                            <option value="Female" <%= "Female".equals(session.getAttribute("gender")) ? "selected" : "" %>>Female</option>
                            <option value="Other" <%= "Other".equals(session.getAttribute("gender")) ? "selected" : "" %>>Other</option>
                        </select>
                    </div>
                    <br>
                    <div class="info-row">
                        <span class="label">Marital Status:</span>
                        <select name="maritalStatus" class="value" required>
                            <option value="Single" <%= "Single".equals(session.getAttribute("maritalStatus")) ? "selected" : "" %>>Single</option>
                            <option value="Married" <%= "Married".equals(session.getAttribute("maritalStatus")) ? "selected" : "" %>>Married</option>
                        </select>
                    </div>
                    <br>
                    <div class="info-row">
                        <span class="label">Address:</span>
                        <input type="text" name="address" class="value" value="<%= session.getAttribute("address") %>" required>
                    </div>
                    <br>
                    <div class="info-row">
                        <span class="label">Pincode:</span>
                        <input type="text" name="pincode" class="value" value="<%= session.getAttribute("pincode") %>" required>
                    </div>
                    <br>
                    <div class="info-row">
                        <span class="label">State:</span>
                        <input type="text" name="state" class="value" value="<%= session.getAttribute("state") %>" required>
                    </div>
                    <br>
                    <button type="submit">Save Changes</button>
                </form>
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
