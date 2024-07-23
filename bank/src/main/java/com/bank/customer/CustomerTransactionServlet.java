package com.bank.customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class CustomerTransactionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM transactions WHERE email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("transactions", rs);
                request.getRequestDispatcher("viewTransactions.jsp").forward(request, response);
            } else {
                response.sendRedirect("customerDashboard.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
