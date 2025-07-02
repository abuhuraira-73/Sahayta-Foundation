package org.backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // Database credentials
    private static final String URL = "jdbc:mysql://localhost:3306/ngo";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "abu_1473";

    // Static method to get a connection
    public static Connection getConnection() throws SQLException {
        try {
            // Ensure the MySQL driver is loaded
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Return the connection
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            throw new SQLException("Database connection failed: " + e.getMessage());
        }
    }
}
