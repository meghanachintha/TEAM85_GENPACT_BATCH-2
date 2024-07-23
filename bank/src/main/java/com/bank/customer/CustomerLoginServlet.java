package com.bank.customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class CustomerLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNumber");
        String password = request.getParameter("password");

        // Debug statements
        System.out.println("Received accountNumber: " + accountNo);
        System.out.println("Received password: " + password);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE account_no=? AND password=?");
            ps.setString(1, accountNo);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("Login successful for accountNo: " + accountNo);
                request.setAttribute("accountNo", accountNo);
                RequestDispatcher dispatcher = request.getRequestDispatcher("customerDashboard.jsp");
                dispatcher.forward(request, response);
            } else {
                System.out.println("Invalid credentials for accountNo: " + accountNo);
                response.sendRedirect("customerLogin.jsp?error=1");
            }

            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("customerLogin.jsp?error=2");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("customerLogin.jsp?error=3");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("customerLogin.jsp?error=4");
        }
    }
}
