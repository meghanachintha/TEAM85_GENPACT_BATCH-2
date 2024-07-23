<!-- changePassword.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*,java.sql.*" %>
<%
    String accountNo = (String) request.getAttribute("accountNo");
    if (accountNo == null) {
        response.sendRedirect("customerLogin.jsp");
        return;
    }
%>
<html>
<head>
    <title>Change Password</title>
    <style>
        .navbar {
            background-color: #333;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .logout {
            float: right;
        }
        .container {
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="customerDashboard.jsp">Dashboard</a>
        <a href="viewAccountDetails.jsp">View Account Details</a>
        <a href="depositFunds.jsp">Deposit Funds</a>
        <a href="withdrawFunds.jsp">Withdraw Funds</a>
        <a href="transferFunds.jsp">Transfer Funds</a>
        <a href="viewTransactionHistory.jsp">View Transaction History</a>
        <a href="changePassword.jsp">Change Password</a>
        <a href="customerLogout.jsp" class="logout">Logout</a>
    </div>

    <div class="container">
        <h2>Change Password</h2>
        <form action="changePassword" method="post">
            <input type="hidden" name="accountNo" value="<%= accountNo %>" />
            <label for="currentPassword">Current Password:</label>
            <input type="password" id="currentPassword" name="currentPassword" required />
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required />
            <label for="confirmNewPassword">Confirm New Password:</label>
            <input type="password" id="confirmNewPassword" name="confirmNewPassword" required />
            <button type="submit">Change Password</button>
        </form>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p style="color:red;"><%= errorMessage %></p>
        <%
            }
        %>
    </div>
</body>
</html>
