package com.bank.customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class DepositFundsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");
        double amount = Double.parseDouble(request.getParameter("amount"));

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

            // Create a PreparedStatement to update the account balance
            PreparedStatement ps = con.prepareStatement("UPDATE customer SET initial_balance = initial_balance + ? WHERE account_no = ?");
            ps.setDouble(1, amount);
            ps.setString(2, accountNo);
            int result = ps.executeUpdate();

            // Check if the update was successful
            if (result > 0) {
                response.sendRedirect("depositFunds.jsp?success=1");
            } else {
                response.sendRedirect("depositFunds.jsp?error=1");
            }

            // Close the connection
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("depositFunds.jsp?error=sql");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("depositFunds.jsp?error=driver");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("depositFunds.jsp?error=unknown");
        }
    }
}
