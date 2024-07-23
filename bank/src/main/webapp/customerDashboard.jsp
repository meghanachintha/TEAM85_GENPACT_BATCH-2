<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
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
        <h2>Welcome to your Dashboard</h2>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p style="color:green;"><%= message %></p>
        <%
            }
        %>
    </div>
</body>
</html>
