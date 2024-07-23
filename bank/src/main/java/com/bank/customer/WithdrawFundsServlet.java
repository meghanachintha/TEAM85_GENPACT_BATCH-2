package com.bank.customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class WithdrawFundsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");
        double amount = Double.parseDouble(request.getParameter("amount"));

        System.out.println("WithdrawFundsServlet: accountNo=" + accountNo + ", amount=" + amount);

        Connection con = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

            // Start transaction
            con.setAutoCommit(false);

            // Verify account number exists and has sufficient balance
            PreparedStatement verifyPs = con.prepareStatement("SELECT initial_balance FROM customer WHERE account_no = ?");
            verifyPs.setString(1, accountNo);
            ResultSet rs = verifyPs.executeQuery();

            if (rs.next()) {
                double currentBalance = rs.getDouble("initial_balance");
                if (currentBalance >= amount) {
                    // Sufficient balance, proceed with the update
                    PreparedStatement ps = con.prepareStatement("UPDATE customer SET initial_balance = initial_balance - ? WHERE account_no = ?");
                    ps.setDouble(1, amount);
                    ps.setString(2, accountNo);
                    int result = ps.executeUpdate();

                    // Log the transaction
                    PreparedStatement logPs = con.prepareStatement("INSERT INTO transaction (account_no, type, amount, balance) VALUES (?, ?, ?, ?)");
                    logPs.setString(1, accountNo);
                    logPs.setString(2, "withdraw");
                    logPs.setDouble(3, amount);
                    logPs.setDouble(4, currentBalance - amount);
                    logPs.executeUpdate();

                    // Check if the update was successful
                    if (result > 0) {
                        con.commit();
                        System.out.println("Withdrawal successful");
                        response.sendRedirect("withdrawFunds.jsp?success=1");
                    } else {
                        con.rollback();
                        System.out.println("Withdrawal failed: No rows updated");
                        response.sendRedirect("withdrawFunds.jsp?error=1");
                    }

                    ps.close();
                    logPs.close();
                } else {
                    con.rollback();
                    // Insufficient balance
                    System.out.println("Withdrawal failed: Insufficient balance");
                    response.sendRedirect("withdrawFunds.jsp?error=insufficient");
                }
            } else {
                con.rollback();
                System.out.println("Withdrawal failed: Account not found");
                response.sendRedirect("withdrawFunds.jsp?error=account");
            }

            verifyPs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            response.sendRedirect("withdrawFunds.jsp?error=sql");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("withdrawFunds.jsp?error=driver");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("withdrawFunds.jsp?error=unknown");
        } finally {
            try {
                if (con != null && !con.isClosed()) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
