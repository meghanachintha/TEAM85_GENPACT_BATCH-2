<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%
  
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>
<html>
<head>
    <title>Admin Dashboard</title>
  <style>
        body {
            background-image: url('bankbg.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
        }

        .dashboard-container {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        .card {
            background: rgba(255, 255, 255, 0.8);
            border: none;
            border-radius: 15px;
            margin: 10px;
            width: 300px;
        }

        .card-header {
            background-color: #000000;
            color: white;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            text-align: center;
        }

        .btn-primary {
            background-color: #000000;
            border: none;
        }

        .btn-primary:hover {
            background-color: #000000;
        }
    </style>  
</head>
<body>
    <div class="overlay">
        <div class="navbar">
            <a href="#" class="logo"><img src="logo1.png" alt="Logo"></a>
            <a href="logout.jsp" class="logout">Logout</a>
        </div>

        <div class="container">
            <h2>Admin Dashboard</h2>
            <div class="buttons">
                <div class="button-container">
                    <img src="1.gif" alt="Register Customer" height= "150px" width= "200px">
                    <a href="registerCustomer.jsp">Register Customer</a>
                </div>
                <div class="button-container">
                    <img src="2.gif" alt="Modify Customer" height= "150px" width= "200px">
                    <a href="modifyCustomer.jsp">Modify Customer </a>
                </div>
                <div class="button-container">
                    <img src="3.gif" alt="Delete Customer" height= "150px" width= "200px">
                    <a href="deleteCustomer.jsp">Delete Customer</a>
                </div>
                <div class="button-container">
                    <img src="4.gif" alt="View Customers" height= "150px" width= "200px">
                    <a href="viewCustomers.jsp">View Customers</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>