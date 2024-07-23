<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*,java.sql.*,java.util.*" %>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>

<html>
<head>
    <title>View Customers</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="#" class="logo"><img src="logo1.png" alt="Logo"></a>
        <div>
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="registerCustomer.jsp">Register Customer</a>
            <a href="modifyCustomer.jsp">Modify Customer</a>
            <a href="deleteCustomer.jsp">Delete Customer</a>
            <a href="viewCustomers.jsp">View Customers</a>
            <a href="logout.jsp" class="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>View Customers</h2>
        <table>
            <tr>
                <th>Account No</th>
                <th>Full Name</th>
                <th>Address</th>
                <th>Mobile No</th>
                <th>Email ID</th>
                <th>Account Type</th>
                <th>Initial Balance</th>
                <th>Date of Birth</th>
                <th>ID Proof</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM customer");

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("account_no") + "</td>");
                        out.println("<td>" + rs.getString("full_name") + "</td>");
                        out.println("<td>" + rs.getString("address") + "</td>");
                        out.println("<td>" + rs.getString("mobile_no") + "</td>");
                        out.println("<td>" + rs.getString("email_id") + "</td>");
                        out.println("<td>" + rs.getString("account_type") + "</td>");
                        out.println("<td>" + rs.getDouble("initial_balance") + "</td>");
                        out.println("<td>" + rs.getDate("dob") + "</td>");
                        out.println("<td>" + rs.getString("id_proof") + "</td>");
                        out.println("</tr>");
                    }

                    rs.close();
                    stmt.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</body>
</html>
