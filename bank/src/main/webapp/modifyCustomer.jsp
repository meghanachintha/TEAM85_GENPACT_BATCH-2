<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*,java.sql.*" %>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>

<html>
<head>
    <title>Modify Customer</title>
</head>
<body>
    <div class="navbar">
        <a href="#" class="logo"><img src="logo1.png" alt="Logo"></a>
        <div>
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="registerCustomer.jsp">Register Customer</a>
            <a href="viewCustomers.jsp">View Customers</a>
            <a href="deleteCustomer.jsp">Delete Customer</a>
            <a href="logout.jsp" class="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>Modify Customer</h2>
        <%
            String error = request.getParameter("error");
            if (error != null) {
                if (error.equals("account_not_found")) {
                    out.println("<p class='error'>Cannot modify customer: Account not found.</p>");
                } else {
                    out.println("<p class='error'>An error occurred. Please try again.</p>");
                }
            }
        %>
        <form action="ModifyCustomerServlet" method="post">
            Account No: <input type="text" name="accountNo" required><br><br>
            Full Name: <input type="text" name="fullName" required><br><br>
            Address: <input type="text" name="address" required><br><br>
            Mobile No: <input type="text" name="mobileNo" required><br><br>
            Email ID: <input type="email" name="emailId" required><br><br>
            Type of Account: 
            <select name="accountType" required>
                <option value="Saving">Saving</option>
                <option value="Current">Current</option>
            </select><br><br>
            Date of Birth: <input type="date" name="dob" required><br><br>
            ID Proof: <input type="text" name="idProof" required><br><br>
            <input type="submit" value="Modify">
        </form>
    </div>
</body>
</html>
