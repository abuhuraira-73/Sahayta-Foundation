package org.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ngo?useSSL=false";  // Ensure useSSL=false
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "abu_1473";

    // Update the SQL query to use user_details table
    private static final String SELECT_QUERY = "SELECT * FROM user_details WHERE uemail = ? AND upass = ?";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Fetch form data
        String uemail = request.getParameter("uemail");
        String upass = request.getParameter("upass");

        // Test database connection and load MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Ensure the MySQL driver is loaded
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            
            if (conn != null) {
                System.out.println("Connection established successfully in LoginProcess servlet.");
            } else {
                out.println("<h3>Error: Unable to establish database connection.</h3>");
                return;  // Stop further processing if connection fails
            }

            // Initialize PreparedStatement for the query
            try (PreparedStatement ps = conn.prepareStatement(SELECT_QUERY)) {
                // Set parameters for the query
                ps.setString(1, uemail);
                ps.setString(2, upass);  // Compare passwords as is (recommend using hashing)

                // Execute the query
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // User exists, fetch their details
                    String username = rs.getString("uname");  // Assuming "uname" column in your DB
                    String role = rs.getString("role");  // Assuming "role" column (could be 'user' or 'admin')

                    // Create a session and set attributes
                    HttpSession session = request.getSession();
                    session.setAttribute("user", username);  // Store the username in session
                    session.setAttribute("userEmail", uemail);  // Optionally store the email as well
                    session.setAttribute("role", role);  // Store the user role (admin or user)

                    // Check if the user is admin or regular user and redirect accordingly
                    if ("admin".equalsIgnoreCase(role)) {
                        response.sendRedirect("Views/index.jsp");  // Admin dashboard
                    } else if ("user".equalsIgnoreCase(role)) {
                        response.sendRedirect("Views/index.jsp");  // Regular user dashboard
                    } else {
                        out.println("<h3>Error: Invalid login attempt.</h3>");
                        request.getRequestDispatcher("login.jsp").include(request, response);  // Stay on the login page
                    }
                } else {
                    // Invalid credentials
                    out.println("<h3>Invalid email or password. Please try again.</h3>");
                    request.getRequestDispatcher("login.jsp").include(request, response);  // Stay on the login page
                }

            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Error: " + e.getMessage() + "</h3>");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<h3>Error: MySQL JDBC driver not found.</h3>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            out.close();
        }
    }
}
