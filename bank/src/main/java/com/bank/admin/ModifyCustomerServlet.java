package com.bank.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class ModifyCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobileNo");
        String emailId = request.getParameter("emailId");
        String accountType = request.getParameter("accountType");
        String dob = request.getParameter("dob");
        String idProof = request.getParameter("idProof");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "computer");

            String updateQuery = "UPDATE customer SET full_name=?, address=?, mobile_no=?, email_id=?, account_type=?, dob=?, id_proof=? WHERE account_no=?";
            PreparedStatement ps = con.prepareStatement(updateQuery);
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, mobileNo);
            ps.setString(4, emailId);
            ps.setString(5, accountType);
            ps.setString(6, dob);
            ps.setString(7, idProof);
            ps.setString(8, accountNo);
            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("adminDashboard.jsp?success=1");
            } else {
                response.sendRedirect("modifyCustomer.jsp?error=account_not_found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("modifyCustomer.jsp?error=1");
        }
    }
}