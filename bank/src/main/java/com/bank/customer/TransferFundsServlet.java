package com.bank.customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class TransferFundsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String senderAccountNo = request.getParameter("senderAccountNo");
        String receiverAccountNo = request.getParameter("receiverAccountNo");
        double amount = Double.parseDouble(request.getParameter("amount"));

        // Debug statements
        System.out.println("Sender Account Number: " + senderAccountNo);
        System.out.println("Receiver Account Number: " + receiverAccountNo);
        System.out.println("Amount: " + amount);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

            // Begin transaction
            con.setAutoCommit(false);

            // Update sender's balance
            PreparedStatement ps = con.prepareStatement("UPDATE customer SET initial_balance = initial_balance - ? WHERE account_no = ?");
            ps.setDouble(1, amount);
            ps.setString(2, senderAccountNo);
            int result1 = ps.executeUpdate();

            // Update receiver's balance
            ps = con.prepareStatement("UPDATE customer SET initial_balance = initial_balance + ? WHERE account_no = ?");
            ps.setDouble(1, amount);
            ps.setString(2, receiverAccountNo);
            int result2 = ps.executeUpdate();

            // Commit or rollback transaction
            if (result1 > 0 && result2 > 0) {
                // Record the transaction
                ps = con.prepareStatement("INSERT INTO transaction (account_no, type, amount, balance) VALUES (?, 'transfer', ?, (SELECT initial_balance FROM customer WHERE account_no = ?))");
                ps.setString(1, senderAccountNo);
                ps.setDouble(2, amount);
                ps.setString(3, senderAccountNo);
                ps.executeUpdate();

                ps.setString(1, receiverAccountNo);
                ps.setDouble(2, amount);
                ps.setString(3, receiverAccountNo);
                ps.executeUpdate();

                con.commit();
                response.sendRedirect("transferFunds.jsp?success=1");
            } else {
                con.rollback();
                response.sendRedirect("transferFunds.jsp?error=1");
            }

            con.setAutoCommit(true);
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("transferFunds.jsp?error=2");
        }
    }
}
