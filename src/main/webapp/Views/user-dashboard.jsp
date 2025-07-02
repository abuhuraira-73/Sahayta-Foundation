<%@ page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>User Dashboard - Sahayta Foundation</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/animate.min.css" />
    <link rel="stylesheet" href="../assets/css/fontawesome.all.min.css" />
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="../assets/css/owl.theme.default.min.css" />
    <link rel="stylesheet" href="../assets/css/navber.css" />
    <link rel="stylesheet" href="../assets/css/meanmenu.css" />
    <link rel="stylesheet" href="../assets/css/style.css" />
    <link rel="stylesheet" href="../assets/css/responsive.css" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: center;
            font-size: 1.2em;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        td {
            background-color: #fff;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>
    <div class="preloader">
        <div class="d-table">
            <div class="d-table-cell">
                <div class="lds-spinner">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        </div>
    </div>

    <div id="header-placeholder"></div>

    <section id="common_banner_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="commn_banner_page">
                        <h2>User <span class="color_big_heading">Dashboard</span></h2>
                        <ul class="breadcrumb_wrapper">
                            <li class="breadcrumb_item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb_item"><img src="../assets/img/icon/arrow.png" alt="img"></li>
                            <li class="breadcrumb_item active">User Dashboard</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="make_donation_area" class="section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="section_heading">
                        <h3>Your Information</h3>
                        <h2><span class="color_big_heading">Welcome</span> to your dashboard</h2>
                    </div>
                </div>
            </div>

            <!-- Donation Details Table -->
            <div class="row" id="donation-info">
                <div class="col-lg-12">
                    <div class="details_wrapper_area">
                        <h4>Your Donations</h4>
                        <!-- Table to display donation history -->
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">First Name</th>
                                    <th scope="col">Last Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    // Retrieve user email from session
                                    String userEmail = (String) session.getAttribute("userEmail");

                                if (userEmail != null && !userEmail.isEmpty()) {
                                        // SQL connection setup
                                        String jdbcURL = "jdbc:mysql://localhost:3306/ngo?useSSL=false";
                                        String jdbcUsername = "root";
                                        String jdbcPassword = "abu_1473";
                                        String selectQuery = "SELECT first_name, last_name, email, phone, address, amount, donation_date FROM donations WHERE email = ?";

                                        try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                                             PreparedStatement ps = conn.prepareStatement(selectQuery)) {

                                            ps.setString(1, userEmail);
                                            ResultSet rs = ps.executeQuery();

                                            // Loop through result set and display donation data
                                            while (rs.next()) {
                                                String firstName = rs.getString("first_name");
                                                String lastName = rs.getString("last_name");
                                                String email = rs.getString("email");
                                                String phone = rs.getString("phone");
                                                String address = rs.getString("address");
                                                String amount = rs.getString("amount");
                                                String donationDate = rs.getString("donation_date");
                                %>
                                                <tr>
                                                    <td><%= firstName %></td>
                                                    <td><%= lastName %></td>
                                                    <td><%= email %></td>
                                                    <td><%= phone %></td>
                                                    <td><%= address %></td>
                                                    <td><%= amount %></td>
                                                    <td><%= donationDate %></td>
                                                </tr>
                                <%
                                            }
                                        } catch (SQLException e) {
                                            out.println("<tr><td colspan='7'>Error retrieving donation data: " + e.getMessage() + "</td></tr>");
                                        }
                                    } else {
                                        out.println("<tr><td colspan='7'>No donations found. Please make a donation first.</td></tr>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery.meanmenu.js"></script>
    <script src="../assets/js/owl.carousel.min.js"></script>
    <script src="../assets/js/wow.min.js"></script>
    <script src="../assets/js/waypoints.min.js"></script>
    <script src="../assets/js/jquery.counterup.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/custom-progress-bar.js"></script>
    <script src="../assets/js/custom-scroll-count.js"></script>

    <script>
        // Load header from the shared folder
        fetch('../shared/header.jsp')
            .then(response => response.text())
            .then(data => document.getElementById('header-placeholder').innerHTML = data);
    </script>

</body>

</html>
