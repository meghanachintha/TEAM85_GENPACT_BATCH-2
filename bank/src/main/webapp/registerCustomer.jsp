<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*,java.sql.*" %>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>

<html>
<head>
    <title>Register Customer</title>
</head>
<body>
    <div class="navbar">
        <a href="#" class="logo"><img src="logo1.png" alt="Logo"></a>
        <div>
            <a href="adminDashboard.jsp">Dashboard</a>
            <a href="modifyCustomer.jsp">Modify Customer</a>
            <a href="viewCustomers.jsp">View Customers</a>
            <a href="deleteCustomer.jsp">Delete Customer</a>
            <a href="logout.jsp" class="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>Register Customer</h2>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
                out.println("<p class='error'>" + error + "</p>");
            }
        %>
        <form action="RegisterCustomerServlet" method="post">
            Full Name: <input type="text" name="fullName" value="<%= request.getParameter("fullName") != null ? request.getParameter("fullName") : "" %>" required><br><br>
            Address: <input type="text" name="address" value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>" required><br><br>
            Mobile No: <input type="text" name="mobileNo" value="<%= request.getParameter("mobileNo") != null ? request.getParameter("mobileNo") : "" %>" required><br><br>
            Email ID: <input type="email" name="emailId" value="<%= request.getParameter("emailId") != null ? request.getParameter("emailId") : "" %>" required><br><br>
            Type of Account: 
            <select name="accountType" required>
                <option value="Saving" <%= "Saving".equals(request.getParameter("accountType")) ? "selected" : "" %>>Saving</option>
                <option value="Current" <%= "Current".equals(request.getParameter("accountType")) ? "selected" : "" %>>Current</option>
            </select><br><br>
            Initial Balance: <input type="number" name="initialBalance" value="<%= request.getParameter("initialBalance") != null ? request.getParameter("initialBalance") : "" %>" required><br><br>
            Date of Birth: <input type="date" name="dob" value="<%= request.getParameter("dob") != null ? request.getParameter("dob") : "" %>" required><br><br>
            ID Proof: <input type="text" name="idProof" value="<%= request.getParameter("idProof") != null ? request.getParameter("idProof") : "" %>" required><br><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
