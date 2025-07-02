package org.backend;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ngo?useSSL=false";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "abu_1473";
    private static final String SELECT_IMAGE_QUERY = "SELECT image_data, image_name FROM gallery WHERE image_id = ?";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int imageId = Integer.parseInt(request.getParameter("image_id")); // Get the image ID from request

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement ps = conn.prepareStatement(SELECT_IMAGE_QUERY)) {
            
            ps.setInt(1, imageId); // Set the image ID in the query
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                byte[] imageData = rs.getBytes("image_data"); // Get the image data
                String imageName = rs.getString("image_name");

                response.setContentType("image/jpeg"); // Set content type as JPEG
                response.setContentLength(imageData.length); // Set content length for the image

                try (OutputStream out = response.getOutputStream()) {
                    out.write(imageData); // Write the image data to the response output stream
                    out.flush();
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        }
    }
}
