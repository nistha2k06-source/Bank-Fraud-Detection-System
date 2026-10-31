
package com.bankfraud;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;

@WebServlet("/TransactionServlet")
public class TransactionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {
            int accountId = Integer.parseInt(request.getParameter("accountId"));
            String type = request.getParameter("type");
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));

            try (Connection con = DBConnection.getConnection();
                 CallableStatement cs = con.prepareCall(
                     "{CALL make_transaction(?,?,?)}")) {

                cs.setInt(1, accountId);
                cs.setString(2, type);
                cs.setBigDecimal(3, amount);
                cs.execute();

                response.getWriter().println(
                    "<h2>Transaction Successful!</h2>");
            }

        } catch (Exception e) {
            response.getWriter().println(
                "<h2>Transaction Failed!</h2>");
            response.getWriter().println(e.getMessage());
        }
    }
}

