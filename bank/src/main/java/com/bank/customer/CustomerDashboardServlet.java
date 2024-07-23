package com.bank.customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class CustomerDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = (String) request.getAttribute("accountNo");

        if (accountNo == null) {
            response.sendRedirect("customerLogin.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE account_no=?");
            ps.setString(1, accountNo);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("customer", rs);
                request.getRequestDispatcher("customerDashboard.jsp").forward(request, response);
            } else {
                response.sendRedirect("customerLogin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("customerLogin.jsp");
        }
    }
}
