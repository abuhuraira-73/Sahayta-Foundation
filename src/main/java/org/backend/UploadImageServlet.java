package org.backend;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig; // Import this
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig  // Add this annotation
public class UploadImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ngo?useSSL=false";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "abu_1473";
    private static final String INSERT_QUERY = "INSERT INTO gallery (image_name, image_data) VALUES (?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get the uploaded file part and its name
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();

        // Get the file's input stream
        InputStream fileContent = filePart.getInputStream();

        if (fileName == null || fileName.isEmpty()) {
            out.println("<p style='color:red;'>Error: No file uploaded!</p>");
            return;
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
            // Prepare the SQL statement
            try (PreparedStatement ps = conn.prepareStatement(INSERT_QUERY)) {
                ps.setString(1, fileName); // Set image name
                ps.setBlob(2, fileContent); // Set image data (BLOB)

                int result = ps.executeUpdate();

                if (result > 0) {
                    out.println("<p style='color:green;'>Image uploaded successfully!</p>");
                } else {
                    out.println("<p style='color:red;'>Failed to upload the image.</p>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Database error occurred: " + e.getMessage() + "</p>");
        } finally {
            out.close();
        }
    }
}
