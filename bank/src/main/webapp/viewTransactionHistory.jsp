<!-- viewTransactionHistory.jsp -->
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
    <title>View Transaction History</title>
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
        <h2>Transaction History</h2>
        <table border="1">
            <tr>
                <th>Date</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Balance</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

                    PreparedStatement ps = con.prepareStatement("SELECT * FROM transactions WHERE account_no = ? ORDER BY date DESC");
                    ps.setString(1, accountNo);
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        String date = rs.getString("date");
                        String type = rs.getString("type");
                        String amount = rs.getString("amount");
                        String balance = rs.getString("balance");
            %>
                        <tr>
                            <td><%= date %></td>
                            <td><%= type %></td>
                            <td><%= amount %></td>
                            <td><%= balance %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</body>
</html>
