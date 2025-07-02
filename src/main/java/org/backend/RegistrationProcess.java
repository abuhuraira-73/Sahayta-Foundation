package org.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationServlet")
public class RegistrationProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ngo";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "abu_1473";

    // Update the SQL query to use user_details table
    private static final String INSERT_QUERY = "INSERT INTO user_details (uname, uemail, uphno, upass) VALUES (?, ?, ?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Fetch form data
        String uname = request.getParameter("uname");
        String uemail = request.getParameter("uemail");
        String uphno = request.getParameter("uphno");
        String upass = request.getParameter("upass");

        // Debugging: Test database connection
        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn != null) {
                System.out.println("Connection established successfully in RegistrationProcess servlet.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>Error: Database connection failed. Check the console for details.</h3>");
            return; // Stop further processing if connection fails
        }

        // Initialize JDBC connection and insert data into user_details table
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(INSERT_QUERY)) {

            // Set parameters for the query
            ps.setString(1, uname);
            ps.setString(2, uemail);
            ps.setString(3, uphno);
            ps.setString(4, upass);  // Store password as is (consider hashing passwords in a real-world app)

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Registration successful
            	response.sendRedirect("Views/login.jsp?message=You%20are%20registered,%20please%20login.");

            } else {
                // Registration failed
                out.println("<h3>Registration failed. Please try again.</h3>");
                request.getRequestDispatcher("register.jsp").include(request, response);  // Stay on registration page
            }

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            out.close();
        }
    }
}
