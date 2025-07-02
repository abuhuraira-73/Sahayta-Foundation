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

public class DonationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ngo?useSSL=false";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "abu_1473";

    // SQL query to insert donation details into the database
    private static final String INSERT_QUERY = "INSERT INTO donations (first_name, last_name, email, phone, address, amount) VALUES (?, ?, ?, ?, ?, ?)";
    // SQL query to fetch donation details for a user
    private static final String SELECT_QUERY = "SELECT first_name, last_name, email, phone, address, amount, donation_date FROM donations WHERE email = ?";
    // SQL query to fetch all donation details
    private static final String SELECT_ALL_QUERY = "SELECT first_name, last_name, email, phone, address, amount, donation_date FROM donations";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Get the email parameter if available (for user-specific queries)
        String userEmail = request.getParameter("email");

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            if (conn != null) {
                System.out.println("Connection established successfully.");
            } else {
                out.println("{\"error\": \"Unable to establish database connection.\"}");
                return;
            }

            // Fetch donation details based on user email if available
            String queryToUse = userEmail != null && !userEmail.trim().isEmpty() ? SELECT_QUERY : SELECT_ALL_QUERY;

            try (PreparedStatement ps = conn.prepareStatement(queryToUse)) {
                if (userEmail != null && !userEmail.trim().isEmpty()) {
                    ps.setString(1, userEmail);
                }

                ResultSet rs = ps.executeQuery();
                StringBuilder jsonResponse = new StringBuilder();
                jsonResponse.append("[");

                boolean first = true;
                while (rs.next()) {
                    if (!first) {
                        jsonResponse.append(",");
                    }
                    first = false;
                    jsonResponse.append("{");
                    jsonResponse.append("\"first_name\": \"" + rs.getString("first_name") + "\",");
                    jsonResponse.append("\"last_name\": \"" + rs.getString("last_name") + "\",");
                    jsonResponse.append("\"email\": \"" + rs.getString("email") + "\",");
                    jsonResponse.append("\"phone\": \"" + rs.getString("phone") + "\",");
                    jsonResponse.append("\"address\": \"" + rs.getString("address") + "\",");
                    jsonResponse.append("\"amount\": \"" + rs.getString("amount") + "\",");
                    jsonResponse.append("\"date\": \"" + rs.getString("donation_date") + "\"");
                    jsonResponse.append("}");
                }

                jsonResponse.append("]");

                // Send donation data to the client
                out.println(jsonResponse.toString());
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("{\"error\": \"" + e.getMessage() + "\"}");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("{\"error\": \"MySQL JDBC driver not found.\"}");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("{\"error\": \"" + e.getMessage() + "\"}");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Fetch form data
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String amount = request.getParameter("amount");

        // Test database connection and load MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure the MySQL driver is loaded
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);

            if (conn != null) {
                System.out.println("Connection established successfully in DonationServlet.");
            } else {
                out.println("<h3>Error: Unable to establish database connection.</h3>");
                return; // Stop further processing if connection fails
            }

            // Prepare the SQL insert statement
            try (PreparedStatement ps = conn.prepareStatement(INSERT_QUERY)) {
                // Set parameters for the SQL query
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, phone);
                ps.setString(5, address);
                ps.setString(6, amount); 

                // Execute the query and insert the data into the database
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<h3>Thank you for your donation!</h3>");
                    response.sendRedirect("Views/donation-success.jsp"); // Redirect to a success page after donation
                } else {
                    out.println("<h3>Error: Donation could not be processed. Please try again.</h3>");
                    request.getRequestDispatcher("make-donation.jsp").include(request, response); // Stay on the donation page if there was an error
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
