package com.bankfraud;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/testdb")
public class TestConnectionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (Connection con = DBConnection.getConnection()) {
            if (con != null) {
                response.getWriter().println("<h1>Database Connected Successfully!</h1>");
            } else {
                response.getWriter().println("<h1>Database Connection Failed!</h1>");
            }
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}