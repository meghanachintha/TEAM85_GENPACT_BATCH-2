<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*,java.sql.*" %>

<html>
<head>
    <title>Withdraw Funds</title>
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
        <h2>Withdraw Funds</h2>
        <form action="WithdrawFundsServlet" method="post">
            <input type="hidden" name="accountNo" value="<%= request.getAttribute("accountNo") %>" />
            <label for="amount">Amount to Withdraw:</label>
            <input type="number" id="amount" name="amount" required />
            <button type="submit">Withdraw</button>
        </form>

        <% 
            String success = request.getParameter("success");
            String error = request.getParameter("error");
            if ("1".equals(success)) { 
        %>
            <p style="color:green;">Withdrawal successful!</p>
        <% 
            } else if ("1".equals(error)) { 
        %>
            <p style="color:red;">Error occurred during withdrawal. Please try again.</p>
        <% 
            } else if ("insufficient".equals(error)) { 
        %>
            <p style="color:red;">Insufficient balance. Please check your balance and try again.</p>
        <% 
            } else if ("account".equals(error)) { 
        %>
            <p style="color:red;">Account not found. Please check your account number.</p>
        <% 
            } else if ("sql".equals(error)) { 
        %>
            <p style="color:red;">SQL Error occurred. Please check the database connection and query.</p>
        <% 
            } else if ("driver".equals(error)) { 
        %>
            <p style="color:red;">Driver Error occurred. Please check the JDBC driver.</p>
        <% 
            } else if ("unknown".equals(error)) { 
        %>
            <p style="color:red;">An unknown error occurred. Please try again later.</p>
        <% 
            } 
        %>
    </div>
</body>
</html>
