package com.bank.customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class ViewAccountDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

            // Prepare the SQL statement
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE account_no=?");
            ps.setString(1, accountNo);
            ResultSet rs = ps.executeQuery();

            // Check if customer exists
            if (rs.next()) {
                // Set customer details as request attributes
                request.setAttribute("fullName", rs.getString("full_name"));
                request.setAttribute("address", rs.getString("address"));
                request.setAttribute("mobileNo", rs.getString("mobile_no"));
                request.setAttribute("email", rs.getString("email_id"));
                request.setAttribute("accountType", rs.getString("account_type"));
                request.setAttribute("initialBalance", rs.getString("initial_balance"));
                request.setAttribute("dob", rs.getString("dob"));
                request.setAttribute("idProof", rs.getString("id_proof"));

                // Forward to viewAccountDetails.jsp
                request.getRequestDispatcher("viewAccountDetails.jsp").forward(request, response);
            } else {
                // Redirect to login if account not found
                response.sendRedirect("customerLogin.jsp");
            }

            // Close resources
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewAccountDetails.jsp?error=sql");
        }
    }
}
