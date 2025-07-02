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

public class UserDonationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ngo?useSSL=false";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "abu_1473";
    private static final String SELECT_QUERY = "SELECT first_name, last_name, email, phone, address, amount, donation_date FROM donations WHERE email = ?";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Fetch email from session instead of request parameters
        String userEmail = (String) request.getSession().getAttribute("userEmail"); // CHANGE: get email from session
        System.out.println("User email retrieved from session: " + userEmail); // Log the email retrieved from session

        // If userEmail is missing from session, return an error
        if (userEmail == null || userEmail.isEmpty()) {
            out.println("{\"error\": \"User is not logged in or email is missing from session.\"}"); // CHANGE: error message
            return;
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(SELECT_QUERY)) {

            ps.setString(1, userEmail); // Use session email to query donations
            ResultSet rs = ps.executeQuery();

            // Log number of rows returned and build JSON response in one loop
            StringBuilder jsonResponse = new StringBuilder("[");
            boolean first = true;
            int rowCount = 0;

            while (rs.next()) {
                rowCount++; // Count the number of donations
                System.out.println("Donation Found: " + rs.getString("first_name") + " " + rs.getString("last_name")); // Log donation details

                if (!first) {
                    jsonResponse.append(",");
                }
                first = false;

                jsonResponse.append("{");
                jsonResponse.append("\"first_name\": \"").append(rs.getString("first_name")).append("\",");
                jsonResponse.append("\"last_name\": \"").append(rs.getString("last_name")).append("\",");
                jsonResponse.append("\"email\": \"").append(rs.getString("email")).append("\",");
                jsonResponse.append("\"phone\": \"").append(rs.getString("phone")).append("\",");
                jsonResponse.append("\"address\": \"").append(rs.getString("address")).append("\",");
                jsonResponse.append("\"amount\": \"").append(rs.getString("amount")).append("\",");
                jsonResponse.append("\"date\": \"").append(rs.getString("donation_date")).append("\"");
                jsonResponse.append("}");
            }

            // Log total donations found
            System.out.println("Total donations found: " + rowCount); 

            jsonResponse.append("]");
            out.println(jsonResponse.toString());
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("{\"error\": \"Database error occurred: " + e.getMessage() + "\"}");
        } finally {
            out.close();
        }
    }
}
