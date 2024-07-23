<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String fullName = (String) request.getAttribute("fullName");
    String address = (String) request.getAttribute("address");
    String mobileNo = (String) request.getAttribute("mobileNo");
    String email = (String) request.getAttribute("email");
    String accountType = (String) request.getAttribute("accountType");
    String initialBalance = (String) request.getAttribute("initialBalance");
    String dob = (String) request.getAttribute("dob");
    String idProof = (String) request.getAttribute("idProof");

    if (fullName == null || address == null || mobileNo == null || email == null || accountType == null || initialBalance == null || dob == null || idProof == null) {
        response.sendRedirect("customerLogin.jsp");
        return;
    }
%>
<html>
<head>
    <title>View Account Details</title>
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
        <h2>Account Details</h2>
        <p>Full Name: <%= fullName %></p>
        <p>Address: <%= address %></p>
        <p>Mobile No: <%= mobileNo %></p>
        <p>Email ID: <%= email %></p>
        <p>Account Type: <%= accountType %></p>
        <p>Initial Balance: <%= initialBalance %></p>
        <p>Date of Birth: <%= dob %></p>
        <p>ID Proof: <%= idProof %></p>
    </div>
</body>
</html>
