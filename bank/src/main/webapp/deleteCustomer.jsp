<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*,java.sql.*" %>

<%
    
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>

<html>
<head>
    <title>Delete Customer</title>
    
</head>
<body>
    <div class="navbar">
        <a href="#" class="logo"><img src="logo1.png" alt="Logo"></a>
        <div>
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="registerCustomer.jsp">Register Customer</a>
            <a href="viewCustomers.jsp">View Customers</a>
            <a href="modifyCustomer.jsp">Modify Customer</a>
            <a href="logout.jsp" class="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>Delete Customer</h2>
        <%
            String error = request.getParameter("error");
            if (error != null) {
                if (error.equals("balance_not_zero")) {
                    out.println("<p class='error'>Cannot delete customer: Balance is not zero.</p>");
                } else if (error.equals("account_not_found")) {
                    out.println("<p class='error'>Cannot delete customer: Account not found.</p>");
                } else {
                    out.println("<p class='error'>An error occurred. Please try again.</p>");
                }
            }
        %>
        <form action="DeleteCustomerServlet" method="post">
            Account No: <input type="text" name="accountNo" required><br>
            <input type="submit" value="Delete">
        </form>
    </div>
</body>
</html>
