<%@ page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>All Donations - Sahayta Foundation</title>
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

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .error-message {
            color: red;
            font-size: 1.2em;
            text-align: center;
        }

        .filter-form {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-inline {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .form-inline input, .form-inline select, .form-inline button {
            height: 40px;
            padding: 0 15px;
            font-size: 1em;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
.form-inline button {
    background-color: #ff7f00; /* Orange color */
    color: white;
}

.form-inline button:hover {
    background-color: #e67e00; /* Darker orange color for hover */
}

        .form-inline select {
            width: 200px;
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
                    <h2>View <span class="color_big_heading">Donations</span></h2>
                    <ul class="breadcrumb_wrapper">
                        <li class="breadcrumb_item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb_item"><img src="../assets/img/icon/arrow.png" alt="img"></li>
                        <li class="breadcrumb_item active">View Donations</li>
                    </ul>
                    <!-- Added Back Link with Orange Button -->
                    <a href="admin-dashboard.jsp" class="btn btn-warning" style="margin-top: 20px;">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>
</section>


    <section id="donation_area" class="section_padding">
        <div class="container">
            <div class="filter-form">
                <form action="view-donations.jsp" method="get" class="form-inline">
                    <input type="text" name="search" id="search" placeholder="Search by name, phone or email" />
                    <button type="submit" class="btn btn-primary">Search</button>
                    <select name="sort" id="sort">
                        <option value="">Sort By</option>
                        <option value="date_asc">Date Ascending</option>
                        <option value="date_desc">Date Descending</option>
                        <option value="amount_asc">Amount Ascending</option>
                        <option value="amount_desc">Amount Descending</option>
                    </select>
                    
                    <button type="submit" name="action" value="sort" class="btn btn-primary">Sort</button>
                </form>
            </div>
            <h2>All Donations</h2>

            <div class="row">
                <div class="col-lg-12">
                    <table>
                        <thead>
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Amount</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String searchQuery = request.getParameter("search");
                                String sortQuery = request.getParameter("sort");

                                String query = "SELECT first_name, last_name, email, phone, address, amount, donation_date FROM donations";
                                if (searchQuery != null && !searchQuery.isEmpty()) {
                                    query += " WHERE first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR phone LIKE ?";
                                }

                                if (sortQuery != null && !sortQuery.isEmpty()) {
                                    switch (sortQuery) {
                                        case "date_asc":
                                            query += " ORDER BY donation_date ASC";
                                            break;
                                        case "date_desc":
                                            query += " ORDER BY donation_date DESC";
                                            break;
                                        case "amount_asc":
                                            query += " ORDER BY amount ASC";
                                            break;
                                        case "amount_desc":
                                            query += " ORDER BY amount DESC";
                                            break;
                                    }
                                }

                                try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ngo?useSSL=false", "root", "abu_1473");
                                     PreparedStatement ps = conn.prepareStatement(query)) {

                                    if (searchQuery != null && !searchQuery.isEmpty()) {
                                        String searchTerm = "%" + searchQuery + "%";
                                        ps.setString(1, searchTerm);
                                        ps.setString(2, searchTerm);
                                        ps.setString(3, searchTerm);
                                        ps.setString(4, searchTerm);
                                    }

                                    ResultSet rs = ps.executeQuery();

                                    boolean hasResults = false;
                                    while (rs.next()) {
                                        hasResults = true;
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
                                    if (!hasResults) {
                            %>
                                        <tr>
                                            <td colspan="7" class="error-message">No donations found.</td>
                                        </tr>
                            <%
                                    }
                                } catch (SQLException e) {
                                    out.println("<tr><td colspan='7' class='error-message'>Error: " + e.getMessage() + "</td></tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <!-- Top To Bottom Area -->
    <div class="go-top">
        <i class="fas fa-chevron-up"></i>
        <i class="fas fa-chevron-up"></i>
    </div>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.js"></script>
    <script src="../assets/js/jquery.meanmenu.js"></script>
    <script src="../assets/js/jquery.magnific-popup.min.js"></script>
    <script src="../assets/js/owl.carousel.min.js"></script>
    <script src="../assets/js/wow.min.js"></script>
    <script src="../assets/js/waypoints.min.js"></script>
    <script src="../assets/js/jquery.counterup.min.js"></script>
    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/custom-progress-bar.js"></script>
    <script src="../assets/js/custom-scroll-count.js"></script>
    <script src="../assets/js/video.js"></script>
    <script>
        fetch('../shared/header.jsp')
            .then(response => response.text())
            .then(data => document.getElementById('header-placeholder').innerHTML = data);
    </script>
</body>

</html>
