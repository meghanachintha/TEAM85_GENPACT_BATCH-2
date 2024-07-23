<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transfer Funds</title>
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
        <a href="customerDashboard.jsp?accountNo=<%= request.getParameter("accountNo") %>">Dashboard</a>
        <a href="viewAccountDetails.jsp?accountNo=<%= request.getParameter("accountNo") %>">View Account Details</a>
        <a href="depositFunds.jsp?accountNo=<%= request.getParameter("accountNo") %>">Deposit Funds</a>
        <a href="withdrawFunds.jsp?accountNo=<%= request.getParameter("accountNo") %>">Withdraw Funds</a>
        <a href="transferFunds.jsp?accountNo=<%= request.getParameter("accountNo") %>">Transfer Funds</a>
        <a href="viewTransactionHistory.jsp?accountNo=<%= request.getParameter("accountNo") %>">View Transaction History</a>
        <a href="changePassword.jsp?accountNo=<%= request.getParameter("accountNo") %>">Change Password</a>
        <a href="customerLogout.jsp" class="logout">Logout</a>
    </div>

    <div class="container">
        <h2>Transfer Funds</h2>
        <form action="TransferFundsServlet" method="post">
            <input type="hidden" name="senderAccountNo" value="<%= request.getParameter("accountNo") %>" />
            <label for="receiverAccountNo">Recipient Account Number:</label>
            <input type="text" id="receiverAccountNo" name="receiverAccountNo" required />
            <label for="amount">Amount to Transfer:</label>
            <input type="number" id="amount" name="amount" required />
            <button type="submit">Transfer</button>
        </form>

        <% 
            String success = request.getParameter("success");
            String error = request.getParameter("error");
            if ("1".equals(success)) { 
        %>
            <p style="color:green;">Transfer successful!</p>
        <% 
            } else if ("1".equals(error)) { 
        %>
            <p style="color:red;">Error during transfer. Please try again.</p>
        <% 
            } else if ("2".equals(error)) { 
        %>
            <p style="color:red;">An unexpected error occurred. Please contact support.</p>
        <% 
            } 
        %>
    </div>
</body>
</html>
