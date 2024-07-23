package com.bank.customer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, oldPassword);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ps = con.prepareStatement("UPDATE customer SET password=? WHERE email=?");
                ps.setString(1, newPassword);
                ps.setString(2, email);
                int result = ps.executeUpdate();

                if (result > 0) {
                    response.sendRedirect("customerLogin.jsp?passwordChanged=1");
                } else {
                    response.sendRedirect("changePassword.jsp?error=1");
                }
            } else {
                response.sendRedirect("changePassword.jsp?error=2");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
